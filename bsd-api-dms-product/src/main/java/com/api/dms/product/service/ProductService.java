package com.api.dms.product.service;

import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.api.dms.product.db.entity.TbBrand;
import com.api.dms.product.db.entity.TbGwp;
import com.api.dms.product.db.entity.TbProduct;
import com.api.dms.product.db.entity.TbProductBundle;
import com.api.dms.product.db.entity.TbProductConfirm;
import com.api.dms.product.db.entity.TbProductMarket;
import com.api.dms.product.db.entity.TbUser;
import com.api.dms.product.db.entity.TbUserBrand;
import com.api.dms.product.db.entity.TbUserMarket;
import com.api.dms.product.db.entity.ViewBrandProduct;
import com.api.dms.product.db.entity.ViewGwpSkuProduct;
import com.api.dms.product.db.entity.ViewProductMarket;
import com.api.dms.product.db.repository.TbBrandRepository;
import com.api.dms.product.db.repository.TbGwpRepository;
import com.api.dms.product.db.repository.TbProductBundleRepository;
import com.api.dms.product.db.repository.TbProductConfirmRepository;
import com.api.dms.product.db.repository.TbProductMarketRepository;
import com.api.dms.product.db.repository.TbProductRepository;
import com.api.dms.product.db.repository.TbUserBrandRepository;
import com.api.dms.product.db.repository.TbUserMarketRepository;
import com.api.dms.product.db.repository.TbUserRepository;
import com.api.dms.product.db.repository.ViewBrandProductRepository;
import com.api.dms.product.db.repository.ViewGwpSkuProductRepository;
import com.api.dms.product.db.repository.ViewProductMarketRepository;
import com.api.dms.product.model.order.PostSyncBrandRequestModel;
import com.api.dms.product.model.product.GetBrandRequestModel;
import com.api.dms.product.model.product.GetBrandResponseModel;
import com.api.dms.product.model.product.GetProductListRequestModel;
import com.api.dms.product.model.product.GetProductListResponseModel;
import com.api.dms.product.model.product.GetProductMarketListRequestModel;
import com.api.dms.product.model.product.GetProductMarketListResponseModel;
import com.api.dms.product.model.product.GetProductRequestModel;
import com.api.dms.product.model.product.GetProductResponseModel;
import com.api.dms.product.model.product.GetProductsResponseModel;
import com.api.dms.product.model.product.PostProductAddRequestModel;
import com.api.dms.product.model.product.PostProductAddResponseModel;
import com.api.dms.product.model.product.PostProductConfirmRequestModel;
import com.api.dms.product.model.product.PostProductConfirmResponseModel;
import com.api.dms.product.model.product.PostProductDeleteRequestModel;
import com.api.dms.product.model.product.PostProductDeleteResponseModel;
import com.api.dms.product.model.product.PostProductEditRequestModel;
import com.api.dms.product.model.product.PostProductEditResponseModel;
import com.api.dms.product.model.product.PostUploadProductBundleRequestModel;
import com.api.dms.product.model.product.PostUploadProductBundleResponseModel;
import com.api.dms.product.model.product.PostUploadProductRequestModel;
import com.api.dms.product.model.product.PostUploadProductResponseModel;
import com.api.dms.product.model.report.PostSyncProductRequestModel;
import com.api.dms.product.util.SimpleMapper;
import com.api.dms.product.util.TokenUtil;
import com.api.dms.product.util.Uid;

@Service
public class ProductService {

	private Logger log = LoggerFactory.getLogger(ProductService.class);
	
	@Autowired
	private Environment env;
	
	private TokenUtil tokenUtil = new TokenUtil();
	
	@Autowired
	private TbUserRepository tbUserRepository;
	
	@Autowired
	private TbProductRepository tbProductRepository;
	
	@Autowired
	private TbProductBundleRepository tbProductBundleRepository;
	
	@Autowired
	private ViewBrandProductRepository viewBrandProductRepository;
	
	@Autowired
	private TbBrandRepository tbBrandRepository;
	
	@Autowired
	private TbUserBrandRepository tbUserBrandRepository;
	
	@Autowired
	private TbGwpRepository tbGwpRepository;
	
	@Autowired
	private ViewGwpSkuProductRepository viewGwpSkuProductRepository;
	
	@Autowired
	private TbProductConfirmRepository tbProductConfirmRepository;
	
	@Autowired
	private TbUserMarketRepository tbUserMarketRepository;
	
	@Autowired
	private TbProductMarketRepository tbProductMarketRepository;
	
	@Autowired
	private ViewProductMarketRepository viewProductMarketRepository;
	
	public PostUploadProductBundleResponseModel postUploadProductBundle(PostUploadProductBundleRequestModel requestModel, MultipartFile file) throws Exception {
		PostUploadProductBundleResponseModel responseModel = new PostUploadProductBundleResponseModel(requestModel);

		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			String fileName = responseModel.getResponseId() + "-" + StringUtils.cleanPath(file.getOriginalFilename());
			Files.copy(file.getInputStream(), Paths.get(env.getProperty("file.upload.dir") + fileName), StandardCopyOption.REPLACE_EXISTING);
			
			Workbook workbook = new XSSFWorkbook(file.getInputStream());
			
			Map<String, Integer> column = new HashedMap<String, Integer>();
			
			Sheet sheet = workbook.getSheetAt(0);
			
			int rowNum = 0;
			
			Map<String, TbProduct> mapTbProduct = new HashMap<String, TbProduct>();
			List<TbProduct> lstTbProduct = new ArrayList<TbProduct>();
			
			Map<String, TbProductBundle> mapTbProductBundle = new HashMap<String, TbProductBundle>();
			List<TbProductBundle> lstTbProductBundle = new ArrayList<TbProductBundle>();
			
			Uid uid = new Uid();
			
			for (Row row : sheet) {
				if (rowNum == 0) {
					int cellNum = 0;
					
					for (Cell cell : row) {
						column.put(cell.getStringCellValue(), cellNum);
						
						cellNum++;
					}
				} else {
					if (row.getCell(0) != null) {
						TbProduct exampleTbProduct = new TbProduct();
						
						if (getData(row, column, "Sku Bundle") == null || getData(row, column, "Sku Bundle").equals("")) {
							exampleTbProduct.setTbpSku(uid.generateString(10));
						} else {
							exampleTbProduct.setTbpSku((String) getData(row, column, "Sku Bundle"));
						}						
						
						Optional<TbProduct> optTbProduct = tbProductRepository.findOne(Example.of(exampleTbProduct));
						TbProduct tbProduct;
						
						while ((getData(row, column, "Sku Bundle") == null || getData(row, column, "Sku Bundle").equals("")) && optTbProduct.isPresent()) {
							exampleTbProduct.setTbpSku(uid.generateString(10));
							optTbProduct = tbProductRepository.findOne(Example.of(exampleTbProduct));
						}
						
						if (optTbProduct.isPresent()) {
							tbProduct = optTbProduct.get();
							tbProduct.setTbpUpdateDate(Date.from(LocalDateTime.now(ZoneOffset.UTC).toInstant(ZoneOffset.UTC)));
							tbProduct.setTbpUpdateId(optTbUser.get().getTbuId());
						} else {
							tbProduct = new TbProduct();
							tbProduct.setTbpCreateDate(Date.from(LocalDateTime.now(ZoneOffset.UTC).toInstant(ZoneOffset.UTC)));
							tbProduct.setTbpCreateId(optTbUser.get().getTbuId());
							tbProduct.setTbpSku(exampleTbProduct.getTbpSku());
						}
						
						tbProduct.setTbbBrand((String) getData(row, column, "Brand"));
						tbProduct.setTbbBrandId(tbProduct.getTbbBrand().equals("BEBE") ? tbProduct.getTbbBrand().substring(0, 4).toUpperCase() + "B" : tbProduct.getTbbBrand().substring(0, 5).toUpperCase());							
						tbProduct.setTbpItem((String) getData(row, column, "Item"));
						tbProduct.setTbpCode((String) getData(row, column, "Code"));
						tbProduct.setTbpType(TbProductRepository.Sellable);
						tbProduct.setTbpStatus(null);
						
						if (mapTbProduct.get(tbProduct.getTbpSku()) == null) {
							mapTbProduct.put(tbProduct.getTbpSku(), tbProduct);
							lstTbProduct.add(tbProduct);
						}
						
						TbProductBundle exampleTbProductBundle = new TbProductBundle();
						exampleTbProductBundle.setTbpbSku(exampleTbProduct.getTbpSku());
						exampleTbProductBundle.setTbpSku((String) getData(row, column, "Sku"));
						
						Optional<TbProductBundle> optTbProductBundle = tbProductBundleRepository.findOne(Example.of(exampleTbProductBundle));
						
						if (optTbProductBundle.isPresent()) {
							tbProductBundleRepository.delete(optTbProductBundle.get());							
						}
						
						if (((Double) getData(row, column, "Qty")).intValue() > 0) {
							TbProductBundle tbProductBundle = new TbProductBundle();
							tbProductBundle.setTbpbCreateDate(Date.from(LocalDateTime.now(ZoneOffset.UTC).toInstant(ZoneOffset.UTC)));
							tbProductBundle.setTbpbCreateId(optTbUser.get().getTbuId());
							tbProductBundle.setTbpbSku(tbProduct.getTbpSku());
							tbProductBundle.setTbpbItem((String) getData(row, column, "Item"));
							tbProductBundle.setTbpSku((String) getData(row, column, "Sku"));								
							if (getData(row, column, "Qty Type").equals("INI")) tbProductBundle.setTbpQty(((Double) getData(row, column, "Qty")).intValue());
							if (getData(row, column, "Qty Type").equals("ADD")) tbProductBundle.setTbpQty(tbProductBundle.getTbpQty() + ((Double) getData(row, column, "Qty")).intValue());
							
							if (mapTbProductBundle.get(tbProductBundle.getTbpSku()) == null) {
								mapTbProductBundle.put(tbProductBundle.getTbpSku(), tbProductBundle);
								lstTbProductBundle.add(tbProductBundle);
							}							
						}						
					}
				}
				rowNum++;
			}
			
			workbook.close();
			
			responseModel.setFileName(fileName);
			
			tbProductRepository.saveAll(lstTbProduct);
			tbProductBundleRepository.saveAll(lstTbProductBundle);
			
			TbUserMarket exampleTbUserMarket = new TbUserMarket();
			exampleTbUserMarket.setTbuId(optTbUser.get().getTbuId());
			List<TbUserMarket> lstTbUserMarket = tbUserMarketRepository.findAll(Example.of(exampleTbUserMarket));
			
			SimpleMapper simpleMapper = new SimpleMapper();
			
			List<com.api.dms.product.model.report.TbProduct> lstTbProductReport = new ArrayList<com.api.dms.product.model.report.TbProduct>();
			
			for (TbProduct tbProduct : lstTbProduct) {					
				com.api.dms.product.model.report.TbProduct tbProductReport = new com.api.dms.product.model.report.TbProduct();
				tbProductReport = (com.api.dms.product.model.report.TbProduct) simpleMapper.assign(tbProduct, tbProductReport);

				List<com.api.dms.product.model.report.TbProductMarket> lstTbProductMarketReport = new ArrayList<com.api.dms.product.model.report.TbProductMarket>();
				
				for (TbUserMarket tbUserMarket : lstTbUserMarket) {
					TbProductMarket tbProductMarket = new TbProductMarket();
					tbProductMarket.setTbpmCreateDate(new Date());
					tbProductMarket.setTbpmCreateId(optTbUser.get().getTbuId());
					tbProductMarket.setTbpId(tbProduct.getTbpId());
					tbProductMarket.setTbpSku(tbProduct.getTbpSku());
					tbProductMarket.setTbmMarketId(tbUserMarket.getTbmMarketId());
					tbProductMarket.setTbmMarketCheck(tbUserMarket.getTbmMarketCheck());
					
					tbProductMarketRepository.save(tbProductMarket);
										
					com.api.dms.product.model.report.TbProductMarket tbProductMarketReport = new com.api.dms.product.model.report.TbProductMarket();
					tbProductMarketReport = (com.api.dms.product.model.report.TbProductMarket) simpleMapper.assign(tbProductMarket, tbProductMarketReport);
					lstTbProductMarketReport.add(tbProductMarketReport);
				}

				tbProductReport.setLstTbProductMarket(lstTbProductMarketReport);
	
				lstTbProductReport.add(tbProductReport);
			}
			
			PostSyncProductRequestModel postSyncProductRequestModel = new PostSyncProductRequestModel();
			postSyncProductRequestModel.setRequestDate(requestModel.getRequestDate());
			postSyncProductRequestModel.setRequestId(requestModel.getRequestId());
			postSyncProductRequestModel.setEmail(requestModel.getEmail());
			postSyncProductRequestModel.setLstTbProduct(lstTbProductReport);
			
			HttpEntity<PostSyncProductRequestModel> request = new HttpEntity<>(postSyncProductRequestModel);
			RestTemplate restTemplate = new RestTemplate();
			restTemplate.postForEntity(env.getProperty("services.bsd.api.dms.report.postsyncproduct"), request, String.class);
			
			responseModel.setStatus("200");
			responseModel.setMessage("Upload ok");
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Upload failed");
		}

		return responseModel;
	}
	
	public PostUploadProductResponseModel postUploadProduct(PostUploadProductRequestModel requestModel, MultipartFile file) throws Exception {
		PostUploadProductResponseModel responseModel = new PostUploadProductResponseModel(requestModel);

		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			String fileName = responseModel.getResponseId() + "-" + StringUtils.cleanPath(file.getOriginalFilename());
			Files.copy(file.getInputStream(), Paths.get(env.getProperty("file.upload.dir") + fileName), StandardCopyOption.REPLACE_EXISTING);
			
			Workbook workbook = new XSSFWorkbook(file.getInputStream());
			
			Map<String, Integer> column = new HashedMap<String, Integer>();
			
			Sheet sheet = workbook.getSheetAt(0);
			
			int rowNum = 0;
			
			List<TbProduct> lstTbProduct = new ArrayList<TbProduct>();
			
			Uid uid = new Uid();
			
			for (Row row : sheet) {
				if (rowNum == 0) {
					int cellNum = 0;
					
					for (Cell cell : row) {
						column.put(cell.getStringCellValue(), cellNum);
						
						cellNum++;
					}
				} else {
					if (row.getCell(0) != null) {
						TbProduct exampleTbProduct = new TbProduct();
						
						if (getData(row, column, "Sku") == null || getData(row, column, "Sku").equals("")) {
							exampleTbProduct.setTbpSku(uid.generateString(10));
						} else {
							if (getData(row, column, "Sku").getClass().equals(Double.valueOf(0).getClass())) {
								exampleTbProduct.setTbpSku(new BigDecimal((Double) getData(row, column, "Sku")).toString());								
							} else if (getData(row, column, "Sku").getClass().equals("".getClass())) {
								exampleTbProduct.setTbpSku((String) getData(row, column, "Sku"));
							}
						}
						
						Optional<TbProduct> optTbProduct = tbProductRepository.findOne(Example.of(exampleTbProduct));
						TbProduct tbProduct;
						
						while ((getData(row, column, "Sku") == null || getData(row, column, "Sku").equals("")) && optTbProduct.isPresent()) {
							exampleTbProduct.setTbpSku(uid.generateString(10));
							optTbProduct = tbProductRepository.findOne(Example.of(exampleTbProduct));
						}
						
						if (optTbProduct.isPresent()) {
							tbProduct = optTbProduct.get();
							tbProduct.setTbpUpdateDate(Date.from(LocalDateTime.now(ZoneOffset.UTC).toInstant(ZoneOffset.UTC)));
							tbProduct.setTbpUpdateId(optTbUser.get().getTbuId());
						} else {
							tbProduct = new TbProduct();
							tbProduct.setTbpCreateDate(Date.from(LocalDateTime.now(ZoneOffset.UTC).toInstant(ZoneOffset.UTC)));
							tbProduct.setTbpCreateId(optTbUser.get().getTbuId());
							tbProduct.setTbpSku(exampleTbProduct.getTbpSku());
						}
						
						tbProduct.setTbbBrand((String) getData(row, column, "Brand"));
						
						int a = tbProduct.getTbbBrand().length();
						String strBrand = tbProduct.getTbbBrand().trim().replaceAll(" ", "").replaceAll("&", "N");
						
						if (a < 5) {
							tbProduct.setTbbBrandId(strBrand.substring(0, a).toUpperCase() + strBrand.substring(0, 5 - a).toUpperCase());
						} else {
							tbProduct.setTbbBrandId(strBrand.substring(0, 5).toUpperCase());
						}
						
						tbProduct.setTbpItem((String) getData(row, column, "Item"));
						tbProduct.setTbpCode((String) getData(row, column, "Code"));
						tbProduct.setTbpLoc((String) getData(row, column, "Loc"));						
						if (getData(row, column, "Qty Type").equals("INI")) tbProduct.setTbpQty(((Double) getData(row, column, "Qty")).intValue());
						if (getData(row, column, "Qty Type").equals("ADD")) tbProduct.setTbpQty(tbProduct.getTbpQty() + ((Double) getData(row, column, "Qty")).intValue());
						
						tbProduct.setTbpUnitPrice(new BigDecimal((Double) getData(row, column, "Unit Price")));
						tbProduct.setTbpType((String) getData(row, column, "Type"));
						tbProduct.setTbpStatus(TbProductRepository.Sellable);
						
						lstTbProduct.add(tbProduct);						
					}
				}
				rowNum++;
			}
			
			workbook.close();
			
			responseModel.setFileName(fileName);
			
			tbProductRepository.saveAll(lstTbProduct);
			
			TbUserMarket exampleTbUserMarket = new TbUserMarket();
			exampleTbUserMarket.setTbuId(optTbUser.get().getTbuId());
			List<TbUserMarket> lstTbUserMarket = tbUserMarketRepository.findAll(Example.of(exampleTbUserMarket));

			SimpleMapper simpleMapper = new SimpleMapper();

			List<com.api.dms.product.model.user.TbBrand> lstTbBrandMember = new ArrayList<com.api.dms.product.model.user.TbBrand>();
			List<com.api.dms.product.model.user.TbUserBrand> lstTbUserBrandMember = new ArrayList<com.api.dms.product.model.user.TbUserBrand>();
			
			List<com.api.dms.product.model.order.TbBrand> lstTbBrandOrder = new ArrayList<com.api.dms.product.model.order.TbBrand>();
			List<com.api.dms.product.model.order.TbUserBrand> lstTbUserBrandOrder = new ArrayList<com.api.dms.product.model.order.TbUserBrand>();

			List<com.api.dms.product.model.report.TbBrand> lstTbBrandReport = new ArrayList<com.api.dms.product.model.report.TbBrand>();
			List<com.api.dms.product.model.report.TbUserBrand> lstTbUserBrandReport = new ArrayList<com.api.dms.product.model.report.TbUserBrand>();
			
			for (TbProduct tbProduct : lstTbProduct) {
				TbBrand exampleTbBrand = new TbBrand();
				exampleTbBrand.setTbbBrand(tbProduct.getTbbBrand());
				
				Optional<TbBrand> optTbBrand = tbBrandRepository.findOne(Example.of(exampleTbBrand));
				
				if (optTbBrand.isPresent() == false) {
					TbBrand tbBrand = new TbBrand();
					tbBrand.setTbbCreateDate(new Date());
					tbBrand.setTbbCreateId(optTbUser.get().getTbuId());
					tbBrand.setTbbBrand(tbProduct.getTbbBrand());
					tbBrand.setTbbBrandId(tbProduct.getTbbBrandId());
					
					tbBrandRepository.save(tbBrand);
					
					if (optTbUser.get().getTbuId() == 1) {
						TbUserBrand tbUserBrandAdmin = new TbUserBrand();
						tbUserBrandAdmin.setTbubCreateDate(new Date());
						tbUserBrandAdmin.setTbubCreateId(optTbUser.get().getTbuId());
						tbUserBrandAdmin.setTbuId(1);
						tbUserBrandAdmin.setTbbBrand(tbBrand.getTbbBrand());
						tbUserBrandAdmin.setTbbBrandId(tbBrand.getTbbBrandId());
						tbUserBrandAdmin.setTbbBrandCheck(1);
						tbUserBrandRepository.save(tbUserBrandAdmin);											
					
						com.api.dms.product.model.user.TbUserBrand tbUserBrandMember = new com.api.dms.product.model.user.TbUserBrand();
						tbUserBrandMember = (com.api.dms.product.model.user.TbUserBrand) simpleMapper.assign(tbUserBrandAdmin, tbUserBrandMember);
						lstTbUserBrandMember.add(tbUserBrandMember);									
					
						com.api.dms.product.model.order.TbUserBrand tbUserBrandOrder = new com.api.dms.product.model.order.TbUserBrand();
						tbUserBrandOrder = (com.api.dms.product.model.order.TbUserBrand) simpleMapper.assign(tbUserBrandAdmin, tbUserBrandOrder);
						lstTbUserBrandOrder.add(tbUserBrandOrder);									
					
						com.api.dms.product.model.report.TbUserBrand tbUserBrandReport = new com.api.dms.product.model.report.TbUserBrand();
						tbUserBrandReport = (com.api.dms.product.model.report.TbUserBrand) simpleMapper.assign(tbUserBrandAdmin, tbUserBrandReport);
						lstTbUserBrandReport.add(tbUserBrandReport);
					} else {
						TbUserBrand tbUserBrandAdmin = new TbUserBrand();
						tbUserBrandAdmin.setTbubCreateDate(new Date());
						tbUserBrandAdmin.setTbubCreateId(optTbUser.get().getTbuId());
						tbUserBrandAdmin.setTbuId(1);
						tbUserBrandAdmin.setTbbBrand(tbBrand.getTbbBrand());
						tbUserBrandAdmin.setTbbBrandId(tbBrand.getTbbBrandId());
						tbUserBrandAdmin.setTbbBrandCheck(1);
						tbUserBrandRepository.save(tbUserBrandAdmin);
					
						com.api.dms.product.model.user.TbUserBrand tbUserBrandMember = new com.api.dms.product.model.user.TbUserBrand();
						tbUserBrandMember = (com.api.dms.product.model.user.TbUserBrand) simpleMapper.assign(tbUserBrandAdmin, tbUserBrandMember);
						lstTbUserBrandMember.add(tbUserBrandMember);									
					
						com.api.dms.product.model.order.TbUserBrand tbUserBrandOrder = new com.api.dms.product.model.order.TbUserBrand();
						tbUserBrandOrder = (com.api.dms.product.model.order.TbUserBrand) simpleMapper.assign(tbUserBrandAdmin, tbUserBrandOrder);
						lstTbUserBrandOrder.add(tbUserBrandOrder);									
					
						com.api.dms.product.model.report.TbUserBrand tbUserBrandReport = new com.api.dms.product.model.report.TbUserBrand();
						tbUserBrandReport = (com.api.dms.product.model.report.TbUserBrand) simpleMapper.assign(tbUserBrandAdmin, tbUserBrandReport);
						lstTbUserBrandReport.add(tbUserBrandReport);
						
						TbUserBrand tbUserBrand = new TbUserBrand();
						tbUserBrand.setTbubCreateDate(new Date());
						tbUserBrand.setTbubCreateId(optTbUser.get().getTbuId());
						tbUserBrand.setTbuId(optTbUser.get().getTbuId());
						tbUserBrand.setTbbBrand(tbBrand.getTbbBrand());
						tbUserBrand.setTbbBrandId(tbBrand.getTbbBrandId());
						tbUserBrand.setTbbBrandCheck(1);
						tbUserBrandRepository.save(tbUserBrand);	
										
						tbUserBrandMember = new com.api.dms.product.model.user.TbUserBrand();
						tbUserBrandMember = (com.api.dms.product.model.user.TbUserBrand) simpleMapper.assign(tbUserBrand, tbUserBrandMember);
						lstTbUserBrandMember.add(tbUserBrandMember);									
					
						tbUserBrandOrder = new com.api.dms.product.model.order.TbUserBrand();
						tbUserBrandOrder = (com.api.dms.product.model.order.TbUserBrand) simpleMapper.assign(tbUserBrand, tbUserBrandOrder);
						lstTbUserBrandOrder.add(tbUserBrandOrder);									
					
						tbUserBrandReport = new com.api.dms.product.model.report.TbUserBrand();
						tbUserBrandReport = (com.api.dms.product.model.report.TbUserBrand) simpleMapper.assign(tbUserBrand, tbUserBrandReport);
						lstTbUserBrandReport.add(tbUserBrandReport);
					}
					
					com.api.dms.product.model.user.TbBrand tbBrandMember = new com.api.dms.product.model.user.TbBrand();
					tbBrandMember = (com.api.dms.product.model.user.TbBrand) simpleMapper.assign(tbBrand, tbBrandMember);
					lstTbBrandMember.add(tbBrandMember);
					
					com.api.dms.product.model.order.TbBrand tbBrandOrder = new com.api.dms.product.model.order.TbBrand();
					tbBrandOrder = (com.api.dms.product.model.order.TbBrand) simpleMapper.assign(tbBrand, tbBrandOrder);
					lstTbBrandOrder.add(tbBrandOrder);
					
					com.api.dms.product.model.report.TbBrand tbBrandReport = new com.api.dms.product.model.report.TbBrand();
					tbBrandReport = (com.api.dms.product.model.report.TbBrand) simpleMapper.assign(tbBrand, tbBrandReport);
					lstTbBrandReport.add(tbBrandReport);
				}
			}

			com.api.dms.product.model.user.PostSyncBrandRequestModel postSyncBrandMemberRequestModel = new com.api.dms.product.model.user.PostSyncBrandRequestModel();
			postSyncBrandMemberRequestModel.setRequestDate(requestModel.getRequestDate());
			postSyncBrandMemberRequestModel.setRequestId(requestModel.getRequestId());
			postSyncBrandMemberRequestModel.setEmail(requestModel.getEmail());
			postSyncBrandMemberRequestModel.setLstTbBrand(lstTbBrandMember);
			postSyncBrandMemberRequestModel.setLstTbUserBrand(lstTbUserBrandMember);
			
			HttpEntity<com.api.dms.product.model.user.PostSyncBrandRequestModel> requestPostSyncBrandMemberRequestModel = new HttpEntity<>(postSyncBrandMemberRequestModel);
			RestTemplate restTemplatePostSyncBrandMemberRequestModel = new RestTemplate();
			restTemplatePostSyncBrandMemberRequestModel.postForEntity(env.getProperty("services.bsd.api.dms.member.postsyncbrand"), requestPostSyncBrandMemberRequestModel, String.class);
			
			PostSyncBrandRequestModel postSyncBrandOrderRequestModel = new PostSyncBrandRequestModel();
			postSyncBrandOrderRequestModel.setRequestDate(requestModel.getRequestDate());
			postSyncBrandOrderRequestModel.setRequestId(requestModel.getRequestId());
			postSyncBrandOrderRequestModel.setEmail(requestModel.getEmail());
			postSyncBrandOrderRequestModel.setLstTbBrand(lstTbBrandOrder);
			postSyncBrandOrderRequestModel.setLstTbUserBrand(lstTbUserBrandOrder);
			
			HttpEntity<PostSyncBrandRequestModel> requestPostSyncBrandOrderRequestModel = new HttpEntity<>(postSyncBrandOrderRequestModel);
			RestTemplate restTemplatePostSyncBrandOrderRequestModel = new RestTemplate();
			restTemplatePostSyncBrandOrderRequestModel.postForEntity(env.getProperty("services.bsd.api.dms.order.postsyncbrand"), requestPostSyncBrandOrderRequestModel, String.class);

			com.api.dms.product.model.report.PostSyncBrandRequestModel postSyncBrandReportRequestModel = new com.api.dms.product.model.report.PostSyncBrandRequestModel();
			postSyncBrandReportRequestModel.setRequestDate(requestModel.getRequestDate());
			postSyncBrandReportRequestModel.setRequestId(requestModel.getRequestId());
			postSyncBrandReportRequestModel.setEmail(requestModel.getEmail());
			postSyncBrandReportRequestModel.setLstTbBrand(lstTbBrandReport);
			postSyncBrandReportRequestModel.setLstTbUserBrand(lstTbUserBrandReport);
			
			HttpEntity<com.api.dms.product.model.report.PostSyncBrandRequestModel> requestPostSyncBrandReportRequestModel = new HttpEntity<>(postSyncBrandReportRequestModel);
			RestTemplate restTemplatePostSyncBrandReportRequestModel = new RestTemplate();
			restTemplatePostSyncBrandReportRequestModel.postForEntity(env.getProperty("services.bsd.api.dms.report.postsyncbrand"), requestPostSyncBrandReportRequestModel, String.class);

			List<com.api.dms.product.model.report.TbProduct> lstTbProductReport = new ArrayList<com.api.dms.product.model.report.TbProduct>();
			
			for (TbProduct tbProduct : lstTbProduct) {
				com.api.dms.product.model.report.TbProduct tbProductReport = new com.api.dms.product.model.report.TbProduct();
				tbProductReport = (com.api.dms.product.model.report.TbProduct) simpleMapper.assign(tbProduct, tbProductReport);

				List<com.api.dms.product.model.report.TbProductMarket> lstTbProductMarketReport = new ArrayList<com.api.dms.product.model.report.TbProductMarket>();
				
				for (TbUserMarket tbUserMarket : lstTbUserMarket) {
					TbProductMarket tbProductMarket = new TbProductMarket();
					tbProductMarket.setTbpmCreateDate(new Date());
					tbProductMarket.setTbpmCreateId(optTbUser.get().getTbuId());
					tbProductMarket.setTbpId(tbProduct.getTbpId());
					tbProductMarket.setTbpSku(tbProduct.getTbpSku());
					tbProductMarket.setTbmMarketId(tbUserMarket.getTbmMarketId());
					tbProductMarket.setTbmMarketCheck(tbUserMarket.getTbmMarketCheck());
					
					tbProductMarketRepository.save(tbProductMarket);
					
					com.api.dms.product.model.report.TbProductMarket tbProductMarketReport = new com.api.dms.product.model.report.TbProductMarket();
					tbProductMarketReport = (com.api.dms.product.model.report.TbProductMarket) simpleMapper.assign(tbProductMarket, tbProductMarketReport);
					lstTbProductMarketReport.add(tbProductMarketReport);
				}	
				
				tbProductReport.setLstTbProductMarket(lstTbProductMarketReport);
				
				lstTbProductReport.add(tbProductReport);
			}
			
			PostSyncProductRequestModel postSyncProductRequestModel = new PostSyncProductRequestModel();
			postSyncProductRequestModel.setRequestDate(requestModel.getRequestDate());
			postSyncProductRequestModel.setRequestId(requestModel.getRequestId());
			postSyncProductRequestModel.setEmail(requestModel.getEmail());
			postSyncProductRequestModel.setLstTbProduct(lstTbProductReport);
			
			HttpEntity<PostSyncProductRequestModel> requestPostSyncProductRequestModel = new HttpEntity<>(postSyncProductRequestModel);
			RestTemplate restTemplatePostSyncProductRequestModel = new RestTemplate();
			restTemplatePostSyncProductRequestModel.postForEntity(env.getProperty("services.bsd.api.dms.report.postsyncproduct"), requestPostSyncProductRequestModel, String.class);
			
			responseModel.setStatus("200");
			responseModel.setMessage("Upload ok");	
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Upload failed");
		}

		return responseModel;
	}
	
	@SuppressWarnings("deprecation")
	private Object getData(Row row, Map<String, Integer> column, String key) {
		log.info(key + " : " + row.getCell(column.get(key)));
		
		Cell cell = row.getCell(column.get(key));
		
		if (cell != null) {
			if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
				return cell.getStringCellValue();  
			} else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
				return cell.getNumericCellValue(); 
			} else if (cell.getCellType() == Cell.CELL_TYPE_FORMULA) {
				return cell.getNumericCellValue();
			} else {
				return null;
			}
		} else {
			return null;
		}
	}
	
	public GetProductListResponseModel getProductList(String brand, String sku, String item, String code, String type, String length, String pageSize, String pageIndex, GetProductListRequestModel requestModel) throws Exception {
		GetProductListResponseModel responseModel = new GetProductListResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));

		if (optTbUser.isPresent()) {
			List<ViewBrandProduct> lstViewBrandProduct = viewBrandProductRepository.findAllByTbuId(optTbUser.get().getTbuId(), brand, sku, item, code, type, PageRequest.of(Integer.valueOf(pageIndex), Integer.valueOf(pageSize), Sort.by("tbbId", "tbpId").ascending()));
			
			if (lstViewBrandProduct.size() > 0) {
				responseModel.setLstViewBrandProduct(lstViewBrandProduct);
				
				responseModel.setLength(viewBrandProductRepository.countAllByTbuId(optTbUser.get().getTbuId(), brand, sku, item, code, type));
				
				responseModel.setStatus("200");
				responseModel.setMessage("Get Product List ok");
			} else {
				responseModel.setStatus("404");
				responseModel.setMessage("Not found");
			}
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}

	public GetProductMarketListResponseModel getProductMarketList(Integer tbpId, String length, String pageSize, String pageIndex, GetProductMarketListRequestModel requestModel) throws Exception {
		GetProductMarketListResponseModel responseModel = new GetProductMarketListResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));

		if (optTbUser.isPresent()) {
			TbUserMarket exampleTbUserMarket = new TbUserMarket();
			exampleTbUserMarket.setTbuId(optTbUser.get().getTbuId());
			exampleTbUserMarket.setTbmMarketCheck(1);
			List<TbUserMarket> lstTbUserMarket = tbUserMarketRepository.findAll(Example.of(exampleTbUserMarket));
			
			List<String> lstTbmMarketId = new ArrayList<>();
			for (TbUserMarket tbUserMarket : lstTbUserMarket) {
				lstTbmMarketId.add(tbUserMarket.getTbmMarketId());
			}
			
			List<ViewProductMarket> lstViewProductMarket = viewProductMarketRepository.findByTbpIdAndTbmMarketIdIn(tbpId, lstTbmMarketId, PageRequest.of(Integer.valueOf(pageIndex), Integer.valueOf(pageSize), Sort.by("tbpmId", "tbpmId").ascending()));
			
			responseModel.setLstViewProductMarket(lstViewProductMarket);
				
			responseModel.setStatus("200");
			responseModel.setMessage("Get Product List ok");
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
	
	public PostProductAddResponseModel postProductAdd(PostProductAddRequestModel requestModel) throws Exception {
		PostProductAddResponseModel responseModel = new PostProductAddResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			
			TbProduct exampleTbProduct = new TbProduct();
			exampleTbProduct.setTbpSku(requestModel.getTbpSku());
			Optional<TbProduct> optTbProduct = tbProductRepository.findOne(Example.of(exampleTbProduct));
			
			optTbProduct.ifPresentOrElse(tbProduct -> {
				responseModel.setStatus("403");
				responseModel.setMessage("Data already exists. Sku : " + requestModel.getTbpSku());
			}, () -> {
				TbProduct tbProduct = new TbProduct();
				SimpleMapper simpleMapper = new SimpleMapper();
				tbProduct = (TbProduct) simpleMapper.assign(requestModel, tbProduct);

				tbProduct.setTbpCreateDate(new Date());
				tbProduct.setTbpCreateId(tbUser.getTbuId());
				tbProduct.setTbpStatus(TbProductRepository.Sellable);

				TbBrand exampleTbBrand = new TbBrand();
				exampleTbBrand.setTbbBrandId(requestModel.getTbbBrandId());
				tbProduct.setTbbBrand(tbBrandRepository.findOne(Example.of(exampleTbBrand)).get().getTbbBrand());
				
				tbProductRepository.save(tbProduct);

				TbUserMarket exampleTbUserMarket = new TbUserMarket();
				exampleTbUserMarket.setTbuId(optTbUser.get().getTbuId());				
				List<TbUserMarket> lstTbUserMarket = tbUserMarketRepository.findAll(Example.of(exampleTbUserMarket));

				List<com.api.dms.product.model.report.TbProductMarket> lstTbProductMarketReport = new ArrayList<com.api.dms.product.model.report.TbProductMarket>();

				for (TbUserMarket tbUserMarket : lstTbUserMarket) {
					TbProductMarket tbProductMarket = new TbProductMarket();
					tbProductMarket.setTbpmCreateDate(new Date());
					tbProductMarket.setTbpmCreateId(optTbUser.get().getTbuId());
					tbProductMarket.setTbpId(tbProduct.getTbpId());
					tbProductMarket.setTbpSku(tbProduct.getTbpSku());
					tbProductMarket.setTbmMarketId(tbUserMarket.getTbmMarketId());
					tbProductMarket.setTbmMarketCheck(tbUserMarket.getTbmMarketCheck());
					
					tbProductMarketRepository.save(tbProductMarket);

					com.api.dms.product.model.report.TbProductMarket tbProductMarketReport = new com.api.dms.product.model.report.TbProductMarket();
					tbProductMarketReport = (com.api.dms.product.model.report.TbProductMarket) simpleMapper.assign(tbProductMarket, tbProductMarketReport);
					lstTbProductMarketReport.add(tbProductMarketReport);
				}				
				
				List<TbProduct> lstTbProduct = new ArrayList<TbProduct>();
				lstTbProduct.add(tbProduct);
				
				List<com.api.dms.product.model.report.TbProduct> lstTbProductReport = new ArrayList<com.api.dms.product.model.report.TbProduct>();
				
				com.api.dms.product.model.report.TbProduct tbProductReport = new com.api.dms.product.model.report.TbProduct();
				tbProductReport = (com.api.dms.product.model.report.TbProduct) simpleMapper.assign(tbProduct, tbProductReport);				
				tbProductReport.setLstTbProductMarket(lstTbProductMarketReport);
				lstTbProductReport.add(tbProductReport);
				
				PostSyncProductRequestModel postSyncProductRequestModel = new PostSyncProductRequestModel();
				postSyncProductRequestModel.setRequestDate(requestModel.getRequestDate());
				postSyncProductRequestModel.setRequestId(requestModel.getRequestId());
				postSyncProductRequestModel.setEmail(requestModel.getEmail());
				postSyncProductRequestModel.setLstTbProduct(lstTbProductReport);
				
				HttpEntity<PostSyncProductRequestModel> request = new HttpEntity<>(postSyncProductRequestModel);
				RestTemplate restTemplate = new RestTemplate();
				restTemplate.postForEntity(env.getProperty("services.bsd.api.dms.report.postsyncproduct"), request, String.class);

				responseModel.setTbProduct(tbProduct);
				responseModel.setStatus("200");
				responseModel.setMessage("Product created");
			});
		}, () -> {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		});
		
		return responseModel;
	}
	
	public GetBrandResponseModel getBrand(GetBrandRequestModel requestModel) throws Exception {
		GetBrandResponseModel responseModel = new GetBrandResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));

		if (optTbUser.isPresent()) {
			responseModel.setLstTbBrand(tbBrandRepository.findAllByTbuId(optTbUser.get().getTbuId()));
			
			responseModel.setStatus("200");
			responseModel.setMessage("Brand ok");
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
	
	public GetProductResponseModel getProduct(String tbpIdSkuCode, GetProductRequestModel requestModel) throws Exception {
		GetProductResponseModel responseModel = new GetProductResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));

		SimpleMapper simpleMapper = new SimpleMapper();
		
		TbProduct exampleTbProduct = null;
		TbProduct tbProduct = null;
		Optional<TbProduct> optTbProduct = null;
		ViewGwpSkuProduct exampleViewGwpSkuProduct = null;
		
		if (optTbUser.isPresent()) {
			exampleTbProduct = new TbProduct();
			exampleTbProduct.setTbpCode(tbpIdSkuCode);
			optTbProduct = tbProductRepository.findOne(Example.of(exampleTbProduct));
			
			if (optTbProduct.isPresent() == false) {
				exampleTbProduct = new TbProduct();
				exampleTbProduct.setTbpSku(tbpIdSkuCode);
				optTbProduct = tbProductRepository.findOne(Example.of(exampleTbProduct));
			}
			
			if (optTbProduct.isPresent()) {
				tbProduct = optTbProduct.get();
				
				exampleViewGwpSkuProduct = new ViewGwpSkuProduct();	
				exampleViewGwpSkuProduct.setTbgsSku(optTbProduct.get().getTbpSku());
				
				List<ViewGwpSkuProduct> lstViewGwpSkuProduct = viewGwpSkuProductRepository.findAll(Example.of(exampleViewGwpSkuProduct), Sort.by("tbpgTbpBrand", "tbpgTbpItem").ascending());
				responseModel.setLstViewGwpSkuProduct(lstViewGwpSkuProduct);
				
				TbProductBundle exampleTbProductBundle = new TbProductBundle();
				exampleTbProductBundle.setTbpbSku(optTbProduct.get().getTbpSku());
				List<TbProductBundle> lstTbProductBundle = tbProductBundleRepository.findAll(Example.of(exampleTbProductBundle), Sort.by("tbpSku").ascending());
				responseModel.setLstTbProductBundle(lstTbProductBundle);
				
				ViewProductMarket exampleViewProductMarket = new ViewProductMarket();
				exampleViewProductMarket.setTbpSku(optTbProduct.get().getTbpSku());
				List<ViewProductMarket> lstViewProductMarket = viewProductMarketRepository.findAll(Example.of(exampleViewProductMarket), Sort.by("tbpmId").ascending());
				responseModel.setLstViewProductMarket(lstViewProductMarket);

				responseModel.setTbProduct(tbProduct);
				responseModel.setStatus("200");
				responseModel.setMessage("Product ok");
			} else {
				responseModel.setStatus("404");
				responseModel.setMessage("Product not found");
			}
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Product not found");
		}
		
		return responseModel;
	}
	
	public GetProductsResponseModel getProducts(List<String> lstTbpIdSkuCode, GetProductRequestModel requestModel) throws Exception {
		GetProductsResponseModel responseModel = new GetProductsResponseModel(requestModel);
		
		for (String tbpIdSkuCode : lstTbpIdSkuCode) {
			GetProductResponseModel getProductResponseModel = this.getProduct(tbpIdSkuCode, requestModel);
			responseModel.getLstGetProductResponseModel().add(getProductResponseModel);
		}
		
		responseModel.setStatus("200");
		responseModel.setMessage("Product ok");
		
		return responseModel;
	}
	
	public PostProductEditResponseModel postProductEdit(PostProductEditRequestModel requestModel) throws Exception {
		PostProductEditResponseModel responseModel = new PostProductEditResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));

		if (optTbUser.isPresent()) {
			TbProduct exampleTbProduct = new TbProduct();
			exampleTbProduct.setTbpId(Integer.valueOf(requestModel.getTbpId()));
			Optional<TbProduct> optTbProduct = tbProductRepository.findOne(Example.of(exampleTbProduct));

			if (optTbProduct.isPresent()) {
				TbProduct tbProduct = optTbProduct.get();

				TbGwp exampleTbGwp = new TbGwp();
				exampleTbGwp.setTbgSku(tbProduct.getTbpSku());
				
				if (requestModel.getTbpType().equals(TbProductRepository.Sellable) && tbGwpRepository.count(Example.of(exampleTbGwp)) > 0) {
					responseModel.setStatus("404");
					responseModel.setMessage("Can not update because this product is having gwp");
				} else {
					int productMarketTotalQty = 0;

					for (ViewProductMarket viewProductMarket : requestModel.getLstViewProductMarket()) {
						 productMarketTotalQty += viewProductMarket.getTbpmQty();				
					}

					if (productMarketTotalQty != requestModel.getTbpQty()) {
						responseModel.setStatus("404");
						responseModel.setMessage("Can not update because total qty is not equal");
					} else {
						SimpleMapper simpleMapper = new SimpleMapper();
						tbProduct = (TbProduct) simpleMapper.assign(requestModel, tbProduct);

						tbProduct.setTbpUpdateDate(new Date());
						tbProduct.setTbpUpdateId(optTbUser.get().getTbuId());
						
						tbProductRepository.save(tbProduct);

						for (ViewProductMarket viewProductMarket : requestModel.getLstViewProductMarket()) {
							if (viewProductMarket.getTbpmId() != null) {
								TbProductMarket tbProductMarket = tbProductMarketRepository.findById(viewProductMarket.getTbpmId()).get();							
								tbProductMarket.setTbpmUpdateDate(new Date());
								tbProductMarket.setTbpmUpdateId(optTbUser.get().getTbuId());
								tbProductMarket.setTbmMarketCheck(1);
								tbProductMarket.setTbpmQty(viewProductMarket.getTbpmQty());
								tbProductMarketRepository.save(tbProductMarket);					
							} else {
								TbProductMarket tbProductMarket = new TbProductMarket();
								tbProductMarket.setTbpmCreateDate(new Date());
								tbProductMarket.setTbpmCreateId(optTbUser.get().getTbuId());
								tbProductMarket.setTbpId(tbProduct.getTbpId());
								tbProductMarket.setTbpSku(tbProduct.getTbpSku());
								tbProductMarket.setTbmMarketId(viewProductMarket.getTbmMarketId());
								tbProductMarket.setTbmMarketCheck(1);
								tbProductMarket.setTbpmQty(viewProductMarket.getTbpmQty());
								tbProductMarketRepository.save(tbProductMarket);					
							}							
						}
						
						List<TbProduct> lstTbProduct = new ArrayList<TbProduct>();
						
						lstTbProduct.add(tbProduct);
						
						List<com.api.dms.product.model.report.TbProduct> lstTbProductReport = new ArrayList<com.api.dms.product.model.report.TbProduct>();
						
						com.api.dms.product.model.report.TbProduct tbProductReport = new com.api.dms.product.model.report.TbProduct();
						tbProductReport = (com.api.dms.product.model.report.TbProduct) simpleMapper.assign(tbProduct, tbProductReport);

						TbProductMarket exampleTbProductMarket = new TbProductMarket();
						exampleTbProductMarket.setTbpSku(tbProduct.getTbpSku());
						List<TbProductMarket> lstTbProductMarket = tbProductMarketRepository.findAll(Example.of(exampleTbProductMarket));

						List<com.api.dms.product.model.report.TbProductMarket> lstTbProductMarketReport = new ArrayList<com.api.dms.product.model.report.TbProductMarket>();

						for (TbProductMarket tbProductMarket : lstTbProductMarket) {
							com.api.dms.product.model.report.TbProductMarket tbProductMarketReport = new com.api.dms.product.model.report.TbProductMarket();
							tbProductMarketReport = (com.api.dms.product.model.report.TbProductMarket) simpleMapper.assign(tbProductMarket, tbProductMarketReport);
							lstTbProductMarketReport.add(tbProductMarketReport);
						}

						tbProductReport.setLstTbProductMarket(lstTbProductMarketReport);
						lstTbProductReport.add(tbProductReport);
						
						PostSyncProductRequestModel postSyncProductRequestModel = new PostSyncProductRequestModel();
						postSyncProductRequestModel.setRequestDate(requestModel.getRequestDate());
						postSyncProductRequestModel.setRequestId(requestModel.getRequestId());
						postSyncProductRequestModel.setEmail(requestModel.getEmail());
						postSyncProductRequestModel.setLstTbProduct(lstTbProductReport);
						
						HttpEntity<PostSyncProductRequestModel> request = new HttpEntity<>(postSyncProductRequestModel);
						RestTemplate restTemplate = new RestTemplate();
						restTemplate.postForEntity(env.getProperty("services.bsd.api.dms.report.postsyncproduct"), request, String.class);

						responseModel.setTbProduct(tbProduct);
						responseModel.setStatus("200");
						responseModel.setMessage("Product updated");
					}					
				}
			} else {
				responseModel.setStatus("404");
				responseModel.setMessage("Not found");
			}
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
	
	public PostProductDeleteResponseModel postProductDelete(PostProductDeleteRequestModel requestModel) throws Exception {
		PostProductDeleteResponseModel responseModel = new PostProductDeleteResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			
			TbProduct exampleTbProduct = new TbProduct();
			exampleTbProduct.setTbpId(Integer.valueOf(requestModel.getTbpId()));
			Optional<TbProduct> optTbProduct = tbProductRepository.findOne(Example.of(exampleTbProduct));
			
			if (optTbProduct.isPresent()) {
				TbGwp exampleTbGwp = new TbGwp();
				exampleTbGwp.setTbgSku(optTbProduct.get().getTbpSku());
				
				if (tbGwpRepository.count(Example.of(exampleTbGwp)) > 0) {
					responseModel.setStatus("404");
					responseModel.setMessage("Can not delete because this product is having gwp");
				} else {
					TbProductBundle exampleTbProductBundle = new TbProductBundle();
					exampleTbProductBundle.setTbpbSku(optTbProduct.get().getTbpSku());
					tbProductBundleRepository.delete(exampleTbProductBundle);
					
					tbProductRepository.delete(optTbProduct.get());
					
					responseModel.setStatus("200");
					responseModel.setMessage("Product deleted");
				}
			} else {
				responseModel.setStatus("404");
				responseModel.setMessage("Not found");
			}
		}, () -> {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		});
		
		return responseModel;
	}
	
	public PostProductConfirmResponseModel postProductConfirm(PostProductConfirmRequestModel requestModel) throws Exception {
		PostProductConfirmResponseModel responseModel = new PostProductConfirmResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			TbProduct exampleTbProduct = new TbProduct();
			exampleTbProduct.setTbpSku(requestModel.getTbpcSku());
			Optional<TbProduct> optTbProduct = tbProductRepository.findOne(Example.of(exampleTbProduct));
			
			if (optTbProduct.isPresent()) {
				optTbProduct.get().setTbpUpdateDate(new Date());
				optTbProduct.get().setTbpUpdateId(optTbUser.get().getTbuId());
				if (optTbProduct.get().getTbpQty() != null) {
					optTbProduct.get().setTbpQty(optTbProduct.get().getTbpQty() - requestModel.getTbpcQty());					
				}
				tbProductRepository.save(optTbProduct.get());

				TbProductMarket exampleTbProductMarket = new TbProductMarket();
				exampleTbProductMarket.setTbpSku(requestModel.getTbpcSku());
				exampleTbProductMarket.setTbmMarketId(requestModel.getTbpcMarket());
				Optional<TbProductMarket> optTbProductMarket = tbProductMarketRepository.findOne(Example.of(exampleTbProductMarket));
				optTbProductMarket.get().setTbpmUpdateDate(new Date());
				optTbProductMarket.get().setTbpmUpdateId(optTbUser.get().getTbuId());
				if (optTbProductMarket.get().getTbpmQty() != null) {
					optTbProductMarket.get().setTbpmQty(optTbProductMarket.get().getTbpmQty() - requestModel.getTbpcQty());					
				}
				tbProductMarketRepository.save(optTbProductMarket.get());
				
				TbProductConfirm tbProductConfirm = new TbProductConfirm();
				tbProductConfirm.setTbpCreateDate(new Date());
				tbProductConfirm.setTbpCreateId(optTbUser.get().getTbuId());
				tbProductConfirm.setTbpcOrderNo(requestModel.getTbpcOrderNo());
				tbProductConfirm.setTbpSku(requestModel.getTbpcSku());
				tbProductConfirm.setTbpQty(requestModel.getTbpcQty());
				tbProductConfirm.setTbpcMarket(requestModel.getTbpcMarket());
				tbProductConfirmRepository.save(tbProductConfirm);
				
				List<TbProduct> lstTbProduct = new ArrayList<TbProduct>();
				lstTbProduct.add(optTbProduct.get());
				
				TbProductBundle exampleTbProductBundle = new TbProductBundle();
				exampleTbProductBundle.setTbpbSku(optTbProduct.get().getTbpSku());
				List<TbProductBundle> lstTbProductBundle = tbProductBundleRepository.findAll(Example.of(exampleTbProductBundle));
				for (TbProductBundle tbProductBundle : lstTbProductBundle) {
					TbProduct exampleTbProductChild = new TbProduct();
					exampleTbProductChild.setTbpSku(tbProductBundle.getTbpSku());
					Optional<TbProduct> optTbProductChild = tbProductRepository.findOne(Example.of(exampleTbProductChild));
					
					if (optTbProductChild.isPresent()) {
						optTbProductChild.get().setTbpUpdateDate(new Date());
						optTbProductChild.get().setTbpUpdateId(optTbUser.get().getTbuId());
						optTbProductChild.get().setTbpQty(optTbProductChild.get().getTbpQty() - tbProductBundle.getTbpQty());
						
						TbProductConfirm tbProductConfirmChild = new TbProductConfirm();
						tbProductConfirmChild.setTbpCreateDate(new Date());
						tbProductConfirmChild.setTbpCreateId(optTbUser.get().getTbuId());
						tbProductConfirmChild.setTbpcOrderNo(requestModel.getTbpcOrderNo());
						tbProductConfirmChild.setTbpSku(optTbProductChild.get().getTbpSku());
						tbProductConfirmChild.setTbpQty(tbProductBundle.getTbpQty());
						tbProductConfirmRepository.save(tbProductConfirmChild);
						
						lstTbProduct.add(optTbProductChild.get());
					}
				}
				
				SimpleMapper simpleMapper = new SimpleMapper();

				List<TbProductMarket> lstTbProductMarket = tbProductMarketRepository.findAll(Example.of(exampleTbProductMarket));

				List<com.api.dms.product.model.report.TbProductMarket> lstTbProductMarketReport = new ArrayList<com.api.dms.product.model.report.TbProductMarket>();

				for (TbProductMarket tbProductMarket : lstTbProductMarket) {
					com.api.dms.product.model.report.TbProductMarket tbProductMarketReport = new com.api.dms.product.model.report.TbProductMarket();
					tbProductMarketReport = (com.api.dms.product.model.report.TbProductMarket) simpleMapper.assign(tbProductMarket, tbProductMarketReport);
					lstTbProductMarketReport.add(tbProductMarketReport);
				}
				
				List<com.api.dms.product.model.report.TbProduct> lstTbProductReport = new ArrayList<com.api.dms.product.model.report.TbProduct>();
				
				for (TbProduct tbProduct : lstTbProduct) {					
					com.api.dms.product.model.report.TbProduct tbProductReport = new com.api.dms.product.model.report.TbProduct();
					tbProductReport = (com.api.dms.product.model.report.TbProduct) simpleMapper.assign(tbProduct, tbProductReport);
					tbProductReport.setLstTbProductMarket(lstTbProductMarketReport);
					lstTbProductReport.add(tbProductReport);
				}
				
				PostSyncProductRequestModel postSyncProductRequestModel = new PostSyncProductRequestModel();
				postSyncProductRequestModel.setRequestDate(requestModel.getRequestDate());
				postSyncProductRequestModel.setRequestId(requestModel.getRequestId());
				postSyncProductRequestModel.setEmail(requestModel.getEmail());
				postSyncProductRequestModel.setLstTbProduct(lstTbProductReport);
				
				HttpEntity<PostSyncProductRequestModel> request = new HttpEntity<>(postSyncProductRequestModel);
				RestTemplate restTemplate = new RestTemplate();
				restTemplate.postForEntity(env.getProperty("services.bsd.api.dms.report.postsyncproduct"), request, String.class);

				responseModel.setTbProduct(optTbProduct.get());
				responseModel.setStatus("200");
				responseModel.setMessage("Product confirmed");
			} else {
				responseModel.setStatus("404");
				responseModel.setMessage("Not found");
			}
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}

		return responseModel;
	}
}
