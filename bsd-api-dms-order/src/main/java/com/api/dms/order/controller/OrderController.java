package com.api.dms.order.controller;

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
import org.springframework.web.multipart.MultipartFile;

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
import com.api.dms.order.service.OrderService;
import com.api.dms.order.util.Uid;
import com.fasterxml.jackson.databind.ObjectMapper;

@CrossOrigin
@RestController
@RequestMapping("/order")
public class OrderController {

	private Logger log = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();
	
	@Autowired
    private OrderService orderService;
	
	@PostMapping("/postuploadorder")
	@Transactional
	public HttpEntity<?> postUploadOrder(HttpServletRequest request, PostUploadOrderRequestModel requestModel, @RequestParam("file") MultipartFile file) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + file.toString());
		
		PostUploadOrderResponseModel responseModel = orderService.postUploadOrder(requestModel, file);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getorderlistreportexcel")
	public HttpEntity<?> getOrderListReportExcel(HttpServletRequest request, @RequestParam String orderNo, @RequestParam String start, @RequestParam String end, @RequestParam String status, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetOrderListRequestModel requestModel = new GetOrderListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		ByteArrayInputStream in = orderService.getOrderListReportExcel(orderNo, start, end, status, length, pageSize, pageIndex, requestModel);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        headers.add("Content-Disposition", "attachment; filename=order_" + simpleDateFormat.format(new Date()) + ".xlsx");

        return ResponseEntity.ok().headers(headers).body(new InputStreamResource(in));
	}
	
	@GetMapping("/getpackinglistreportexcel")
	public HttpEntity<?> getPackingListReportExcel(HttpServletRequest request, @RequestParam String orderNo, @RequestParam String start, @RequestParam String end, @RequestParam String status, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetPackingListRequestModel requestModel = new GetPackingListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		ByteArrayInputStream in = orderService.getPackingListReportExcel(orderNo, start, end, status, length, pageSize, pageIndex, requestModel);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        headers.add("Content-Disposition", "attachment; filename=packing_" + simpleDateFormat.format(new Date()) + ".xlsx");

        return ResponseEntity.ok().headers(headers).body(new InputStreamResource(in));
	}
	
	@GetMapping("/getorderlist")
	public HttpEntity<?> getOrderList(HttpServletRequest request, @RequestParam String orderNo, @RequestParam String start, @RequestParam String end, @RequestParam String status, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetOrderListRequestModel requestModel = new GetOrderListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetOrderListResponseModel responseModel = orderService.getOrderList(orderNo, start, end, status, length, pageSize, pageIndex, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getorderconfirmlistreportexcel")
	public HttpEntity<?> getOrderConfirmListReportExcel(HttpServletRequest request, @RequestParam String orderNo, @RequestParam String sku, @RequestParam String type, @RequestParam String brand, @RequestParam String start, @RequestParam String status, @RequestParam String end, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetOrderConfirmListRequestModel requestModel = new GetOrderConfirmListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		ByteArrayInputStream in = orderService.getOrderConfirmListReportExcel(orderNo, sku, status, type, brand, start, end, length, pageSize, pageIndex, requestModel);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        headers.add("Content-Disposition", "attachment; filename=confirm_" + simpleDateFormat.format(new Date()) + ".xlsx");

        return ResponseEntity.ok().headers(headers).body(new InputStreamResource(in));
	}
	
	@GetMapping("/getorderconfirmlist")
	public HttpEntity<?> getOrderConfirmList(HttpServletRequest request, @RequestParam String orderNo, @RequestParam String sku, @RequestParam String type, @RequestParam String brand, @RequestParam String start, @RequestParam String status, @RequestParam String end, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetOrderConfirmListRequestModel requestModel = new GetOrderConfirmListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetOrderConfirmListResponseModel responseModel = orderService.getOrderConfirmList(orderNo, sku, status, type, brand, start, end, length, pageSize, pageIndex, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getorderconfirmsum")
	public HttpEntity<?> getOrderConfirmSum(HttpServletRequest request, @RequestParam String orderNo, @RequestParam String sku, @RequestParam String type, @RequestParam String brand, @RequestParam String start, @RequestParam String status, @RequestParam String end, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetOrderConfirmSumRequestModel requestModel = new GetOrderConfirmSumRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetOrderConfirmSumResponseModel responseModel = orderService.getOrderConfirmSum(orderNo, sku, status, type, brand, start, end, length, pageSize, pageIndex, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postordermanual")
	@Transactional
	public HttpEntity<?> postOrderManual(HttpServletRequest request, @Valid @RequestBody PostOrderManualRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostOrderManualResponseModel responseModel = orderService.postOrderManual(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postorderadd")
	@Transactional
	public HttpEntity<?> postOrderAdd(HttpServletRequest request, @Valid @RequestBody PostOrderAddRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostOrderAddResponseModel responseModel = orderService.postOrderAdd(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postorderadds")
	@Transactional
	public HttpEntity<?> postOrderAdds(HttpServletRequest request, @Valid @RequestBody PostOrderAddsRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostOrderAddsResponseModel responseModel = orderService.postOrderAdds(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getorder")
	@Transactional
	public HttpEntity<?> getOrder(HttpServletRequest request, @RequestParam String tboId, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetOrderRequestModel requestModel = new GetOrderRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetOrderResponseModel responseModel = orderService.getOrder(tboId, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getorderpack")
	@Transactional
	public HttpEntity<?> getOrderPack(HttpServletRequest request, @RequestParam String tbopOrderNo, @RequestParam String tbopAwb, @RequestParam Integer tbopQcId, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetOrderPackRequestModel requestModel = new GetOrderPackRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetOrderPackResponseModel responseModel = orderService.getOrderPack(tbopOrderNo, tbopAwb, tbopQcId, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postorderedit")
	@Transactional
	public HttpEntity<?> postOrderEdit(HttpServletRequest request, @Valid @RequestBody PostOrderEditRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostOrderEditResponseModel responseModel = orderService.postOrderEdit(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postorderdelete")
	@Transactional
	public HttpEntity<?> postOrderDelete(HttpServletRequest request, @Valid @RequestBody PostOrderDeleteRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostOrderDeleteResponseModel responseModel = orderService.postOrderDelete(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getscanbarcodecheck")
	public HttpEntity<?> getScanBarcodeCheck(HttpServletRequest request, @RequestParam String tboOrderNo, @RequestParam String tbpSku, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetScanBarcodeCheckRequestModel requestModel = new GetScanBarcodeCheckRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetScanBarcodeCheckResponseModel responseModel = orderService.getScanBarcodeCheck(tboOrderNo, tbpSku, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postscanbarcode")
	@Transactional
	public HttpEntity<?> postScanBarcode(HttpServletRequest request, @Valid @RequestBody PostScanBarcodeRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostScanBarcodeResponseModel responseModel = orderService.postScanBarcode(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postchangepacked")
	@Transactional
	public HttpEntity<?> postChangePacked(HttpServletRequest request, @Valid @RequestBody PostChangePackedRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostChangePackedResponseModel responseModel = orderService.postChangePacked(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postdeletepacked")
	@Transactional
	public HttpEntity<?> postDeletePacked(HttpServletRequest request, @Valid @RequestBody PostDeletePackedRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostDeletePackedResponseModel responseModel = orderService.postDeletePacked(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postconfirm")
	@Transactional
	public synchronized HttpEntity<?> postConfirm(HttpServletRequest request, @Valid @RequestBody PostConfirmRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostConfirmResponseModel responseModel = orderService.postConfirm(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postconfirmorder")
	@Transactional
	public HttpEntity<?> postConfirmOrder(HttpServletRequest request, @Valid @RequestBody PostConfirmOrderRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostConfirmOrderResponseModel responseModel = orderService.postConfirmOrder(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postsyncbrand")
	@Transactional
	public HttpEntity<?> postSyncBrand(HttpServletRequest request, @Valid @RequestBody PostSyncBrandRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostSyncBrandResponseModel responseModel = orderService.postSyncBrand(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
}
