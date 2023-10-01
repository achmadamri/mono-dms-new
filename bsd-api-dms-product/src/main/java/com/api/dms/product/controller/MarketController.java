package com.api.dms.product.controller;

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

import com.api.dms.product.model.market.GetMarketListRequestModel;
import com.api.dms.product.model.market.GetMarketListResponseModel;
import com.api.dms.product.model.market.GetMarketRequestModel;
import com.api.dms.product.model.market.GetMarketResponseModel;
import com.api.dms.product.model.market.PostMarketAddRequestModel;
import com.api.dms.product.model.market.PostMarketAddResponseModel;
import com.api.dms.product.model.market.PostMarketDeleteRequestModel;
import com.api.dms.product.model.market.PostMarketDeleteResponseModel;
import com.api.dms.product.model.market.PostMarketEditRequestModel;
import com.api.dms.product.model.market.PostMarketEditResponseModel;
import com.api.dms.product.service.MarketService;
import com.api.dms.product.util.Uid;
import com.fasterxml.jackson.databind.ObjectMapper;

@CrossOrigin
@RestController
@RequestMapping("/market")
public class MarketController {

	private Logger log = LoggerFactory.getLogger(MarketController.class);
	
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();
	
	@Autowired
    private MarketService productService;
	
	@GetMapping("/getmarketlistbyrole")
	public HttpEntity<?> getMarketListByRole(HttpServletRequest request, String tbmRole, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetMarketListRequestModel requestModel = new GetMarketListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetMarketListResponseModel responseModel = productService.getMarketListByRole(tbmRole, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getmarketlist")
	public HttpEntity<?> getMarketList(HttpServletRequest request, String tbmMarket, @RequestParam String length, @RequestParam String pageSize, @RequestParam String pageIndex, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetMarketListRequestModel requestModel = new GetMarketListRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetMarketListResponseModel responseModel = productService.getMarketList(tbmMarket, length, pageSize, pageIndex, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postmarketadd")
	@Transactional
	public HttpEntity<?> postMarketAdd(HttpServletRequest request, @Valid @RequestBody PostMarketAddRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostMarketAddResponseModel responseModel = productService.postMarketAdd(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@GetMapping("/getmarket")
	public HttpEntity<?> getMarket(HttpServletRequest request, @RequestParam String tbmId, @RequestParam String email, @RequestParam String token, @RequestParam String requestId, @RequestParam String requestDate) throws Exception {
		GetMarketRequestModel requestModel = new GetMarketRequestModel();
		requestModel.setEmail(email);
		requestModel.setToken(token);
		requestModel.setRequestId(requestId);
		requestModel.setRequestDate(requestDate);
		
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		GetMarketResponseModel responseModel = productService.getMarket(tbmId, requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postmarketedit")
	@Transactional
	public HttpEntity<?> postMarketEdit(HttpServletRequest request, @Valid @RequestBody PostMarketEditRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostMarketEditResponseModel responseModel = productService.postMarketEdit(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
	
	@PostMapping("/postmarketdelete")
	@Transactional
	public HttpEntity<?> postMarketDelete(HttpServletRequest request, @Valid @RequestBody PostMarketDeleteRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostMarketDeleteResponseModel responseModel = productService.postMarketDelete(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("403") ? HttpStatus.FORBIDDEN : (responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND));
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
}
