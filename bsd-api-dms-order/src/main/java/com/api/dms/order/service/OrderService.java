package com.api.dms.order.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalField;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

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
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.api.dms.order.db.entity.TbBrand;
import com.api.dms.order.db.entity.TbOrder;
import com.api.dms.order.db.entity.TbOrderPack;
import com.api.dms.order.db.entity.TbOrderPackDetail;
import com.api.dms.order.db.entity.TbOrderStatus;
import com.api.dms.order.db.entity.TbUser;
import com.api.dms.order.db.entity.TbUserBrand;
import com.api.dms.order.db.entity.ViewOrderConfirm;
import com.api.dms.order.db.entity.ViewOrderPack;
import com.api.dms.order.db.repository.TbBrandRepository;
import com.api.dms.order.db.repository.TbOrderPackDetailRepository;
import com.api.dms.order.db.repository.TbOrderPackRepository;
import com.api.dms.order.db.repository.TbOrderRepository;
import com.api.dms.order.db.repository.TbOrderStatusRepository;
import com.api.dms.order.db.repository.TbUserBrandRepository;
import com.api.dms.order.db.repository.TbUserRepository;
import com.api.dms.order.db.repository.ViewOrderConfirmRepository;
import com.api.dms.order.db.repository.ViewOrderPackRepository;
import com.api.dms.order.model.order.GetOrderConfirmListRequestModel;
import com.api.dms.order.model.order.GetOrderConfirmListResponseModel;
import com.api.dms.order.model.order.GetOrderConfirmSumRequestModel;
import com.api.dms.order.model.order.GetOrderConfirmSumResponseModel;
import com.api.dms.order.model.order.GetOrderListRequestModel;
import com.api.dms.order.model.order.GetOrderListResponseModel;
import com.api.dms.order.model.order.GetOrderPackRequestModel;
import com.api.dms.order.model.order.GetOrderPackResponseModel;
import com.api.dms.order.model.order.GetOrderRequestModel;
import com.api.dms.order.model.order.GetOrderResponseModel;
import com.api.dms.order.model.order.GetPackingListRequestModel;
import com.api.dms.order.model.order.GetPackingListResponseModel;
import com.api.dms.order.model.order.GetScanBarcodeCheckRequestModel;
import com.api.dms.order.model.order.GetScanBarcodeCheckResponseModel;
import com.api.dms.order.model.order.PostChangePackedRequestModel;
import com.api.dms.order.model.order.PostChangePackedResponseModel;
import com.api.dms.order.model.order.PostConfirmOrderRequestModel;
import com.api.dms.order.model.order.PostConfirmOrderResponseModel;
import com.api.dms.order.model.order.PostConfirmRequestModel;
import com.api.dms.order.model.order.PostConfirmResponseModel;
import com.api.dms.order.model.order.PostDeletePackedRequestModel;
import com.api.dms.order.model.order.PostDeletePackedResponseModel;
import com.api.dms.order.model.order.PostOrderAddRequestModel;
import com.api.dms.order.model.order.PostOrderAddResponseModel;
import com.api.dms.order.model.order.PostOrderAddsRequestModel;
import com.api.dms.order.model.order.PostOrderAddsResponseModel;
import com.api.dms.order.model.order.PostOrderDeleteRequestModel;
import com.api.dms.order.model.order.PostOrderDeleteResponseModel;
import com.api.dms.order.model.order.PostOrderEditRequestModel;
import com.api.dms.order.model.order.PostOrderEditResponseModel;
import com.api.dms.order.model.order.PostOrderManualRequestModel;
import com.api.dms.order.model.order.PostOrderManualResponseModel;
import com.api.dms.order.model.order.PostScanBarcodeRequestModel;
import com.api.dms.order.model.order.PostScanBarcodeResponseModel;
import com.api.dms.order.model.order.PostSyncBrandRequestModel;
import com.api.dms.order.model.order.PostSyncBrandResponseModel;
import com.api.dms.order.model.order.PostUploadOrderRequestModel;
import com.api.dms.order.model.order.PostUploadOrderResponseModel;
import com.api.dms.order.model.product.GetProductResponseModel;
import com.api.dms.order.model.product.LstViewGwpSkuProduct;
import com.api.dms.order.model.product.PostProductConfirmRequestModel;
import com.api.dms.order.model.product.ViewProductMarket;
import com.api.dms.order.model.report.PostSyncConfirmOrderRequestModel;
import com.api.dms.order.model.report.PostSyncOrderRequestModel;
import com.api.dms.order.model.report.PostSyncOrderStatusRequestModel;
import com.api.dms.order.util.SimpleMapper;
import com.api.dms.order.util.TokenUtil;
import com.api.dms.order.util.Uid;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class OrderService {

	private Logger log = LoggerFactory.getLogger(OrderService.class);
	
	@Autowired
	private Environment env;
	
	private TokenUtil tokenUtil = new TokenUtil();
	
	@Autowired
	private TbUserRepository tbUserRepository;
	
	@Autowired
	private TbOrderRepository tbOrderRepository;
	
	@Autowired
	private TbOrderPackRepository tbOrderPackRepository;
	
	@Autowired
	private TbOrderPackDetailRepository tbOrderPackDetailRepository;
	
	@Autowired
	private ViewOrderPackRepository viewOrderPackRepository;
	
	@Autowired
	private ViewOrderConfirmRepository viewOrderConfirmRepository;
	
	@Autowired
	private TbBrandRepository tbBrandRepository;
	
	@Autowired
	private TbOrderStatusRepository tbOrderStatusRepository;
	
	@Autowired
	private TbUserBrandRepository tbUserBrandRepository;

	private static LocalDate convertExcelSerialDateToDate(double excelSerialDate) {
        // Excel's base date (January 0, 1900)
        LocalDate baseDate = LocalDate.of(1899, 12, 31);

        // Adding days to base date (subtracting 1 for Excel's leap year bug)
        return baseDate.plus((long) excelSerialDate - 1, ChronoUnit.DAYS);
    }
	
	public PostUploadOrderResponseModel postUploadOrder(PostUploadOrderRequestModel requestModel, MultipartFile file) throws Exception {
		PostUploadOrderResponseModel responseModel = new PostUploadOrderResponseModel(requestModel);

		tokenUtil.claims(requestModel);
		
		Map<String, String> map = new HashMap<String, String>();
		Uid uid = new Uid();
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			String fileName = responseModel.getResponseId() + "-" + StringUtils.cleanPath(file.getOriginalFilename());
			Files.copy(file.getInputStream(), Paths.get(env.getProperty("file.upload.dir") + fileName), StandardCopyOption.REPLACE_EXISTING);
			
			Workbook workbook = new XSSFWorkbook(file.getInputStream());
			
			Map<String, Integer> column = new HashedMap<String, Integer>();
			
			Sheet sheet = workbook.getSheet("Order");
			
			int rowNum = 0;
			boolean dataExist = false;
			String dataExistsString = "";
			
			List<TbOrder> lstTbOrder = new ArrayList<TbOrder>();
			List<TbOrderStatus> lstTbOrderStatus = new ArrayList<TbOrderStatus>();
			List<TbOrderPack> lstTbOrderPack = new ArrayList<TbOrderPack>();
			List<TbOrderPackDetail> lstTbOrderPackDetail = new ArrayList<TbOrderPackDetail>();
			
			for (Row row : sheet) {
				if (rowNum == 0) {
					int cellNum = 0;
					
					for (Cell cell : row) {
						column.put(cell.getStringCellValue(), cellNum);
						
						cellNum++;
					}
				} else {
					if (row.getCell(0) != null) {
						TbOrder exampleTbOrder = new TbOrder();
						Object getData = null;

						getData = getData(row, column, "Order No");
						if (getData.getClass().equals(Double.valueOf(0).getClass())) {
							exampleTbOrder.setTboOrderNo(String.format("%.0f", (Double) getData));								
						} else if (getData.getClass().equals("".getClass())) {
							exampleTbOrder.setTboOrderNo((String) getData(row, column, "Order No"));
						}
						
						exampleTbOrder.setTboSeq(((Double) getData(row, column, "SEQ")).intValue());
						
						Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
						
						if (optTbOrder.isPresent()) {
							dataExistsString = "Order No : " + exampleTbOrder.getTboOrderNo();
							dataExist = true;
						} else {
							TbOrder tbOrder = new TbOrder();
							
							getData = getData(row, column, "Date");
							if (getData != null) {
								LocalDate convertedDate = convertExcelSerialDateToDate((Double) getData);
								Date date = java.sql.Date.valueOf(convertedDate);
								tbOrder.setTboCreateDate(date);
							} else {
								tbOrder.setTboCreateDate(Date.from(LocalDateTime.now(ZoneOffset.UTC).toInstant(ZoneOffset.UTC)));
							}
							
							tbOrder.setTboCreateId(optTbUser.get().getTbuId());
							tbOrder.setTboType(TbOrderRepository.TypeOrder);							
							tbOrder.setTboRow(((Double) getData(row, column, "Row")).intValue());
							tbOrder.setTboBrand((String) getData(row, column, "Brand"));
							tbOrder.setTboMarketId((String) getData(row, column, "Market ID"));							
							tbOrder.setTboFrontliner((String) getData(row, column, "Frontliner"));							
							tbOrder.setTboQcId(((Double) getData(row, column, "QC ID")).intValue());
							tbOrder.setTboSeq(((Double) getData(row, column, "SEQ")).intValue());
							tbOrder.setTboMaxSeq(((Double) getData(row, column, "Max SEQ")).intValue());
							tbOrder.setTboOrderSq((String) getData(row, column, "Order SQ"));
							
							getData = getData(row, column, "Order No");
							if (getData.getClass().equals(Double.valueOf(0).getClass())) {
								tbOrder.setTboOrderNo(String.format("%.0f", (Double) getData));								
							} else if (getData.getClass().equals("".getClass())) {
								tbOrder.setTboOrderNo((String) getData);
							}
							
							getData = getData(row, column, "SKU");
							if (getData.getClass().equals(Double.valueOf(0).getClass())) {
								tbOrder.setTboSku(String.format("%.0f", (Double) getData));								
							} else if (getData.getClass().equals("".getClass())) {
								tbOrder.setTboSku((String) getData);
							}
							
							tbOrder.setTboItem((String) getData(row, column, "ITEM"));
							
							getData = getData(row, column, "Code");
							if (getData.getClass().equals(Double.valueOf(0).getClass())) {
								tbOrder.setTboCode(String.format("%.0f", (Double) getData));								
							} else if (getData.getClass().equals("".getClass())) {
								tbOrder.setTboCode((String) getData);
							}
							
							getData = getData(row, column, "LOC");
							if (getData.getClass().equals(Double.valueOf(0).getClass())) {
								tbOrder.setTboLoc(String.format("%.0f", (Double) getData));								
							} else if (getData.getClass().equals("".getClass())) {
								tbOrder.setTboLoc((String) getData);
							}							
							
							tbOrder.setTboQty(((Double) getData(row, column, "Qty")).intValue());
							
							getData = getData(row, column, "Diskon from Market");
							if (getData != null) {
								if (getData.getClass().equals(Double.valueOf(0).getClass())) {
									tbOrder.setTboDiskonFromMarket(new BigDecimal((Double) getData));								
								} else if (getData.getClass().equals("".getClass())) {
									tbOrder.setTboDiskonFromMarket(null);
								}
							}
							
							getData = getData(row, column, "Unit Price");
							if (getData != null) {
								if (getData.getClass().equals(Double.valueOf(0).getClass())) {
									tbOrder.setTboUnitPrice(new BigDecimal((Double) getData));								
								} else if (getData.getClass().equals("".getClass())) {
									tbOrder.setTboUnitPrice(null);
								}								
							}
							
							getData = getData(row, column, "Diskon Total");
							if (getData != null) {
								if (getData.getClass().equals(Double.valueOf(0).getClass())) {
									tbOrder.setTboDiskonTotal(new BigDecimal((Double) getData));								
								} else if (getData.getClass().equals("".getClass())) {
									tbOrder.setTboDiskonTotal(null);
								}
							}
							
							getData = getData(row, column, "PAID Total");
							if (getData != null) {
								if (getData.getClass().equals(Double.valueOf(0).getClass())) {
									tbOrder.setTboPaidTotal(new BigDecimal((Double) getData));								
								} else if (getData.getClass().equals("".getClass())) {
									tbOrder.setTboPaidTotal(null);
								}
							}
							
							getData = getData(row, column, "Order SUM");
							if (getData != null) {
								if (getData.getClass().equals(Double.valueOf(0).getClass())) {
									tbOrder.setTboOrderSum(new BigDecimal((Double) getData));								
								} else if (getData.getClass().equals("".getClass())) {
									tbOrder.setTboOrderSum(null);
								}
							}
							
							getData = getData(row, column, "Name");
							if (getData.getClass().equals(Double.valueOf(0).getClass())) {
								tbOrder.setTboName(String.format("%.0f", (Double) getData));								
							} else if (getData.getClass().equals("".getClass())) {
								tbOrder.setTboName((String) getData);
							}
							
							getData = getData(row, column, "HP");
							if (getData.getClass().equals(Double.valueOf(0).getClass())) {
								tbOrder.setTboHp(String.format("%.0f", (Double) getData));								
							} else if (getData.getClass().equals("".getClass())) {
								tbOrder.setTboHp((String) getData);
							}
							
							getData = getData(row, column, "Address1");
							if (getData.getClass().equals(Double.valueOf(0).getClass())) {
								tbOrder.setTboAddress1(String.format("%.0f", (Double) getData));								
							} else if (getData.getClass().equals("".getClass())) {
								tbOrder.setTboAddress1((String) getData);
							}
							
							getData = getData(row, column, "Address2");
							if (getData.getClass().equals(Double.valueOf(0).getClass())) {
								tbOrder.setTboAddress2(String.format("%.0f", (Double) getData));								
							} else if (getData.getClass().equals("".getClass())) {
								tbOrder.setTboAddress2((String) getData);
							}
							
							getData = getData(row, column, "Address3");
							if (getData.getClass().equals(Double.valueOf(0).getClass())) {
								tbOrder.setTboAddress3(String.format("%.0f", (Double) getData));								
							} else if (getData.getClass().equals("".getClass())) {
								tbOrder.setTboAddress3((String) getData);
							}
							
							getData = getData(row, column, "Address4");
							if (getData.getClass().equals(Double.valueOf(0).getClass())) {
								tbOrder.setTboAddress4(String.format("%.0f", (Double) getData));								
							} else if (getData.getClass().equals("".getClass())) {
								tbOrder.setTboAddress4((String) getData);
							}
							
							getData = getData(row, column, "Address5");
							if (getData.getClass().equals(Double.valueOf(0).getClass())) {
								tbOrder.setTboAddress5(String.format("%.0f", (Double) getData));								
							} else if (getData.getClass().equals("".getClass())) {
								tbOrder.setTboAddress5((String) getData);
							}
							
							getData = getData(row, column, "Full Address");
							if (getData.getClass().equals(Double.valueOf(0).getClass())) {
								tbOrder.setTboFullAddress(String.format("%.0f", (Double) getData));								
							} else if (getData.getClass().equals("".getClass())) {
								tbOrder.setTboFullAddress((String) getData);
							}
							
							if (map.get(tbOrder.getTboOrderNo()) == null) map.put(tbOrder.getTboOrderNo(), uid.generateString(15).toUpperCase());
							tbOrder.setTboAwb(map.get(tbOrder.getTboOrderNo()));
							//tbOrder.setTboAwb((String) getData(row, column, "AWB"));
							
							tbOrder.setTboStatus(TbOrderRepository.StatusPacked);
							
							tbOrder.setTboCheck(TbOrderRepository.CheckOk);
							
							tbOrder.setTboTypeNotPacked(TbOrderRepository.TypeNotPackedOrder);
							
							tbOrder.setTboType(TbOrderRepository.TypeOrder);
							
							tbOrder.setTboFile(fileName);
							
							if (tbOrder.getTboOrderNo().contains("EOD") == false) {
								lstTbOrder.add(tbOrder);
							}
						}
					}
				}
				rowNum++;
				
				if (dataExist) break;
			}
			
			workbook.close();
			
			responseModel.setFileName(fileName);
			
			if (dataExist) {
				responseModel.setStatus("208");
				responseModel.setMessage(dataExistsString + " already exists");
			} else {
				tbOrderRepository.saveAll(lstTbOrder);
				
				for (TbOrder tbOrder : lstTbOrder) {
					TbOrderStatus tbOrderStatus = new TbOrderStatus();
					tbOrderStatus.setTbosCreateDate(Date.from(LocalDateTime.now(ZoneOffset.UTC).toInstant(ZoneOffset.UTC)));
					tbOrderStatus.setTbosCreateId(optTbUser.get().getTbuId());
					tbOrderStatus.setTboId(tbOrder.getTboId());
					tbOrderStatus.setTbosStatus(tbOrder.getTboStatus());
					lstTbOrderStatus.add(tbOrderStatus);
				}
				tbOrderStatusRepository.saveAll(lstTbOrderStatus);

				Set<String> uniqueOrderNumbers = new HashSet<>();
				for (TbOrder tbOrder : lstTbOrder) {
					// Check if the order number is unique
					if (uniqueOrderNumbers.add(tbOrder.getTboOrderNo())) {
						// If it's unique, add the order pack to the result list
						TbOrderPack tbOrderPack = new TbOrderPack();
						tbOrderPack.setTbopCreateDate(Date.from(LocalDateTime.now(ZoneOffset.UTC).toInstant(ZoneOffset.UTC)));
						tbOrderPack.setTbopCreateId(optTbUser.get().getTbuId());
						tbOrderPack.setTbopQcId(tbOrder.getTboQcId());
						tbOrderPack.setTbopAwb(tbOrder.getTboAwb());
						tbOrderPack.setTbopBrand(tbOrder.getTboBrand());
						tbOrderPack.setTbopMarket(tbOrder.getTboMarketId());					
						tbOrderPack.setTbopFrontliner(tbOrder.getTboFrontliner());
						tbOrderPack.setTbopOrderNo(tbOrder.getTboOrderNo());
						tbOrderPack.setTbopName(tbOrder.getTboName());
						tbOrderPack.setTbopStatus(TbOrderPackRepository.StatusPacked);
						tbOrderPack.setTbopType(TbOrderPackRepository.TypeOrder);
						lstTbOrderPack.add(tbOrderPack);
					}
				}
				tbOrderPackRepository.saveAll(lstTbOrderPack);

				for (TbOrder tbOrder : lstTbOrder) {
					TbOrderPack exampleTbOrderPack = new TbOrderPack();
					exampleTbOrderPack.setTbopOrderNo(tbOrder.getTboOrderNo());
					Optional<TbOrderPack> opTbOrderPack = tbOrderPackRepository.findOne(Example.of(exampleTbOrderPack));

					TbOrderPackDetail tbOrderPackDetail = new TbOrderPackDetail();
					tbOrderPackDetail.setTbopdCreateDate(Date.from(LocalDateTime.now(ZoneOffset.UTC).toInstant(ZoneOffset.UTC)));
					tbOrderPackDetail.setTbopdCreateId(optTbUser.get().getTbuId());
					tbOrderPackDetail.setTbopId(opTbOrderPack.get().getTbopId());
					tbOrderPackDetail.setTbopdType(TbOrderPackDetailRepository.TypeProduct);
					tbOrderPackDetail.setTbopdOrderNo(tbOrder.getTboOrderNo());
					tbOrderPackDetail.setTbopdBrand(tbOrder.getTboBrand());
					tbOrderPackDetail.setTbopdSku(tbOrder.getTboSku());
					tbOrderPackDetail.setTbopdCode(tbOrder.getTboCode());
					tbOrderPackDetail.setTbopdItem(tbOrder.getTboItem());
					tbOrderPackDetail.setTbopdStatus(TbOrderPackDetailRepository.StatusPacked);
					tbOrderPackDetail.setTbopdCheck(TbOrderPackDetailRepository.CheckOk);
					tbOrderPackDetail.setTbopdQty(tbOrder.getTboQty());
					tbOrderPackDetail.setTbopdQtyPack(tbOrder.getTboQty());
					tbOrderPackDetail.setTbopdMarket(tbOrder.getTboMarketId());
					lstTbOrderPackDetail.add(tbOrderPackDetail);
				}
				tbOrderPackDetailRepository.saveAll(lstTbOrderPackDetail);

				for (TbOrder tbOrder : lstTbOrder) {
					RestTemplate restTemplate = new RestTemplate();
					String requestParam = "" + 
							"email=" + requestModel.getEmail() +
							"&token=" + requestModel.getToken() +
							"&requestDate=" + requestModel.getRequestDate() +
							"&requestId=" + requestModel.getRequestId() +
							"&tbpIdSkuCode=" + tbOrder.getTboSku();
					ResponseEntity<String> response = restTemplate.getForEntity(env.getProperty("services.bsd.api.dms.product") + "/getproduct?" + requestParam, String.class);

					ObjectMapper mapper = new ObjectMapper();
					GetProductResponseModel getProductResponseModel = mapper.readValue(response.getBody(), GetProductResponseModel.class);			

					for (LstViewGwpSkuProduct lstViewGwpSkuProduct : getProductResponseModel.getLstViewGwpSkuProduct()) {
						TbOrder tbOrderGwpBundleDetail = new TbOrder();							
						tbOrderGwpBundleDetail.setTboCreateDate(Date.from(LocalDateTime.now(ZoneOffset.UTC).toInstant(ZoneOffset.UTC)));
						tbOrderGwpBundleDetail.setTboCreateId(optTbUser.get().getTbuId());
						tbOrderGwpBundleDetail.setTboOrderNo(tbOrder.getTboOrderNo());
						tbOrderGwpBundleDetail.setTboSku(lstViewGwpSkuProduct.getTbgSku());
						tbOrderGwpBundleDetail.setTboItem(lstViewGwpSkuProduct.getTbpgTbpItem());
						tbOrderGwpBundleDetail.setTboCode(lstViewGwpSkuProduct.getTbpgTbpCode());
						tbOrderGwpBundleDetail.setTboLoc(lstViewGwpSkuProduct.getTbpgTbpLoc());
						tbOrderGwpBundleDetail.setTboQty(lstViewGwpSkuProduct.getTbgsQty());
						tbOrderGwpBundleDetail.setTboName(tbOrder.getTboName());
						tbOrderGwpBundleDetail.setTboAwb(tbOrder.getTboAwb());
						tbOrderGwpBundleDetail.setTboStatus(TbOrderRepository.StatusPacked);
						tbOrderGwpBundleDetail.setTboCheck(TbOrderRepository.CheckOk);
						tbOrderGwpBundleDetail.setTboTypeNotPacked(TbOrderRepository.TypeOrder);
						tbOrderGwpBundleDetail.setTboType(TbOrderRepository.TypeOrder);							
						tbOrderGwpBundleDetail.setTboBrand(lstViewGwpSkuProduct.getTbpgTbpBrand());						
						tbOrderGwpBundleDetail.setTboMarketId(tbOrder.getTboMarketId());
						tbOrderGwpBundleDetail.setTboRow(tbOrder.getTboRow());
						tbOrderGwpBundleDetail.setTboBrand(lstViewGwpSkuProduct.getTbpgTbpBrand());
						tbOrderGwpBundleDetail.setTboQcId(tbOrder.getTboQcId());
						tbOrderGwpBundleDetail.setTboSeq(tbOrder.getTboSeq());
						tbOrderGwpBundleDetail.setTboMaxSeq(tbOrder.getTboMaxSeq());
						tbOrderGwpBundleDetail.setTboOrderSq(tbOrder.getTboOrderSq());
						tbOrderGwpBundleDetail.setTboHp(tbOrder.getTboHp());
						tbOrderGwpBundleDetail.setTboAddress1(tbOrder.getTboAddress1());
						tbOrderGwpBundleDetail.setTboAddress2(tbOrder.getTboAddress2());
						tbOrderGwpBundleDetail.setTboAddress3(tbOrder.getTboAddress3());
						tbOrderGwpBundleDetail.setTboAddress4(tbOrder.getTboAddress4());
						tbOrderGwpBundleDetail.setTboAddress5(tbOrder.getTboAddress5());
						tbOrderGwpBundleDetail.setTboFullAddress(tbOrder.getTboFullAddress());
						tbOrderGwpBundleDetail.setTboFile(tbOrder.getTboFile());
						tbOrderGwpBundleDetail.setTboFrontliner(tbOrder.getTboFrontliner());

						tbOrderRepository.save(tbOrderGwpBundleDetail);

						TbOrderPackDetail tbOrderPackGwpBundleDetail = new TbOrderPackDetail();
						tbOrderPackGwpBundleDetail.setTbopdCreateDate(Date.from(LocalDateTime.now(ZoneOffset.UTC).toInstant(ZoneOffset.UTC)));
						tbOrderPackGwpBundleDetail.setTbopdCreateId(optTbUser.get().getTbuId());
						tbOrderPackGwpBundleDetail.setTbopId(tbOrder.getTboId());
						tbOrderPackGwpBundleDetail.setTbopdOrderNo(tbOrder.getTboOrderNo());
						tbOrderPackGwpBundleDetail.setTbopdBrand(lstViewGwpSkuProduct.getTbpgTbpBrand());
						tbOrderPackGwpBundleDetail.setTbopdSku(lstViewGwpSkuProduct.getTbgSku());
						tbOrderPackGwpBundleDetail.setTbopdSkuAdditional(lstViewGwpSkuProduct.getTbgsSku());
						tbOrderPackGwpBundleDetail.setTbopdItem(lstViewGwpSkuProduct.getTbpgTbpItem());
						tbOrderPackGwpBundleDetail.setTbopdCode(lstViewGwpSkuProduct.getTbpgTbpCode());
						if (lstViewGwpSkuProduct.getTbgsMin() == 0 || lstViewGwpSkuProduct.getTbgsMinAccu() == 0) {
							tbOrderPackGwpBundleDetail.setTbopdStatus(TbOrderPackDetailRepository.StatusAdditionalPacked);
							tbOrderPackGwpBundleDetail.setTbopdType(TbOrderPackDetailRepository.TypeBundle);
						} else {
							tbOrderPackGwpBundleDetail.setTbopdStatus(TbOrderPackDetailRepository.StatusAdditionalPacked);
							tbOrderPackGwpBundleDetail.setTbopdType(TbOrderPackDetailRepository.TypeGwp);
						}
						tbOrderPackGwpBundleDetail.setTbopdCheck(TbOrderPackDetailRepository.CheckOk);
						tbOrderPackGwpBundleDetail.setTbopdTypeNotPacked(TbOrderPackDetailRepository.TypeNotPackedItem);
						tbOrderPackGwpBundleDetail.setTbopdQty(lstViewGwpSkuProduct.getTbgsQty());
						tbOrderPackGwpBundleDetail.setTbopdQtyPack(lstViewGwpSkuProduct.getTbgsQty());
						tbOrderPackGwpBundleDetail.setTbopdMarket(tbOrder.getTboMarketId());

						lstTbOrderPackDetail.add(tbOrderPackGwpBundleDetail);
					}					
				}
				tbOrderPackDetailRepository.saveAll(lstTbOrderPackDetail);
				
				PostSyncOrderRequestModel postSyncOrderRequestModel = new PostSyncOrderRequestModel();
				postSyncOrderRequestModel.setRequestDate(requestModel.getRequestDate());
				postSyncOrderRequestModel.setRequestId(requestModel.getRequestId());
				postSyncOrderRequestModel.setEmail(requestModel.getEmail());
				postSyncOrderRequestModel.setLstTbOrder(lstTbOrder);
				
				RestTemplate restTemplate = new RestTemplate();

				HttpEntity<PostSyncOrderRequestModel> requestPostsyncorder = new HttpEntity<>(postSyncOrderRequestModel);				
				restTemplate.postForEntity(env.getProperty("services.bsd.api.dms.report.postsyncorder"), requestPostsyncorder, String.class);

				PostSyncOrderStatusRequestModel PostSyncOrderStatusRequestModel = new PostSyncOrderStatusRequestModel();
				PostSyncOrderStatusRequestModel.setRequestDate(requestModel.getRequestDate());
				PostSyncOrderStatusRequestModel.setRequestId(requestModel.getRequestId());
				PostSyncOrderStatusRequestModel.setEmail(requestModel.getEmail());
				PostSyncOrderStatusRequestModel.setLstTbOrderStatus(lstTbOrderStatus);
				
				HttpEntity<PostSyncOrderStatusRequestModel> requestPostsyncorderstatus = new HttpEntity<>(PostSyncOrderStatusRequestModel);
				restTemplate.postForEntity(env.getProperty("services.bsd.api.dms.report.postsyncorderstatus"), requestPostsyncorderstatus, String.class);

				responseModel.setStatus("200");
				responseModel.setMessage("Upload ok");				
			}
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Upload failed");
		}

		return responseModel;
	}
	
	@SuppressWarnings("deprecation")
	private Object getData(Row row, Map<String, Integer> column, String key) {
		try {
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
					return "";
				}
			} else {
				return "";
			}
		} catch(Exception ex) {
			return null;
		}		
	}
	
	public ByteArrayInputStream getOrderConfirmListReportExcel(String orderNo, String sku, String status, String type, String brand, String startDate, String endDate, String length, String pageSize, String pageIndex, GetOrderConfirmListRequestModel requestModel) throws Exception {
		pageSize = "1000000000";
		
		ByteArrayOutputStream out = new ByteArrayOutputStream();

		Workbook workbook = new XSSFWorkbook();
		
		Sheet sheet = workbook.createSheet("Raw");
		int intRow = 0;
		Row row = sheet.createRow(intRow);
		
		Cell cell = null;
		
		int intCell = 0;
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Date");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Order Number");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Sku");

		cell = row.createCell(intCell++);
		cell.setCellValue("Product");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Order Qty");

		cell = row.createCell(intCell++);
		cell.setCellValue("Packing Qty");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Packing PIC");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Type");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Not Packed Type");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Status");
		
		intRow++;
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		List<ViewOrderConfirm> lstViewOrderConfirmRaw = getOrderConfirmList(orderNo, sku, status, type, brand, startDate, endDate, length, pageSize, pageIndex, requestModel).getLstViewOrderConfirm();
		for (ViewOrderConfirm viewOrderConfirm : lstViewOrderConfirmRaw) {
			row = sheet.createRow(intRow);
			
			intCell = 0;
			
			cell = row.createCell(intCell++);
			cell.setCellValue(simpleDateFormat.format(viewOrderConfirm.getCreateDate()));
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrderConfirm.getOrderNo());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrderConfirm.getSku());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrderConfirm.getItem());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrderConfirm.getOrderQty());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrderConfirm.getPackQty());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrderConfirm.getPackingPic());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrderConfirm.getType());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrderConfirm.getTypeNotPacked());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrderConfirm.getStatus());
			
			intRow++;
		}
		
		workbook.write(out);
		workbook.close();
		
		return new ByteArrayInputStream(out.toByteArray());
	}
	
	public GetOrderConfirmListResponseModel getOrderConfirmList(String orderNo, String sku, String status, String type, String brand, String startDate, String endDate, String length, String pageSize, String pageIndex, GetOrderConfirmListRequestModel requestModel) throws Exception {
		GetOrderConfirmListResponseModel responseModel = new GetOrderConfirmListResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			List<ViewOrderConfirm> lstViewOrderConfirm = viewOrderConfirmRepository.find(optTbUser.get().getTbuId(), orderNo, sku, status, type, brand, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50"), PageRequest.of(Integer.valueOf(pageIndex), Integer.valueOf(pageSize), Sort.by("tboId").ascending()));
			
			if (lstViewOrderConfirm.size() > 0) {
				responseModel.setLength(viewOrderConfirmRepository.count(optTbUser.get().getTbuId(), orderNo, sku, status, type, brand, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50")));
				responseModel.setLstViewOrderConfirm(lstViewOrderConfirm);
				
				responseModel.setStatus("200");
				responseModel.setMessage("Get Order List ok");
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

	public GetOrderConfirmSumResponseModel getOrderConfirmSum(String orderNo, String sku, String status, String type, String brand, String startDate, String endDate, String length, String pageSize, String pageIndex, GetOrderConfirmSumRequestModel requestModel) throws Exception {
		GetOrderConfirmSumResponseModel responseModel = new GetOrderConfirmSumResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			List<ViewOrderConfirm> lstViewOrderConfirm = viewOrderConfirmRepository.find(optTbUser.get().getTbuId(), orderNo, sku, status, type, brand, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50"), PageRequest.of(Integer.valueOf(pageIndex), Integer.valueOf(pageSize), Sort.by("tboId").ascending()));
			
			if (lstViewOrderConfirm.size() > 0) {
				responseModel.setSumAll(viewOrderConfirmRepository.count(optTbUser.get().getTbuId(), orderNo, sku, "", type, brand, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50")));
				responseModel.setSumPacked(viewOrderConfirmRepository.count(optTbUser.get().getTbuId(), orderNo, sku, "Packed", type, brand, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50")));
				responseModel.setSumAdditionalPacked(viewOrderConfirmRepository.count(optTbUser.get().getTbuId(), orderNo, sku, "Additional Packed", type, brand, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50")));
				responseModel.setSumNotPacked(viewOrderConfirmRepository.count(optTbUser.get().getTbuId(), orderNo, sku, "Not Packed", type, brand, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50")));
				responseModel.setSumDelivered(viewOrderConfirmRepository.count(optTbUser.get().getTbuId(), orderNo, sku, "Delivered", type, brand, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50")));
				responseModel.setSumNotConfirmed(viewOrderConfirmRepository.count(optTbUser.get().getTbuId(), orderNo, sku, "Not Confirmed", type, brand, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50")));
				
				responseModel.setStatus("200");
				responseModel.setMessage("Get Order Sum ok");
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
	
	public ByteArrayInputStream getPackingListReportExcel(String orderNo, String startDate, String endDate, String status, String length, String pageSize, String pageIndex, GetPackingListRequestModel requestModel) throws Exception {
		pageSize = "1000000000";
		
		ByteArrayOutputStream out = new ByteArrayOutputStream();

		Workbook workbook = new XSSFWorkbook();
		
		Sheet sheet = workbook.createSheet("Raw");
		int intRow = 0;
		Row row = sheet.createRow(intRow);
		
		Cell cell = null;
		
		int intCell = 0;
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Market");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Order No");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Awb");
		
		intRow++;
		
		List<ViewOrderPack> lstViewOrderPackRaw = getPackingList(orderNo, startDate, endDate, status, length, pageSize, pageIndex, requestModel).getLstViewOrderPack();
		for (ViewOrderPack viewOrderPack : lstViewOrderPackRaw) {
			row = sheet.createRow(intRow);
			
			intCell = 0;
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrderPack.getTboMarketId());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrderPack.getTboOrderNo());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrderPack.getTboAwb());
			
			intRow++;
		}
		
		workbook.write(out);
		workbook.close();
		
		return new ByteArrayInputStream(out.toByteArray());
	}
	
	public ByteArrayInputStream getOrderListReportExcel(String orderNo, String startDate, String endDate, String status, String length, String pageSize, String pageIndex, GetOrderListRequestModel requestModel) throws Exception {
		pageSize = "1000000000";
		
		ByteArrayOutputStream out = new ByteArrayOutputStream();

		Workbook workbook = new XSSFWorkbook();
		
		Sheet sheet = workbook.createSheet("Raw");
		int intRow = 0;
		Row row = sheet.createRow(intRow);
		
		Cell cell = null;
		
		int intCell = 0;
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Date");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Brand");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Market");

		cell = row.createCell(intCell++);
		cell.setCellValue("Order No");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Sku");

		cell = row.createCell(intCell++);
		cell.setCellValue("Item");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Qty");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Paid Total");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Name");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Hp");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Status");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Type");
		
		intRow++;
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		List<TbOrder> lstTbOrderRaw = getOrderList(orderNo, startDate, endDate, status, length, pageSize, pageIndex, requestModel).getLstTbOrder();
		for (TbOrder tbOrder : lstTbOrderRaw) {
			row = sheet.createRow(intRow);
			
			intCell = 0;
			
			cell = row.createCell(intCell++);
			cell.setCellValue(simpleDateFormat.format(tbOrder.getTboCreateDate()));
			
			cell = row.createCell(intCell++);
			cell.setCellValue(tbOrder.getTboBrand());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(tbOrder.getTboMarketId());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(tbOrder.getTboOrderNo());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(tbOrder.getTboSku());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(tbOrder.getTboItem());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(tbOrder.getTboQty());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(tbOrder.getTboPaidTotal() == null ? 0 : tbOrder.getTboPaidTotal().doubleValue());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(tbOrder.getTboName());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(tbOrder.getTboHp());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(tbOrder.getTboStatus());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(tbOrder.getTboType());
			
			intRow++;
		}
		
		workbook.write(out);
		workbook.close();
		
		return new ByteArrayInputStream(out.toByteArray());
	}
	
	public GetPackingListResponseModel getPackingList(String orderNo, String startDate, String endDate, String status, String length, String pageSize, String pageIndex, GetPackingListRequestModel requestModel) throws Exception {
		GetPackingListResponseModel responseModel = new GetPackingListResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			ExampleMatcher matcher = ExampleMatcher.matching()
					.withMatcher("tboOrderNo", ExampleMatcher.GenericPropertyMatchers.contains().ignoreCase())
					;
		
			ViewOrderPack exampleViewOrderPack = new ViewOrderPack();
			exampleViewOrderPack.setTbuId(optTbUser.get().getTbuId());
			exampleViewOrderPack.setTboOrderNo(orderNo);
			
			Page<ViewOrderPack> pgViewOrderPack = viewOrderPackRepository.findAll(Example.of(exampleViewOrderPack, matcher), PageRequest.of(Integer.valueOf(pageIndex), Integer.valueOf(pageSize), Sort.by("tboAwb").ascending()));
			
			if (pgViewOrderPack.toList().size() > 0) {
				List<ViewOrderPack> lstViewOrderPack = pgViewOrderPack.toList();
				responseModel.setLstViewOrderPack(lstViewOrderPack);
				
				responseModel.setLength(viewOrderPackRepository.count(Example.of(exampleViewOrderPack, matcher)));
				
				responseModel.setStatus("200");
				responseModel.setMessage("Get Packing List ok");
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
	
	public GetOrderListResponseModel getOrderList(String orderNo, String startDate, String endDate, String status, String length, String pageSize, String pageIndex, GetOrderListRequestModel requestModel) throws Exception {
		GetOrderListResponseModel responseModel = new GetOrderListResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			List<TbOrder> lstTbOrder = tbOrderRepository.find(optTbUser.get().getTbuId(), orderNo, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50"), status, PageRequest.of(Integer.valueOf(pageIndex), Integer.valueOf(pageSize), Sort.by("tboOrderNo", "tboSku").ascending()));
			
			if (lstTbOrder.size() > 0) {
				responseModel.setLength(tbOrderRepository.count(optTbUser.get().getTbuId(), orderNo, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50"), status));
				responseModel.setLstTbOrder(lstTbOrder);
				
				responseModel.setStatus("200");
				responseModel.setMessage("Get Order List ok");
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
	
	public PostOrderManualResponseModel postOrderManual(PostOrderManualRequestModel requestModel) throws Exception {
		PostOrderManualResponseModel responseModel = new PostOrderManualResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			boolean check = true;
			int maxSeq = 0;
			for (int i = 0; i < requestModel.getTbOrder().length; i++) {
				maxSeq++;
				TbOrder exampleTbOrder = new TbOrder();
				exampleTbOrder.setTboOrderNo(requestModel.getDetails());
				exampleTbOrder.setTboOrderSq(String.valueOf(i));
				Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
				
				if (optTbOrder.isPresent()) check = false;
			}
			
			if (check) {
				for (int i = 0; i < requestModel.getTbOrder().length; i++) {
					TbOrder tbOrder = requestModel.getTbOrder()[i];
					tbOrder.setTboCreateDate(new Date());
					tbOrder.setTboCreateId(optTbUser.get().getTbuId());
					tbOrder.setTboBrand(requestModel.getTboBrand());
					tbOrder.setTboOrderNo(requestModel.getDetails());
					tbOrder.setTboSeq(i);
					tbOrder.setTboMaxSeq(maxSeq);
					tbOrder.setTboOrderSq(String.valueOf(i));
					
					RestTemplate restTemplate = new RestTemplate();
					String requestParam = "" + 
							"email=" + requestModel.getEmail() +
							"&token=" + requestModel.getToken() +
							"&requestDate=" + requestModel.getRequestDate() +
							"&requestId=" + requestModel.getRequestId() +
							"&tbpIdSkuCode=" + tbOrder.getTboSku();
					ResponseEntity<String> response = restTemplate.getForEntity(env.getProperty("services.bsd.api.dms.product") + "/getproduct?" + requestParam, String.class);

					ObjectMapper mapper = new ObjectMapper();
					GetProductResponseModel getProductResponseModel = mapper.readValue(response.getBody(), GetProductResponseModel.class);
					
					tbOrder.setTboItem(getProductResponseModel.getTbProduct().getTbpItem());
					tbOrder.setTboCode(getProductResponseModel.getTbProduct().getTbpCode());
					tbOrder.setTboStatus(TbOrderRepository.StatusPacked);
					tbOrder.setTboCheck(TbOrderRepository.CheckOk);
					tbOrder.setTboType(TbOrderRepository.TypeManualStockOut);
					tbOrderRepository.save(tbOrder);
				}
				
				TbOrderPack tbOrderPack = new TbOrderPack();
				tbOrderPack.setTbopCreateDate(new Date());
				tbOrderPack.setTbopCreateId(optTbUser.get().getTbuId());
				tbOrderPack.setTbopBrand(requestModel.getTboBrand());
				tbOrderPack.setTbopOrderNo(requestModel.getDetails());
				tbOrderPack.setTbopType(TbOrderPackRepository.TypeManualStockOut);
				tbOrderPack.setTbopStatus(TbOrderPackRepository.StatusPacked);
				tbOrderPackRepository.save(tbOrderPack);
				
				for (TbOrder tbOrder : requestModel.getTbOrder()) {
					TbOrderPackDetail tbOrderPackDetail = new TbOrderPackDetail();
					tbOrderPackDetail.setTbopdCreateDate(new Date());
					tbOrderPackDetail.setTbopdCreateId(optTbUser.get().getTbuId());
					tbOrderPackDetail.setTbopId(tbOrderPack.getTbopId());
					
					RestTemplate restTemplate = new RestTemplate();
					String requestParam = "" + 
							"email=" + requestModel.getEmail() +
							"&token=" + requestModel.getToken() +
							"&requestDate=" + requestModel.getRequestDate() +
							"&requestId=" + requestModel.getRequestId() +
							"&tbpIdSkuCode=" + tbOrder.getTboSku();
					ResponseEntity<String> response = restTemplate.getForEntity(env.getProperty("services.bsd.api.dms.product") + "/getproduct?" + requestParam, String.class);

					ObjectMapper mapper = new ObjectMapper();
					GetProductResponseModel getProductResponseModel = mapper.readValue(response.getBody(), GetProductResponseModel.class);
					
					tbOrderPackDetail.setTbopdOrderNo(tbOrder.getTboOrderNo());
					tbOrderPackDetail.setTbopdBrand(getProductResponseModel.getTbProduct().getTbbBrand());
					tbOrderPackDetail.setTbopdSku(getProductResponseModel.getTbProduct().getTbpSku());
					tbOrderPackDetail.setTbopdItem(getProductResponseModel.getTbProduct().getTbpItem());
					tbOrderPackDetail.setTbopdCode(getProductResponseModel.getTbProduct().getTbpCode());
					tbOrderPackDetail.setTbopdCheck(TbOrderPackDetailRepository.CheckOk);
					tbOrderPackDetail.setTbopdStatus(TbOrderPackDetailRepository.StatusPacked);
					tbOrderPackDetail.setTbopdType(TbOrderPackDetailRepository.TypeProduct);
					tbOrderPackDetail.setTbopdQty(tbOrder.getTboQty());
					tbOrderPackDetail.setTbopdQtyPack(tbOrder.getTboQty());
					tbOrderPackDetail.setTbopdMarket(tbOrder.getTboMarketId());
					
					tbOrderPackDetailRepository.save(tbOrderPackDetail);
				}
				
				responseModel.setStatus("200");
				responseModel.setMessage("Order created");				
			} else {
				responseModel.setStatus("403");
				responseModel.setMessage("Data already exists. Details : " + requestModel.getDetails());
			}
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
	
	public PostOrderAddResponseModel postOrderAdd(PostOrderAddRequestModel requestModel) throws Exception {
		PostOrderAddResponseModel responseModel = new PostOrderAddResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			
			TbOrder exampleTbOrder = new TbOrder();
			exampleTbOrder.setTboOrderNo(requestModel.getTboOrderNo());
			exampleTbOrder.setTboOrderSq(requestModel.getTboOrderSq());
			Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
			
			optTbOrder.ifPresentOrElse(tbOrder -> {
				responseModel.setStatus("403");
				responseModel.setMessage("Data already exists. Order No : " + requestModel.getTboOrderNo());
			}, () -> {
				TbOrder tbOrder = new TbOrder();
				SimpleMapper simpleMapper = new SimpleMapper();
				tbOrder = (TbOrder) simpleMapper.assign(requestModel, tbOrder);

				tbOrder.setTboCreateDate(new Date());
				tbOrder.setTboCreateId(tbUser.getTbuId());
				tbOrder.setTboStatus(TbOrderRepository.StatusNotPacked);
				
				tbOrderRepository.save(tbOrder);

				responseModel.setTbOrder(tbOrder);
				responseModel.setStatus("200");
				responseModel.setMessage("Order created");
			});
		}, () -> {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		});
		
		return responseModel;
	}
	
	public PostOrderAddsResponseModel postOrderAdds(PostOrderAddsRequestModel requestModel) throws Exception {
		PostOrderAddsResponseModel responseModel = new PostOrderAddsResponseModel(requestModel);
		
		for (PostOrderAddRequestModel postOrderAddRequestModel : requestModel.getLstPostOrderAddRequestModel()) {
			PostOrderAddResponseModel postOrderAddResponseModel = this.postOrderAdd(postOrderAddRequestModel);
			responseModel.getLstPostOrderAddResponseModel().add(postOrderAddResponseModel);
		}
		
		responseModel.setStatus("200");
		responseModel.setMessage("Order created");
		
		return responseModel;
	}
	
	public GetOrderResponseModel getOrder(String tboId, GetOrderRequestModel requestModel) throws Exception {
		GetOrderResponseModel responseModel = new GetOrderResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			TbOrder exampleTbOrder = new TbOrder();
			exampleTbOrder.setTboId(Integer.valueOf(tboId));
		
			Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
			
			optTbOrder.ifPresentOrElse(tbOrder -> {
				SimpleMapper simpleMapper = new SimpleMapper();
				tbOrder = (TbOrder) simpleMapper.assign(requestModel, tbOrder);
				
				responseModel.setTbOrder(tbOrder);
				responseModel.setStatus("200");
				responseModel.setMessage("Order ok");
			}, () -> {
				responseModel.setStatus("404");
				responseModel.setMessage("Not found");
			});
		}, () -> {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		});
		
		return responseModel;
	}
	
	public GetOrderPackResponseModel getOrderPack(String tbopOrderNo, String tbopAwb, Integer tbopQcId, GetOrderPackRequestModel requestModel) throws Exception {
		GetOrderPackResponseModel responseModel = new GetOrderPackResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			ViewOrderPack exampleViewOrderPack = new ViewOrderPack();
			exampleViewOrderPack.setTbuId(optTbUser.get().getTbuId());
			exampleViewOrderPack.setTboOrderNo(tbopOrderNo);
			Optional<ViewOrderPack> optViewOrderPack = viewOrderPackRepository.findOne(Example.of(exampleViewOrderPack));
			
			if (optViewOrderPack.isPresent() == false) {
				exampleViewOrderPack = new ViewOrderPack();
				exampleViewOrderPack.setTbuId(optTbUser.get().getTbuId());
				exampleViewOrderPack.setTboAwb(tbopAwb);
				optViewOrderPack = viewOrderPackRepository.findOne(Example.of(exampleViewOrderPack));
			}
			
			if (optViewOrderPack.isPresent() == false && tbopQcId != null) {
				exampleViewOrderPack = new ViewOrderPack();
				exampleViewOrderPack.setTbuId(optTbUser.get().getTbuId());
				exampleViewOrderPack.setTboQcId(tbopQcId);
				optViewOrderPack = viewOrderPackRepository.findOne(Example.of(exampleViewOrderPack));
			}
			
			if (optViewOrderPack.isPresent()) {
				TbOrderPack exampleTbOrderPack = new TbOrderPack();
				exampleTbOrderPack.setTbopOrderNo(optViewOrderPack.get().getTboOrderNo());
				
				Optional<TbOrderPack> optTbOrderPack = tbOrderPackRepository.findOne(Example.of(exampleTbOrderPack));
				
				if (optTbOrderPack.isPresent() == false) {
					TbOrder exampleTbOrder = new TbOrder();
					exampleTbOrder.setTboOrderNo(optViewOrderPack.get().getTboOrderNo());
					exampleTbOrder.setTboStatus(TbOrderRepository.StatusNotPacked);
					List<TbOrder> lstTbOrder = tbOrderRepository.findAll(Example.of(exampleTbOrder), Sort.by("tboSeq").ascending());
					responseModel.setLstTbOrder(lstTbOrder);
					
					if (lstTbOrder.size() > 0) {
						TbOrderPack tbOrderPack = new TbOrderPack();
						tbOrderPack.setTbopCreateDate(lstTbOrder.get(0).getTboCreateDate());
						tbOrderPack.setTbopCreateId(optTbUser.get().getTbuId());
						tbOrderPack.setTbopAwb(optViewOrderPack.get().getTboAwb());
						tbOrderPack.setTbopQcId(optViewOrderPack.get().getTboQcId());
						tbOrderPack.setTbopBrand(optViewOrderPack.get().getTboBrand());
						tbOrderPack.setTbopMarket(optViewOrderPack.get().getTboMarketId());						
						tbOrderPack.setTbopFrontliner(optViewOrderPack.get().getTboFrontliner());
						tbOrderPack.setTbopOrderNo(optViewOrderPack.get().getTboOrderNo());
						tbOrderPack.setTbopName(optViewOrderPack.get().getTboName());
						tbOrderPack.setTbopType(TbOrderPackRepository.TypeOrder);
						tbOrderPack.setTbopNotes(null);
						tbOrderPack.setTbopStatus(TbOrderPackRepository.StatusNotPacked);
						tbOrderPackRepository.save(tbOrderPack);
						responseModel.setTbOrderPack(tbOrderPack);
						
						responseModel.setStatus("200");
						responseModel.setMessage("Order Pack ok");
					} else {
						responseModel.setStatus("404");
						responseModel.setMessage("Not found");
					}					
				} else {
					if (!optTbOrderPack.get().getTbopStatus().equals(TbOrderPackRepository.StatusCompleted)) {
						responseModel.setTbOrderPack(optTbOrderPack.get());
						
						TbOrder exampleTbOrder = new TbOrder();
						exampleTbOrder.setTboOrderNo(optViewOrderPack.get().getTboOrderNo());
						
						List<TbOrder> lstTbOrder = tbOrderRepository.findPack(optTbUser.get().getTbuId(), optViewOrderPack.get().getTboOrderNo());
						responseModel.setLstTbOrder(lstTbOrder);
						
						TbOrderPackDetail exampleTbOrderPackDetail = new TbOrderPackDetail();
						exampleTbOrderPackDetail.setTbopId(optTbOrderPack.get().getTbopId());
						List<TbOrderPackDetail> lstTbOrderPackDetail = tbOrderPackDetailRepository.findAll(Example.of(exampleTbOrderPackDetail), Sort.by("tbopdId").ascending());
						responseModel.setLstTbOrderPackDetail(lstTbOrderPackDetail);
						
						responseModel.setStatus("200");
						responseModel.setMessage("Order Pack ok");
					} else {
						responseModel.setStatus("404");
						responseModel.setMessage("Not found");
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
	
	public GetScanBarcodeCheckResponseModel getScanBarcodeCheck(String tboOrderNo, String tbpSku, GetScanBarcodeCheckRequestModel requestModel) throws Exception {
		GetScanBarcodeCheckResponseModel responseModel = new GetScanBarcodeCheckResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			TbOrder exampleTbOrder = new TbOrder();
			exampleTbOrder.setTboOrderNo(tboOrderNo);
			exampleTbOrder.setTboSku(tbpSku);
			Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
			
			if (optTbOrder.isPresent() && !optTbOrder.get().getTboStatus().equals(TbOrderRepository.StatusAdditionalPacked)) {
				TbOrderPackDetail exampleTbOrderPackDetail = new TbOrderPackDetail();
				exampleTbOrderPackDetail.setTbopdOrderNo(tboOrderNo);
				exampleTbOrderPackDetail.setTbopdSku(tbpSku);
				Optional<TbOrderPackDetail> optTbOrderPackDetail = tbOrderPackDetailRepository.findOne(Example.of(exampleTbOrderPackDetail));
				
				if (optTbOrderPackDetail.isPresent() == false) {
					responseModel.setOrderStatus("");
					responseModel.setStatus("200");
					responseModel.setMessage("Scan Barcode Check ok");
				} else {
					if (optTbOrderPackDetail.get().getTbopdQtyPack() < optTbOrderPackDetail.get().getTbopdQty()) {
						responseModel.setOrderStatus("");
						responseModel.setStatus("200");
						responseModel.setMessage("Scan Barcode Check ok");
					} else {
						responseModel.setOrderStatus("Scan More");
						responseModel.setStatus("200");
						responseModel.setMessage("Scan Barcode Check ok");
					}
				}
			} else {
				responseModel.setOrderStatus("Not Ordered");
				responseModel.setStatus("200");
				responseModel.setMessage("Scan Barcode Check ok");
			}
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
	
	@Scheduled(cron = "0 0 23 ? * *", zone = "Asia/Jakarta")
	public void schedDelivered() {
		System.out.println("schedDelivered");
		
		TbOrderPack exampleTbOrderPack = new TbOrderPack();
		exampleTbOrderPack.setTbopStatus(TbOrderPackRepository.StatusDelivered);
		List<TbOrderPack> lstTbOrderPack = tbOrderPackRepository.findAll(Example.of(exampleTbOrderPack));
		for (TbOrderPack tbOrderPack : lstTbOrderPack) {
			TbOrder exampleTbOrder = new TbOrder();
			exampleTbOrder.setTboOrderNo(tbOrderPack.getTbopOrderNo());
			exampleTbOrder.setTboStatus(TbOrderRepository.StatusDelivered);
			List<TbOrder> lstTbOrder = tbOrderRepository.findAll(Example.of(exampleTbOrder));
			for (TbOrder tbOrder : lstTbOrder) {
				tbOrder.setTboStatus(TbOrderRepository.StatusCompleted);
				tbOrderRepository.save(tbOrder);
			}
			
			TbOrderPackDetail exampleTbOrderPackDetail = new TbOrderPackDetail();
			exampleTbOrderPackDetail.setTbopdOrderNo(tbOrderPack.getTbopOrderNo());
			exampleTbOrderPackDetail.setTbopdStatus(TbOrderPackDetailRepository.StatusDelivered);
			List<TbOrderPackDetail> lstTbOrderPackDetail = tbOrderPackDetailRepository.findAll(Example.of(exampleTbOrderPackDetail));
			for (TbOrderPackDetail tbOrderPackDetail : lstTbOrderPackDetail) {
				tbOrderPackDetail.setTbopdStatus(TbOrderPackDetailRepository.StatusCompleted);
				tbOrderPackDetailRepository.save(tbOrderPackDetail);
			}
			
			tbOrderPack.setTbopStatus(TbOrderPackRepository.StatusCompleted);
			tbOrderPackRepository.save(tbOrderPack);
		}
	}
	
	public PostScanBarcodeResponseModel postScanBarcode(PostScanBarcodeRequestModel requestModel) throws Exception {
		PostScanBarcodeResponseModel responseModel = new PostScanBarcodeResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			RestTemplate restTemplate = new RestTemplate();
			String requestParam = "" + 
					"email=" + requestModel.getEmail() +
					"&token=" + requestModel.getToken() +
					"&requestDate=" + requestModel.getRequestDate() +
					"&requestId=" + requestModel.getRequestId() +
					"&tbpIdSkuCode=" + requestModel.getTbpSku();
			ResponseEntity<String> response = restTemplate.getForEntity(env.getProperty("services.bsd.api.dms.product") + "/getproduct?" + requestParam, String.class);

			ObjectMapper mapper = new ObjectMapper();
			GetProductResponseModel getProductResponseModel = mapper.readValue(response.getBody(), GetProductResponseModel.class);
			
			if (requestModel.getAddNew().equals("true")) {
				TbOrder exampleTbOrderAddNew = new TbOrder();
				exampleTbOrderAddNew.setTboOrderNo(requestModel.getTboOrderNo());
				exampleTbOrderAddNew.setTboSku(requestModel.getTbpSku());
				Optional<TbOrder> optTbOrderAddNew = tbOrderRepository.findOne(Example.of(exampleTbOrderAddNew));
				
				if (optTbOrderAddNew.isPresent()) {
					optTbOrderAddNew.get().setTboUpdateDate(new Date());
					optTbOrderAddNew.get().setTboUpdateId(optTbUser.get().getTbuId());
					optTbOrderAddNew.get().setTboQty(optTbOrderAddNew.get().getTboQty() + 1);
					tbOrderRepository.save(optTbOrderAddNew.get());
				} else {
					TbOrder exampleTbOrder = new TbOrder();
					exampleTbOrder.setTboOrderNo(requestModel.getTboOrderNo());
					List<TbOrder> lstTbOrder = tbOrderRepository.findAll(Example.of(exampleTbOrder), Sort.by("tboSeq").descending());
					
					TbOrder tbOrder = new TbOrder();
					tbOrder.setTboCreateDate(new Date());
					tbOrder.setTboCreateId(optTbUser.get().getTbuId());
					tbOrder.setTboRow(lstTbOrder.get(0).getTboRow() + 1);
					tbOrder.setTboBrand(getProductResponseModel.getTbProduct().getTbbBrand());
					tbOrder.setTboMarketId(lstTbOrder.get(0).getTboMarketId());
					tbOrder.setTboQcId(lstTbOrder.get(0).getTboQcId());
					tbOrder.setTboSeq(lstTbOrder.get(0).getTboSeq() + 1);
					tbOrder.setTboMaxSeq(lstTbOrder.get(0).getTboMaxSeq() + 1);
					tbOrder.setTboOrderSq(tbOrder.getTboSeq() + "/" + lstTbOrder.get(0).getTboMaxSeq());
					tbOrder.setTboOrderNo(requestModel.getTboOrderNo());
					tbOrder.setTboSku(requestModel.getTbpSku());
					tbOrder.setTboItem(getProductResponseModel.getTbProduct().getTbpItem());
					tbOrder.setTboCode(getProductResponseModel.getTbProduct().getTbpCode());
					tbOrder.setTboLoc(getProductResponseModel.getTbProduct().getTbpLoc());
					tbOrder.setTboQty(1);
					tbOrder.setTboName(lstTbOrder.get(0).getTboName());
					tbOrder.setTboHp(lstTbOrder.get(0).getTboHp());
					tbOrder.setTboAddress1(lstTbOrder.get(0).getTboAddress1());
					tbOrder.setTboAddress2(lstTbOrder.get(0).getTboAddress2());
					tbOrder.setTboAddress3(lstTbOrder.get(0).getTboAddress3());
					tbOrder.setTboAddress4(lstTbOrder.get(0).getTboAddress4());
					tbOrder.setTboAddress5(lstTbOrder.get(0).getTboAddress5());
					tbOrder.setTboFullAddress(lstTbOrder.get(0).getTboFullAddress());
					tbOrder.setTboAwb(lstTbOrder.get(0).getTboAwb());
					tbOrder.setTboStatus(TbOrderRepository.StatusAdditionalPacked);
					tbOrder.setTboCheck(TbOrderRepository.CheckOk);
					tbOrder.setTboType(TbOrderRepository.TypeOrder);
					tbOrder.setTboTypeNotPacked(TbOrderRepository.TypeOrder);
					tbOrderRepository.save(tbOrder);
				}
			}
			
			TbOrder exampleTbOrder = new TbOrder();
			exampleTbOrder.setTboOrderNo(requestModel.getTboOrderNo());
			exampleTbOrder.setTboSku(requestModel.getTbpSku());
			Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
			
			if (optTbOrder.isPresent()) {
				TbOrderPack exampleTbOrderPack = new TbOrderPack();
				exampleTbOrderPack.setTbopOrderNo(requestModel.getTboOrderNo());
				Optional<TbOrderPack> optTbOrderPack = tbOrderPackRepository.findOne(Example.of(exampleTbOrderPack));
				
				TbOrderPackDetail exampleTbOrderPackDetail = new TbOrderPackDetail();
				exampleTbOrderPackDetail.setTbopdOrderNo(requestModel.getTboOrderNo());
				exampleTbOrderPackDetail.setTbopdSku(requestModel.getTbpSku());
				Optional<TbOrderPackDetail> optTbOrderPackDetail = tbOrderPackDetailRepository.findOne(Example.of(exampleTbOrderPackDetail));
				
				TbOrderPackDetail tbOrderPackDetail;
				
				if (optTbOrderPackDetail.isPresent()) {
					tbOrderPackDetail = optTbOrderPackDetail.get();
					if (requestModel.getAddNew().equals("true")) {
						tbOrderPackDetail.setTbopdQty(tbOrderPackDetail.getTbopdQty() + 1);
					}
					tbOrderPackDetail.setTbopdQtyPack(tbOrderPackDetail.getTbopdQtyPack() + 1);
					
					if (tbOrderPackDetail.getTbopdQty() == tbOrderPackDetail.getTbopdQtyPack()) {
						if (requestModel.getAddNew().equals("true")) {
							optTbOrder.get().setTboStatus(TbOrderRepository.StatusAdditionalPacked);
						} else {
							optTbOrder.get().setTboStatus(TbOrderRepository.StatusPacked);
						}
						optTbOrder.get().setTboCheck(TbOrderRepository.CheckOk);
						tbOrderRepository.save(optTbOrder.get());
						
						tbOrderPackDetail.setTbopdStatus(optTbOrder.get().getTboStatus());
						tbOrderPackDetail.setTbopdCheck(optTbOrder.get().getTboCheck());
					} else {
						tbOrderPackDetail.setTbopdStatus(optTbOrder.get().getTboStatus());
						tbOrderPackDetail.setTbopdCheck(optTbOrder.get().getTboCheck());
					}
					
					tbOrderPackDetailRepository.save(tbOrderPackDetail);
					
					responseModel.setTbOrderPackDetail(tbOrderPackDetail);
				} else {
					tbOrderPackDetail = new TbOrderPackDetail();
					tbOrderPackDetail.setTbopdCreateDate(new Date());
					tbOrderPackDetail.setTbopdCreateId(optTbUser.get().getTbuId());
					tbOrderPackDetail.setTbopId(optTbOrderPack.get().getTbopId());
					tbOrderPackDetail.setTbopdOrderNo(optTbOrderPack.get().getTbopOrderNo());
					tbOrderPackDetail.setTbopdBrand(getProductResponseModel.getTbProduct().getTbbBrand());
					tbOrderPackDetail.setTbopdSku(getProductResponseModel.getTbProduct().getTbpSku());
					tbOrderPackDetail.setTbopdItem(getProductResponseModel.getTbProduct().getTbpItem());
					tbOrderPackDetail.setTbopdCode(getProductResponseModel.getTbProduct().getTbpCode());
					tbOrderPackDetail.setTbopdQty(optTbOrder.get().getTboQty());
					tbOrderPackDetail.setTbopdQtyPack(1);
					tbOrderPackDetail.setTbopdType(TbOrderPackDetailRepository.TypeProduct);
					if (tbOrderPackDetail.getTbopdQty() == tbOrderPackDetail.getTbopdQtyPack()) {
						if (requestModel.getAddNew().equals("true")) {
							optTbOrder.get().setTboStatus(TbOrderRepository.StatusAdditionalPacked);
						} else {
							optTbOrder.get().setTboStatus(TbOrderRepository.StatusPacked);
						}
						optTbOrder.get().setTboCheck(TbOrderRepository.CheckOk);
						tbOrderRepository.save(optTbOrder.get());
						
						tbOrderPackDetail.setTbopdStatus(optTbOrder.get().getTboStatus());
						tbOrderPackDetail.setTbopdCheck(optTbOrder.get().getTboCheck());
					} else {
						if (requestModel.getAddNew().equals("true")) {
							tbOrderPackDetail.setTbopdStatus(TbOrderPackDetailRepository.StatusAdditionalPacked);
							tbOrderPackDetail.setTbopdCheck(TbOrderPackDetailRepository.CheckOk);
						} else {
							tbOrderPackDetail.setTbopdStatus(optTbOrder.get().getTboStatus());
							tbOrderPackDetail.setTbopdCheck(optTbOrder.get().getTboCheck());
						}
					}
					tbOrderPackDetail.setTbopdMarket(optTbOrder.get().getTboMarketId());
					
					tbOrderPackDetailRepository.save(tbOrderPackDetail);
					
					responseModel.setTbOrderPackDetail(tbOrderPackDetail);
				}
				
				for (LstViewGwpSkuProduct lstViewGwpSkuProduct : getProductResponseModel.getLstViewGwpSkuProduct()) {
					TbOrderPackDetail tbOrderPackGwpBundleDetail = new TbOrderPackDetail();
					tbOrderPackGwpBundleDetail.setTbopdCreateDate(new Date());
					tbOrderPackGwpBundleDetail.setTbopdCreateId(tbOrderPackDetail.getTbopdCreateId());
					tbOrderPackGwpBundleDetail.setTbopId(tbOrderPackDetail.getTbopId());
					tbOrderPackGwpBundleDetail.setTbopdOrderNo(tbOrderPackDetail.getTbopdOrderNo());
					tbOrderPackGwpBundleDetail.setTbopdBrand(lstViewGwpSkuProduct.getTbpgTbpBrand());
					tbOrderPackGwpBundleDetail.setTbopdSku(lstViewGwpSkuProduct.getTbgSku());
					tbOrderPackGwpBundleDetail.setTbopdSkuAdditional(lstViewGwpSkuProduct.getTbgsSku());
					tbOrderPackGwpBundleDetail.setTbopdItem(lstViewGwpSkuProduct.getTbpgTbpItem());
					tbOrderPackGwpBundleDetail.setTbopdCode(lstViewGwpSkuProduct.getTbpgTbpCode());
					if (lstViewGwpSkuProduct.getTbgsMin() == 0 || lstViewGwpSkuProduct.getTbgsMinAccu() == 0) {
						tbOrderPackGwpBundleDetail.setTbopdStatus(TbOrderPackDetailRepository.StatusAdditionalPacked);
						tbOrderPackGwpBundleDetail.setTbopdType(TbOrderPackDetailRepository.TypeBundle);
					} else {
						tbOrderPackGwpBundleDetail.setTbopdStatus(TbOrderPackDetailRepository.StatusAdditionalPacked);
						tbOrderPackGwpBundleDetail.setTbopdType(TbOrderPackDetailRepository.TypeGwp);
					}
					tbOrderPackGwpBundleDetail.setTbopdCheck(tbOrderPackDetail.getTbopdCheck());
					tbOrderPackGwpBundleDetail.setTbopdTypeNotPacked(TbOrderPackDetailRepository.TypeNotPackedItem);
					tbOrderPackGwpBundleDetail.setTbopdMarket(tbOrderPackDetail.getTbopdMarket());

					tbOrderPackDetailRepository.save(tbOrderPackGwpBundleDetail);
				}
				
				TbOrder exampleTbOrderAll = new TbOrder();
				exampleTbOrderAll.setTboOrderNo(requestModel.getTboOrderNo());
				List<TbOrder> lstTbOrder = tbOrderRepository.findAll(Example.of(exampleTbOrderAll));
				boolean allPacked = true;
				for (TbOrder tbOrder : lstTbOrder) {
					if (!tbOrder.getTboStatus().equals(TbOrderRepository.StatusNotConfirmed) && !tbOrder.getTboStatus().equals(TbOrderRepository.StatusPacked) && !tbOrder.getTboStatus().equals(TbOrderRepository.StatusAdditionalPacked)) {
						allPacked = false;
					}
				}
				
				if (allPacked) {
					optTbOrderPack.get().setTbopStatus(TbOrderPackRepository.StatusPacked);
					tbOrderPackRepository.save(optTbOrderPack.get());
				}
				
				responseModel.setTbOrder(optTbOrder.get());
				responseModel.setTbOrderPack(optTbOrderPack.get());
				responseModel.setStatus("200");
				responseModel.setMessage("Order Pack ok");
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
	
	public PostChangePackedResponseModel postChangePacked(PostChangePackedRequestModel requestModel) throws Exception {
		PostChangePackedResponseModel responseModel = new PostChangePackedResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			TbOrder exampleTbOrder = new TbOrder();
			exampleTbOrder.setTboOrderNo(requestModel.getTboOrderNo());
			exampleTbOrder.setTboSku(requestModel.getTbpSku());
			Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
			optTbOrder.get().setTboStatus(TbOrderRepository.StatusPacked);
			optTbOrder.get().setTboCheck(TbOrderRepository.CheckOk);
			tbOrderRepository.save(optTbOrder.get());
			
			TbOrderPackDetail exampleTbOrderPackDetailProduct = new TbOrderPackDetail();
			exampleTbOrderPackDetailProduct.setTbopdOrderNo(optTbOrder.get().getTboOrderNo());
			exampleTbOrderPackDetailProduct.setTbopdSku(optTbOrder.get().getTboSku());
			List<TbOrderPackDetail> lstTbOrderPackDetailProduct = tbOrderPackDetailRepository.findAll(Example.of(exampleTbOrderPackDetailProduct));
			for (TbOrderPackDetail tbOrderPackDetailProduct : lstTbOrderPackDetailProduct) {
				tbOrderPackDetailProduct.setTbopdStatus(TbOrderPackDetailRepository.StatusPacked);
				tbOrderPackDetailProduct.setTbopdCheck(TbOrderPackDetailRepository.CheckOk);
			}
			tbOrderPackDetailRepository.saveAll(lstTbOrderPackDetailProduct);
			
			TbOrderPackDetail exampleTbOrderPackDetailGwp = new TbOrderPackDetail();
			exampleTbOrderPackDetailGwp.setTbopdOrderNo(optTbOrder.get().getTboOrderNo());
			exampleTbOrderPackDetailGwp.setTbopdSkuAdditional(optTbOrder.get().getTboSku());
			List<TbOrderPackDetail> lstTbOrderPackDetailGwp = tbOrderPackDetailRepository.findAll(Example.of(exampleTbOrderPackDetailGwp));
			for (TbOrderPackDetail tbOrderPackDetailGwp : lstTbOrderPackDetailGwp) {
				tbOrderPackDetailGwp.setTbopdStatus(TbOrderPackDetailRepository.StatusPacked);
				tbOrderPackDetailGwp.setTbopdCheck(TbOrderPackDetailRepository.CheckOk);
			}
			tbOrderPackDetailRepository.saveAll(lstTbOrderPackDetailGwp);
			
			TbOrder exampleTbOrderAll = new TbOrder();
			exampleTbOrderAll.setTboOrderNo(optTbOrder.get().getTboOrderNo());
			List<TbOrder> lstTbOrder = tbOrderRepository.findAll(Example.of(exampleTbOrderAll));
			boolean allOk = true;
			for (TbOrder tbOrder : lstTbOrder) {
				if (tbOrder.getTboCheck().equals(TbOrderRepository.CheckNotOk)) {
					allOk = false;
				}
			}
			
			if (allOk) {
				TbOrderPack exampleTbOrderPack = new TbOrderPack();
				exampleTbOrderPack.setTbopOrderNo(optTbOrder.get().getTboOrderNo());
				Optional<TbOrderPack> optTbOrderPack = tbOrderPackRepository.findOne(Example.of(exampleTbOrderPack));
				optTbOrderPack.get().setTbopStatus(TbOrderPackRepository.StatusPacked);
				tbOrderPackRepository.save(optTbOrderPack.get());
			}
				
			responseModel.setStatus("200");
			responseModel.setMessage("Change Packed ok");
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
	
	public PostDeletePackedResponseModel postDeletePacked(PostDeletePackedRequestModel requestModel) throws Exception {
		PostDeletePackedResponseModel responseModel = new PostDeletePackedResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			TbOrderPackDetail exampleTbOrderPackDetail = new TbOrderPackDetail();
			exampleTbOrderPackDetail.setTbopdId(Integer.valueOf(requestModel.getTbopdId()));
			Optional<TbOrderPackDetail> optTbOrderPackDetail = tbOrderPackDetailRepository.findOne(Example.of(exampleTbOrderPackDetail));
			tbOrderPackDetailRepository.delete(optTbOrderPackDetail.get());
			
			if (optTbOrderPackDetail.get().getTbopdStatus().equals(TbOrderPackDetailRepository.StatusAdditionalPacked)) {
				TbOrder exampleTbOrder = new TbOrder();
				exampleTbOrder.setTboOrderNo(optTbOrderPackDetail.get().getTbopdOrderNo());
				exampleTbOrder.setTboSku(optTbOrderPackDetail.get().getTbopdSku());
				Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
				tbOrderRepository.delete(optTbOrder.get());				
			} else {
				TbOrderPack exampleTbOrderPack = new TbOrderPack();
				exampleTbOrderPack.setTbopOrderNo(optTbOrderPackDetail.get().getTbopdOrderNo());
				Optional<TbOrderPack> optTbOrderPack = tbOrderPackRepository.findOne(Example.of(exampleTbOrderPack));
				optTbOrderPack.get().setTbopStatus(TbOrderPackRepository.StatusNotPacked);
				tbOrderPackRepository.save(optTbOrderPack.get());
				
				TbOrder exampleTbOrder = new TbOrder();
				exampleTbOrder.setTboOrderNo(optTbOrderPackDetail.get().getTbopdOrderNo());
				exampleTbOrder.setTboSku(optTbOrderPackDetail.get().getTbopdSku());
				Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
				optTbOrder.get().setTboCheck(TbOrderRepository.CheckNotOk);
				optTbOrder.get().setTboStatus(TbOrderRepository.StatusNotPacked);
				tbOrderRepository.save(optTbOrder.get());
			}
				
			responseModel.setStatus("200");
			responseModel.setMessage("Delete Packed ok");
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
	
	public PostOrderEditResponseModel postOrderEdit(PostOrderEditRequestModel requestModel) throws Exception {
		PostOrderEditResponseModel responseModel = new PostOrderEditResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			TbOrder exampleTbOrder = new TbOrder();
			exampleTbOrder.setTboId(Integer.valueOf(requestModel.getTboId()));
			Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
			
			if (optTbOrder.isPresent()) {
				SimpleMapper simpleMapper = new SimpleMapper();
				TbOrder tbOrder = optTbOrder.get();
				tbOrder = (TbOrder) simpleMapper.assign(requestModel, tbOrder);

				tbOrder.setTboUpdateDate(new Date());
				tbOrder.setTboUpdateId(optTbUser.get().getTbuId());
				
				tbOrderRepository.save(tbOrder);

				responseModel.setTbOrder(tbOrder);
				responseModel.setStatus("200");
				responseModel.setMessage("Order updated");
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
	
	public PostOrderDeleteResponseModel postOrderDelete(PostOrderDeleteRequestModel requestModel) throws Exception {
		PostOrderDeleteResponseModel responseModel = new PostOrderDeleteResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			
			TbOrder exampleTbOrder = new TbOrder();
			exampleTbOrder.setTboId(Integer.valueOf(requestModel.getTboId()));
			Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
			
			optTbOrder.ifPresentOrElse(tbOrder -> {
				tbOrderRepository.delete(tbOrder);
				
				responseModel.setStatus("200");
				responseModel.setMessage("Order deleted");
			}, () -> {
				responseModel.setStatus("404");
				responseModel.setMessage("Not found");
			});
		}, () -> {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		});
		
		return responseModel;
	}
	
	public PostConfirmResponseModel postConfirm(PostConfirmRequestModel requestModel) throws Exception {
		PostConfirmResponseModel responseModel = new PostConfirmResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);

		if (requestModel.getOrderNo().length > 0) {
			TbUser exampleTbUser = new TbUser();
			exampleTbUser.setTbuEmail(requestModel.getEmail());
			exampleTbUser.setTbuStatus(TbUserRepository.Active);
			Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));

			if (optTbUser.isPresent()) {
				String messageOk = "";
				String messageFail = "";
				
				List<TbOrder> lstTbOrder = new ArrayList<TbOrder>();
				List<TbOrderStatus> lstTbOrderStatus = new ArrayList<TbOrderStatus>();

				for (int i = 0; i < requestModel.getOrderNo().length; i++) {
					TbOrderPackDetail exampleTbOrderPackDetail = new TbOrderPackDetail();
					exampleTbOrderPackDetail.setTbopdOrderNo(requestModel.getOrderNo()[i]);
					exampleTbOrderPackDetail.setTbopdSku(requestModel.getSku()[i]);
					exampleTbOrderPackDetail.setTbopdStatus(TbOrderPackDetailRepository.StatusPacked);
					Optional<TbOrderPackDetail> optTbOrderPackDetail = tbOrderPackDetailRepository.findOne(Example.of(exampleTbOrderPackDetail));

					if (optTbOrderPackDetail.isPresent() == false) {
						exampleTbOrderPackDetail.setTbopdStatus(TbOrderPackDetailRepository.StatusAdditionalPacked);
						optTbOrderPackDetail = tbOrderPackDetailRepository.findOne(Example.of(exampleTbOrderPackDetail));
					}

					if (optTbOrderPackDetail.isPresent() == false) {
							messageFail = messageFail + requestModel.getOrderNo()[i] + "/" + requestModel.getSku()[i] + " not found<br>";						
					} else {
						RestTemplate restTemplateGetproduct = new RestTemplate();
						String requestParamGetproduct = "" + 
								"email=" + requestModel.getEmail() +
								"&token=" + requestModel.getToken() +
								"&requestDate=" + requestModel.getRequestDate() +
								"&requestId=" + requestModel.getRequestId() +
								"&tbpIdSkuCode=" + requestModel.getSku()[i];
						ResponseEntity<String> responseGetproduct = restTemplateGetproduct.getForEntity(env.getProperty("services.bsd.api.dms.product") + "/getproduct?" + requestParamGetproduct, String.class);

						ObjectMapper mapper = new ObjectMapper();
						GetProductResponseModel getProductResponseModel = mapper.readValue(responseGetproduct.getBody(), GetProductResponseModel.class);
						ViewProductMarket viewProductMarket = new ViewProductMarket();						

						for (ViewProductMarket viewProductMarket_ : getProductResponseModel.getLstViewProductMarket()) {
							if (viewProductMarket_.getTbmMarketId().equals(optTbOrderPackDetail.get().getTbopdMarket())) {
								viewProductMarket = viewProductMarket_;
							}
						}

						if (viewProductMarket.getTbpmQty() < optTbOrderPackDetail.get().getTbopdQty()) {
							messageFail = messageFail + requestModel.getOrderNo()[i] + "/" + requestModel.getSku()[i] + "/" + optTbOrderPackDetail.get().getTbopdMarket() + " no qty (" + optTbOrderPackDetail.get().getTbopdQty() + " / " + viewProductMarket.getTbpmQty() + ")<br>";
						} else {
							TbOrder exampleTbOrder = new TbOrder();
							exampleTbOrder.setTboOrderNo(requestModel.getOrderNo()[i]);
							exampleTbOrder.setTboSku(requestModel.getSku()[i]);
							exampleTbOrder.setTboStatus(TbOrderRepository.StatusPacked);
							Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));

							if (optTbOrder.isPresent() == false) {
								exampleTbOrder = new TbOrder();
								exampleTbOrder.setTboOrderNo(requestModel.getOrderNo()[i]);
								exampleTbOrder.setTboSku(requestModel.getSku()[i]);
								exampleTbOrder.setTboStatus(TbOrderRepository.StatusAdditionalPacked);
								optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
							}							

							if (optTbOrder.isPresent() == false) {
								messageFail = messageFail + "Order " + requestModel.getOrderNo()[i] + " not found<br>";
							} else {
								optTbOrder.get().setTboStatus(TbOrderRepository.StatusDelivered);
								tbOrderRepository.save(optTbOrder.get());

								lstTbOrder.add(optTbOrder.get());

								optTbOrderPackDetail.get().setTbopdStatus(TbOrderPackDetailRepository.StatusDelivered);
								tbOrderPackDetailRepository.save(optTbOrderPackDetail.get());

								TbOrderStatus tbOrderStatus = new TbOrderStatus();
								tbOrderStatus.setTbosCreateDate(Date.from(LocalDateTime.now(ZoneOffset.UTC).toInstant(ZoneOffset.UTC)));
								tbOrderStatus.setTbosCreateId(optTbUser.get().getTbuId());
								tbOrderStatus.setTboId(optTbOrder.get().getTboId());
								tbOrderStatus.setTbosStatus(TbOrderStatusRepository.StatusDelivered);						
								tbOrderStatusRepository.save(tbOrderStatus);

								lstTbOrderStatus.add(tbOrderStatus);

								RestTemplate restTemplatePostproductconfirm = new RestTemplate();
								
								PostProductConfirmRequestModel postProductConfirmRequestModel = new PostProductConfirmRequestModel();
								postProductConfirmRequestModel.setEmail(requestModel.getEmail());
								postProductConfirmRequestModel.setRequestDate(requestModel.getRequestDate());
								postProductConfirmRequestModel.setRequestId(requestModel.getRequestId());
								postProductConfirmRequestModel.setToken(requestModel.getToken());
								postProductConfirmRequestModel.setTbpcOrderNo(optTbOrder.get().getTboOrderNo());
								postProductConfirmRequestModel.setTbpcSku(optTbOrder.get().getTboSku());
								postProductConfirmRequestModel.setTbpcQty(optTbOrder.get().getTboQty());
								postProductConfirmRequestModel.setTbpcMarket(optTbOrder.get().getTboMarketId());
								
								HttpEntity<PostProductConfirmRequestModel> requestPostProductConfirmRequestModel = new HttpEntity<>(postProductConfirmRequestModel);
								restTemplatePostproductconfirm.postForEntity(env.getProperty("services.bsd.api.dms.product") + "/postproductconfirm?", requestPostProductConfirmRequestModel, String.class);

								List<com.api.dms.order.model.report.TbOrder> lstTbOrderReport = new ArrayList<com.api.dms.order.model.report.TbOrder>();
								
								SimpleMapper simpleMapper = new SimpleMapper();
								
								for (TbOrder tbOrder : lstTbOrder) {
									com.api.dms.order.model.report.TbOrder tbOrderReport = new com.api.dms.order.model.report.TbOrder();
									tbOrderReport = (com.api.dms.order.model.report.TbOrder) simpleMapper.assign(tbOrder, tbOrderReport);
									lstTbOrderReport.add(tbOrderReport);
								}

								PostSyncConfirmOrderRequestModel postSyncConfirmOrderRequestModel = new PostSyncConfirmOrderRequestModel();
								postSyncConfirmOrderRequestModel.setRequestDate(requestModel.getRequestDate());
								postSyncConfirmOrderRequestModel.setRequestId(requestModel.getRequestId());
								postSyncConfirmOrderRequestModel.setEmail(requestModel.getEmail());
								postSyncConfirmOrderRequestModel.setLstTbOrder(lstTbOrderReport);
								
								RestTemplate restTemplatePostsyncconfirmorder = new RestTemplate();

								HttpEntity<PostSyncConfirmOrderRequestModel> requestPostsyncconfirmorder = new HttpEntity<>(postSyncConfirmOrderRequestModel);				
								restTemplatePostsyncconfirmorder.postForEntity(env.getProperty("services.bsd.api.dms.report.postsyncconfirmorder"), requestPostsyncconfirmorder, String.class);

								messageOk = messageOk + "Order " + requestModel.getOrderNo()[i] + " with product " + requestModel.getSku()[i] + " delivered<br>";
							}
						}
					}
				}

				if (messageFail == "") {
					responseModel.setStatus("200");
					responseModel.setMessage(messageOk + "<br>" + messageFail);
				} else {
					responseModel.setStatus("404");
					responseModel.setMessage(messageOk + "<br>" + messageFail);
				}
			} else {
				responseModel.setStatus("404");
				responseModel.setMessage("Not found");
			}
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Confirm Failed");
		}		
		
		return responseModel;
	}
	
	public PostConfirmOrderResponseModel postConfirmOrder(PostConfirmOrderRequestModel requestModel) throws Exception {
		PostConfirmOrderResponseModel responseModel = new PostConfirmOrderResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			boolean ok = true;
			
			for (int i = 0; i < requestModel.getOrderNo().length; i++) {
				TbOrder exampleTbOrder = new TbOrder();
				exampleTbOrder.setTboOrderNo(requestModel.getOrderNo()[i]);
				exampleTbOrder.setTboSku(requestModel.getSku()[i]);
				exampleTbOrder.setTboStatus(TbOrderRepository.StatusNotConfirmed);
				Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
				
				if (!optTbOrder.isPresent()) {
					ok = false;
				}
			}
			
			if (ok) {
								for (int i = 0; i < requestModel.getOrderNo().length; i++) {
					TbOrder exampleTbOrder = new TbOrder();
					exampleTbOrder.setTboOrderNo(requestModel.getOrderNo()[i]);
					exampleTbOrder.setTboSku(requestModel.getSku()[i]);
					exampleTbOrder.setTboStatus(TbOrderRepository.StatusNotConfirmed);
					Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
					
					optTbOrder.get().setTboStatus(TbOrderRepository.StatusNotPacked);
					tbOrderRepository.save(optTbOrder.get());
}
				
				responseModel.setStatus("200");
				responseModel.setMessage("Confirm ok");
			} else {				
				responseModel.setStatus("404");
				responseModel.setMessage("Confirm failed");
			}
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
	
	public PostSyncBrandResponseModel postSyncBrand(PostSyncBrandRequestModel requestModel) throws Exception {
		PostSyncBrandResponseModel responseModel = new PostSyncBrandResponseModel(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			SimpleMapper simpleMapper = new SimpleMapper();
			
			for (com.api.dms.order.model.order.TbBrand tbBrandOrder : requestModel.getLstTbBrand()) {
				TbBrand exampleTbBrand = new TbBrand();
				exampleTbBrand.setTbbBrandId(tbBrandOrder.getTbbBrandId());
				
				Optional<TbBrand> optTbBrand = tbBrandRepository.findOne(Example.of(exampleTbBrand));
				
				if (optTbBrand.isPresent() == false) {
					TbBrand tbBrand = new TbBrand();
					tbBrand = (TbBrand) simpleMapper.assign(tbBrandOrder, tbBrand);
					
					tbBrandRepository.save(tbBrand);
				}
			}
			
			for (com.api.dms.order.model.order.TbUserBrand tbUserBrandOrder : requestModel.getLstTbUserBrand()) {
				TbUserBrand exampleTbUserBrand = new TbUserBrand();
				exampleTbUserBrand.setTbuId(tbUserBrandOrder.getTbuId());
				exampleTbUserBrand.setTbbBrandId(tbUserBrandOrder.getTbbBrandId());
				
				Optional<TbUserBrand> optTbUserBrand = tbUserBrandRepository.findOne(Example.of(exampleTbUserBrand));
				
				if (optTbUserBrand.isPresent() == false) {
					TbUserBrand tbUserBrand = new TbUserBrand();
					tbUserBrand = (TbUserBrand) simpleMapper.assign(tbUserBrandOrder, tbUserBrand);
					
					tbUserBrandRepository.save(tbUserBrand);
				}
			}
			
			responseModel.setStatus("200");
			responseModel.setMessage("Sync Brand ok");
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
}
