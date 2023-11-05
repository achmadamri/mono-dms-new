package com.api.dms.report.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

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
import org.springframework.stereotype.Service;

import com.api.dms.report.db.entity.TbBrand;
import com.api.dms.report.db.entity.TbOrder;
import com.api.dms.report.db.entity.TbProduct;
import com.api.dms.report.db.entity.TbProductMarket;
import com.api.dms.report.db.entity.TbUser;
import com.api.dms.report.db.entity.TbUserBrand;
import com.api.dms.report.db.entity.TbUserMarket;
import com.api.dms.report.db.entity.ViewOrder;
import com.api.dms.report.db.entity.ViewSales;
import com.api.dms.report.db.entity.ViewStock;
import com.api.dms.report.db.repository.TbBrandRepository;
import com.api.dms.report.db.repository.TbOrderRepository;
import com.api.dms.report.db.repository.TbOrderStatusRepository;
import com.api.dms.report.db.repository.TbProductMarketRepository;
import com.api.dms.report.db.repository.TbProductRepository;
import com.api.dms.report.db.repository.TbUserBrandRepository;
import com.api.dms.report.db.repository.TbUserMarketRepository;
import com.api.dms.report.db.repository.TbUserRepository;
import com.api.dms.report.db.repository.ViewOrderRepository;
import com.api.dms.report.db.repository.ViewSalesRepository;
import com.api.dms.report.db.repository.ViewStockRepository;
import com.api.dms.report.model.report.GetDashboardRequestModel;
import com.api.dms.report.model.report.GetDashboardResponseModel;
import com.api.dms.report.model.report.GetOrderListRequestModel;
import com.api.dms.report.model.report.GetOrderListResponseModel;
import com.api.dms.report.model.report.GetSalesListRequestModel;
import com.api.dms.report.model.report.GetSalesListResponseModel;
import com.api.dms.report.model.report.GetStockListRequestModel;
import com.api.dms.report.model.report.GetStockListResponseModel;
import com.api.dms.report.model.report.PostSyncBrandRequestModel;
import com.api.dms.report.model.report.PostSyncBrandResponseModel;
import com.api.dms.report.model.report.PostSyncConfirmOrderRequestModel;
import com.api.dms.report.model.report.PostSyncConfirmOrderResponseModel;
import com.api.dms.report.model.report.PostSyncOrderRequestModel;
import com.api.dms.report.model.report.PostSyncOrderResponseModel;
import com.api.dms.report.model.report.PostSyncOrderStatusRequestModel;
import com.api.dms.report.model.report.PostSyncOrderStatusResponseModel;
import com.api.dms.report.model.report.PostSyncProductRequestModel;
import com.api.dms.report.model.report.PostSyncProductResponseModel;
import com.api.dms.report.util.SimpleMapper;
import com.api.dms.report.util.TokenUtil;

@Service
public class ReportService {

	private Logger log = LoggerFactory.getLogger(ReportService.class);
	
	@Autowired
	private Environment env;
	
	private TokenUtil tokenUtil = new TokenUtil();
	
	@Autowired
	private TbUserRepository tbUserRepository;
	
	@Autowired
	private TbProductRepository tbProductRepository;
	
	@Autowired
	private TbProductMarketRepository tbProductMarketRepository;
	
	@Autowired
	private TbOrderRepository tbOrderRepository;
	
	@Autowired
	private ViewOrderRepository viewOrderRepository;
	
	@Autowired
	private ViewStockRepository viewStockRepository;
	
	@Autowired
	private ViewSalesRepository viewSalesRepository;
	
	@Autowired
	private TbOrderStatusRepository tbOrderStatusRepository;
	
	@Autowired
	private TbBrandRepository tbBrandRepository;
	
	@Autowired
	private TbUserBrandRepository tbUserBrandRepository;
	
	@Autowired
	private TbUserMarketRepository tbUserMarketRepository;
	
	public PostSyncConfirmOrderResponseModel postSyncConfirmOrder(PostSyncConfirmOrderRequestModel requestModel) throws Exception {
		PostSyncConfirmOrderResponseModel responseModel = new PostSyncConfirmOrderResponseModel(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));		

		if (optTbUser.isPresent()) {
			for (TbOrder tbOrder : requestModel.getLstTbOrder()) {
				TbOrder exampleTbOrder = new TbOrder();
				exampleTbOrder.setTboOrderNo(tbOrder.getTboOrderNo());
				Optional<TbOrder> optTbOrder = tbOrderRepository.findOne(Example.of(exampleTbOrder));
				
				if (optTbOrder.isPresent()) {
					optTbOrder.get().setTboStatus(tbOrder.getTboStatus());
					
					tbOrderRepository.save(optTbOrder.get());
				}
			}			
			
			responseModel.setStatus("200");
			responseModel.setMessage("Sync Confirm Order ok");
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
	
	public PostSyncOrderResponseModel postSyncOrder(PostSyncOrderRequestModel requestModel) throws Exception {
		PostSyncOrderResponseModel responseModel = new PostSyncOrderResponseModel(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			tbOrderRepository.saveAll(requestModel.getLstTbOrder());
			
			responseModel.setStatus("200");
			responseModel.setMessage("Sync Order ok");
		}, () -> {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		});
		
		return responseModel;
	}
	
	public PostSyncOrderStatusResponseModel PostSyncOrderStatus(PostSyncOrderStatusRequestModel requestModel) throws Exception {
		PostSyncOrderStatusResponseModel responseModel = new PostSyncOrderStatusResponseModel(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			tbOrderStatusRepository.saveAll(requestModel.getLstTbOrderStatus());
			
			responseModel.setStatus("200");
			responseModel.setMessage("Sync Order Status ok");
		}, () -> {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		});
		
		return responseModel;
	}
	
	public PostSyncProductResponseModel postSyncProduct(PostSyncProductRequestModel requestModel) throws Exception {
		PostSyncProductResponseModel responseModel = new PostSyncProductResponseModel(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			SimpleMapper simpleMapper = new SimpleMapper();
			
			for (com.api.dms.report.model.report.TbProduct tbProductReport : requestModel.getLstTbProduct()) {
				TbProduct tbProduct = new TbProduct();
				
				tbProduct = (TbProduct) simpleMapper.assign(tbProductReport, tbProduct);
				
				TbProduct exampleTbProduct = new TbProduct();
				exampleTbProduct.setTbpSku(tbProduct.getTbpSku());
				Optional<TbProduct> optTbProduct = tbProductRepository.findOne(Example.of(exampleTbProduct));
				
				if (optTbProduct.isPresent()) {
					tbProduct.setTbpId(optTbProduct.get().getTbpId());
				} else {
					tbProduct.setTbpId(null);
				}
				
				tbProductRepository.save(tbProduct);
				
				List<com.api.dms.report.model.report.TbProductMarket> lstTbProductMarketReport = tbProductReport.getLstTbProductMarket();
				if (lstTbProductMarketReport != null) {
					for (com.api.dms.report.model.report.TbProductMarket tbProductMarketReport : lstTbProductMarketReport) {
						TbProductMarket tbProductMarket = new TbProductMarket();
						tbProductMarket = (TbProductMarket) simpleMapper.assign(tbProductMarketReport, tbProductMarket);
						
						tbProductMarketRepository.save(tbProductMarket);
					}
				}				
			}
			
			responseModel.setStatus("200");
			responseModel.setMessage("Sync Product ok");
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
	
	public GetOrderListResponseModel getOrderList(String brand, String orderNo, String startDate, String endDate, String length, String pageSize, String pageIndex, GetOrderListRequestModel requestModel) throws Exception {
		GetOrderListResponseModel responseModel = new GetOrderListResponseModel(requestModel);
		
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
			
			List<ViewOrder> lstViewOrder = viewOrderRepository.find(lstTbmMarketId, brand, orderNo, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50"), PageRequest.of(Integer.valueOf(pageIndex), Integer.valueOf(pageSize), Sort.by("tboCreateDate").ascending()));
			
			if (lstViewOrder.size() > 0) {
				responseModel.setLength(viewOrderRepository.count(lstTbmMarketId, brand, orderNo, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50")));
				responseModel.setLstViewOrder(lstViewOrder);
				
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
	
	public ByteArrayInputStream getOrderListReportExcel(String brand, String orderNo, String startDate, String endDate, String length, String pageSize, String pageIndex, GetOrderListRequestModel requestModel) throws Exception {
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
		cell.setCellValue("Name");

		cell = row.createCell(intCell++);
		cell.setCellValue("Hp");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Address");
		
		intRow++;
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		List<ViewOrder> lstViewOrderRaw = getOrderList(brand, orderNo, startDate, endDate, length, pageSize, "0", requestModel).getLstViewOrder();
		for (ViewOrder viewOrder : lstViewOrderRaw) {
			row = sheet.createRow(intRow);
			
			intCell = 0;
			
			cell = row.createCell(intCell++);
			cell.setCellValue(simpleDateFormat.format(viewOrder.getTboCreateDate()));
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrder.getTboBrand());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrder.getTboMarketId());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrder.getTboOrderNo());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrder.getTboName());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrder.getTboHp());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewOrder.getTboFullAddress());
			
			intRow++;
		}
		
		workbook.write(out);
		workbook.close();
		
		return new ByteArrayInputStream(out.toByteArray());
	}
	
	public GetStockListResponseModel getStockList(String brand, String sku, String item, String length, String pageSize, String pageIndex, GetStockListRequestModel requestModel) throws Exception {
		GetStockListResponseModel responseModel = new GetStockListResponseModel(requestModel);
		
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

			List<ViewStock> lstViewStock = viewStockRepository.find(lstTbmMarketId, brand, sku, item, PageRequest.of(Integer.valueOf(pageIndex), Integer.valueOf(pageSize), Sort.by("tbpSku").ascending()));
			
			if (lstViewStock.size() > 0) {
				responseModel.setLength(viewStockRepository.count(lstTbmMarketId, brand, sku, item));
				responseModel.setLstViewStock(lstViewStock);
				
				responseModel.setStatus("200");
				responseModel.setMessage("Get Stock List ok");
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
	
	public ByteArrayInputStream getStockListReportExcel(String brand, String sku, String item, String length, String pageSize, String pageIndex, GetStockListRequestModel requestModel) throws Exception {
		pageSize = "1000000000";
		
		ByteArrayOutputStream out = new ByteArrayOutputStream();

		Workbook workbook = new XSSFWorkbook();
		
		Sheet sheet = workbook.createSheet("Raw");
		int intRow = 0;
		Row row = sheet.createRow(intRow);
		
		Cell cell = null;
		
		int intCell = 0;
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Brand");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Sku");

		cell = row.createCell(intCell++);
		cell.setCellValue("Item");
		
		cell = row.createCell(intCell++);
		cell.setCellValue("Qty");

		intRow++;
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		List<ViewStock> lstViewStockRaw = getStockList(brand, sku, item, length, pageSize, "0", requestModel).getLstViewStock();
		for (ViewStock viewStock : lstViewStockRaw) {
			row = sheet.createRow(intRow);
			
			intCell = 0;
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewStock.getTbpBrand());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewStock.getTbpSku());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewStock.getTbpItem());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewStock.getTbpmQty());
			
			intRow++;
		}
		
		workbook.write(out);
		workbook.close();
		
		return new ByteArrayInputStream(out.toByteArray());
	}
	
	public GetSalesListResponseModel getSalesList(String brand, String orderNo, String sku, String startDate, String endDate, String length, String pageSize, String pageIndex, GetSalesListRequestModel requestModel) throws Exception {
		GetSalesListResponseModel responseModel = new GetSalesListResponseModel(requestModel);
		
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

			List<ViewSales> lstViewSales = viewSalesRepository.find(lstTbmMarketId, brand, orderNo, sku, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50"), PageRequest.of(Integer.valueOf(pageIndex), Integer.valueOf(pageSize), Sort.by("tboCreateDate").ascending()));
			
			if (lstViewSales.size() > 0) {
				responseModel.setLength(viewSalesRepository.count(lstTbmMarketId, brand, orderNo, sku, new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate + " 00:00:00"), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(endDate + " 23:59:50")));
				responseModel.setLstViewSales(lstViewSales);
				
				responseModel.setStatus("200");
				responseModel.setMessage("Get Sales List ok");
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
	
	public ByteArrayInputStream getSalesListReportExcel(String brand, String orderNo, String sku, String startDate, String endDate, String length, String pageSize, String pageIndex, GetSalesListRequestModel requestModel) throws Exception {
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
		
		intRow++;
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		
		List<ViewSales> lstViewSalesRaw = getSalesList(brand, orderNo, sku, startDate, endDate, length, pageSize, "0", requestModel).getLstViewSales();
		for (ViewSales viewSales : lstViewSalesRaw) {
			row = sheet.createRow(intRow);
			
			intCell = 0;
			
			cell = row.createCell(intCell++);
			cell.setCellValue(simpleDateFormat.format(viewSales.getTboCreateDate()));
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewSales.getTboBrand());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewSales.getTboMarketId());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewSales.getTboOrderNo());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewSales.getTboSku());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewSales.getTboItem());
			
			cell = row.createCell(intCell++);
			cell.setCellValue(viewSales.getTboQty());
			
			intRow++;
		}
		
		workbook.write(out);
		workbook.close();
		
		return new ByteArrayInputStream(out.toByteArray());
	}

	public GetDashboardResponseModel getDashboard(GetDashboardRequestModel requestModel) throws Exception {
		GetDashboardResponseModel responseModel = new GetDashboardResponseModel(requestModel);
		
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
			lstTbmMarketId.add("");
			for (TbUserMarket tbUserMarket : lstTbUserMarket) {
				lstTbmMarketId.add(tbUserMarket.getTbmMarketId());
			}

			List<TbProductMarket> lstTbProductMarket = tbProductMarketRepository.dashboardLowSku(lstTbmMarketId);
			responseModel.setSku(String.valueOf(lstTbProductMarket.size()));
			
			Instant currentUtcInstant = Instant.now();
    		Date currentDateInUtc = Date.from(currentUtcInstant);
			Long revenue = viewOrderRepository.dashboardCountRevenue(lstTbmMarketId, currentDateInUtc);
			responseModel.setRevenue(String.valueOf(revenue == null ? 0 : revenue));

			responseModel.setOrderPending(String.valueOf(viewOrderRepository.dashboardCountOrderPacked(lstTbmMarketId, currentDateInUtc)));
			
			responseModel.setOrderDelivered(String.valueOf(viewOrderRepository.dashboardCountOrderDelivered(lstTbmMarketId, currentDateInUtc)));

			responseModel.setLstLowSku(lstTbProductMarket);

			List<ViewOrder> lstViewOrder = viewOrderRepository.dashboardMarketStats(lstTbmMarketId, currentDateInUtc);
			responseModel.setLstMarketStats(lstViewOrder);
			
			Instant sevenDaysAgoInstant = currentUtcInstant.minus(7, ChronoUnit.DAYS);
			Date sevenDaysAgoDate = Date.from(sevenDaysAgoInstant);
			responseModel.setLstDailySales(viewOrderRepository.dashboardDailySales(sevenDaysAgoDate));

			List<List<Object[]>> lstMarketPerformance = new ArrayList<>();
			for (TbUserMarket tbUserMarket : lstTbUserMarket) {
				lstMarketPerformance.add(viewOrderRepository.dashboardMarketPerformance(sevenDaysAgoDate, tbUserMarket.getTbmMarketId()));
				// lstTbmMarketPerformance.add(tbUserMarket.getTbmMarketId());
			}
			
			responseModel.setLstMarketPerformance(lstMarketPerformance);

			responseModel.setStatus("200");
			responseModel.setMessage("Get Dashboard ok");
			
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
			
			for (com.api.dms.report.model.report.TbBrand tbBrandOrder : requestModel.getLstTbBrand()) {
				TbBrand exampleTbBrand = new TbBrand();
				exampleTbBrand.setTbbBrandId(tbBrandOrder.getTbbBrandId());
				
				Optional<TbBrand> optTbBrand = tbBrandRepository.findOne(Example.of(exampleTbBrand));
				
				if (optTbBrand.isPresent() == false) {
					TbBrand tbBrand = new TbBrand();
					tbBrand = (TbBrand) simpleMapper.assign(tbBrandOrder, tbBrand);
					
					tbBrandRepository.save(tbBrand);
				}
			}
			
			for (com.api.dms.report.model.report.TbUserBrand tbUserBrandOrder : requestModel.getLstTbUserBrand()) {
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
