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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.api.dms.product.model.token.PostSyncRequestModel;
import com.api.dms.product.model.token.PostSyncResponseModel;
import com.api.dms.product.service.TokenService;
import com.api.dms.product.util.Uid;
import com.fasterxml.jackson.databind.ObjectMapper;

@CrossOrigin
@RestController
@RequestMapping("/token")
public class TokenController {

	private Logger log = LoggerFactory.getLogger(TokenController.class);
	
	@Autowired
    private TokenService tokenService;
	
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();
	
	@PostMapping("/postsync")
	@Transactional
	public HttpEntity<?> postSync(HttpServletRequest request, @Valid @RequestBody PostSyncRequestModel requestModel) throws Exception {
		String fid = new Uid().generateString(20);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] requestModel : " + objectMapper.writeValueAsString(requestModel));
		
		PostSyncResponseModel responseModel = tokenService.postSync(requestModel);
		
		ResponseEntity<?> responseEntity = new ResponseEntity<>(responseModel, responseModel.getStatus().equals("200") ? HttpStatus.OK : HttpStatus.NOT_FOUND);
		log.info(request.getRequestURL().toString() + " [fid:" + fid + "] responseEntity : " + objectMapper.writeValueAsString(responseEntity));

		return responseEntity;
	}
}
