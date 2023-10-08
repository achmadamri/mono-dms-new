package com.api.dms.report.controller;

import java.io.ByteArrayInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.api.dms.report.model.report.GetDashboardRequestModel;
import com.api.dms.report.model.report.GetDashboardResponseModel;
import com.api.dms.report.model.report.GetOrderListRequestModel;
import com.api.dms.report.model.report.GetOrderListResponseModel;
import com.api.dms.report.model.report.GetSalesListRequestModel;
import com.api.dms.report.model.report.GetSalesListResponseModel;
import com.api.dms.report.model.report.GetStockListRequestModel;
import com.api.dms.report.model.report.GetStockListResponseModel;
import com.api.dms.report.model.report.PostSyncOrderRequestModel;
import com.api.dms.report.model.report.PostSyncOrderResponseModel;
import com.api.dms.report.model.report.PostSyncOrderStatusRequestModel;
import com.api.dms.report.model.report.PostSyncOrderStatusResponseModel;
import com.api.dms.report.model.report.PostSyncProductRequestModel;
import com.api.dms.report.model.report.PostSyncProductResponseModel;
import com.api.dms.report.service.ReportService;
import com.api.dms.report.util.Uid;
import com.fasterxml.jackson.databind.ObjectMapper;

@CrossOrigin
@RestController
@RequestMapping("/report")
public class ReportController {

	private Logger log = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();
	
	@Autowired
    private ReportService reportService;
	
	@PostMapping("/postsyncorder")
	@Transactional
	public HttpEntity<?> postSyncOrder(HttpServletRequest request, @Valid @RequestBody PostSyncOrderRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostSyncOrderResponseModel responseModel = reportService.postSyncOrder(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postsyncorderstatus")
	@Transactional
	public HttpEntity<?> PostSyncOrderStatusStatus(HttpServletRequest request, @Valid @RequestBody PostSyncOrderStatusRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostSyncOrderStatusResponseModel responseModel = reportService.PostSyncOrderStatus(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postsyncproduct")
	@Transactional
	public HttpEntity<?> postSyncProduct(HttpServletRequest request, @Valid @RequestBody PostSyncProductRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostSyncProductResponseModel responseModel = reportService.postSyncProduct(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getorderlist")
	public HttpEntity<?> getOrderList(HttpServletRequest request, @RequestParam String brand, @RequestParam String orderNo, @RequestParam String start, @RequestParam String end, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetOrderListRequestModel requestModel = new GetOrderListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetOrderListResponseModel responseModel = reportService.getOrderList(brand, orderNo, start, end, length, pageSize, pageIndex, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getorderlistreportexcel")
	public HttpEntity<?> getOrderListReportExcel(HttpServletRequest request, @RequestParam String brand, @RequestParam String orderNo, @RequestParam String start, @RequestParam String end, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetOrderListRequestModel requestModel = new GetOrderListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		ByteArrayInputStream in = reportService.getOrderListReportExcel(brand, orderNo, start, end, length, pageSize, pageIndex, requestModel);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        headers.add("Content-Disposition", "attachment; filename=report_order_" + simpleDateFormat.format(new Date()) + ".xlsx");

        return ResponseEntity.ok().headers(headers).body(new InputStreamResource(in));
	}
	
	@GetMapping("/getstocklist")
	public HttpEntity<?> getStockList(HttpServletRequest request, @RequestParam String brand, @RequestParam String sku, @RequestParam String item, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetStockListRequestModel requestModel = new GetStockListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetStockListResponseModel responseModel = reportService.getStockList(brand, sku, item, length, pageSize, pageIndex, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getstocklistreportexcel")
	public HttpEntity<?> getStockListReportExcel(HttpServletRequest request, @RequestParam String brand, @RequestParam String sku, @RequestParam String item, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetStockListRequestModel requestModel = new GetStockListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		ByteArrayInputStream in = reportService.getStockListReportExcel(brand, sku, item, length, pageSize, pageIndex, requestModel);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        headers.add("Content-Disposition", "attachment; filename=report_stock_" + simpleDateFormat.format(new Date()) + ".xlsx");

        return ResponseEntity.ok().headers(headers).body(new InputStreamResource(in));
	}
	
	@GetMapping("/getsaleslist")
	public HttpEntity<?> getSalesList(HttpServletRequest request, @RequestParam String brand, @RequestParam String orderNo, @RequestParam String sku, @RequestParam String start, @RequestParam String end, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetSalesListRequestModel requestModel = new GetSalesListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetSalesListResponseModel responseModel = reportService.getSalesList(brand, orderNo, sku, start, end, length, pageSize, pageIndex, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getsaleslistreportexcel")
	public HttpEntity<?> getSalesListReportExcel(HttpServletRequest request, @RequestParam String brand, @RequestParam String orderNo, @RequestParam String sku, @RequestParam String start, @RequestParam String end, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetSalesListRequestModel requestModel = new GetSalesListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		ByteArrayInputStream in = reportService.getSalesListReportExcel(brand, orderNo, sku, start, end, length, pageSize, pageIndex, requestModel);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        headers.add("Content-Disposition", "attachment; filename=report_sales_" + simpleDateFormat.format(new Date()) + ".xlsx");

        return ResponseEntity.ok().headers(headers).body(new InputStreamResource(in));
	}
	
	@GetMapping("/getdashboard")
	public HttpEntity<?> getDashboard(HttpServletRequest request, @RequestParam String brand, @RequestParam String orderNo, @RequestParam String start, @RequestParam String end, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetDashboardRequestModel requestModel = new GetDashboardRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetDashboardResponseModel responseModel = reportService.getDashboard(brand, orderNo, start, end, length, pageSize, pageIndex, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
}
