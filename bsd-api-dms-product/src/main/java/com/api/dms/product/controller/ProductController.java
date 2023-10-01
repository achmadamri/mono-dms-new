package com.api.dms.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
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

import com.api.dms.product.model.product.GetBrandRequestModel;
import com.api.dms.product.model.product.GetBrandResponseModel;
import com.api.dms.product.model.product.GetProductListRequestModel;
import com.api.dms.product.model.product.GetProductListResponseModel;
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
import com.api.dms.product.service.ProductService;
import com.api.dms.product.util.Uid;
import com.fasterxml.jackson.databind.ObjectMapper;

@CrossOrigin
@RestController
@RequestMapping("/product")
public class ProductController {

	private Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();
	
	@Autowired
    private ProductService productService;
	
	@PostMapping("/postuploadproductbundle")
	@Transactional
	public HttpEntity<?> postUploadProductBundle(HttpServletRequest request, PostUploadProductBundleRequestModel requestModel, @RequestParam("file") MultipartFile file) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + file.toString());
		
		PostUploadProductBundleResponseModel responseModel = productService.postUploadProductBundle(requestModel, file);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postuploadproduct")
	@Transactional
	public HttpEntity<?> postUploadProduct(HttpServletRequest request, PostUploadProductRequestModel requestModel, @RequestParam("file") MultipartFile file) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + file.toString());
		
		PostUploadProductResponseModel responseModel = productService.postUploadProduct(requestModel, file);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getproductlist")
	public HttpEntity<?> getProductList(HttpServletRequest request, @RequestParam String brand, @RequestParam String sku, @RequestParam String item, @RequestParam String code, @RequestParam String type, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetProductListRequestModel requestModel = new GetProductListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetProductListResponseModel responseModel = productService.getProductList(brand, sku, item, code, type, length, pageSize, pageIndex, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postproductadd")
	@Transactional
	public HttpEntity<?> postProductAdd(HttpServletRequest request, @Valid @RequestBody PostProductAddRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostProductAddResponseModel responseModel = productService.postProductAdd(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getbrand")
	public HttpEntity<?> getBrand(HttpServletRequest request, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetBrandRequestModel requestModel = new GetBrandRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetBrandResponseModel responseModel = productService.getBrand(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getproduct")
	public HttpEntity<?> getProduct(HttpServletRequest request, @RequestParam String tbpIdSkuCode, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetProductRequestModel requestModel = new GetProductRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetProductResponseModel responseModel = productService.getProduct(tbpIdSkuCode, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getproducts")
	public HttpEntity<?> getProducts(HttpServletRequest request, @RequestParam List<String> lstTbpIdSkuCode, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetProductRequestModel requestModel = new GetProductRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetProductsResponseModel responseModel = productService.getProducts(lstTbpIdSkuCode, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postproductedit")
	@Transactional
	public HttpEntity<?> postProductEdit(HttpServletRequest request, @Valid @RequestBody PostProductEditRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostProductEditResponseModel responseModel = productService.postProductEdit(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postproductdelete")
	@Transactional
	public HttpEntity<?> postProductDelete(HttpServletRequest request, @Valid @RequestBody PostProductDeleteRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostProductDeleteResponseModel responseModel = productService.postProductDelete(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postproductconfirm")
	@Transactional
	public HttpEntity<?> postProductConfirm(HttpServletRequest request, @Valid @RequestBody PostProductConfirmRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostProductConfirmResponseModel responseModel = productService.postProductConfirm(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
}
