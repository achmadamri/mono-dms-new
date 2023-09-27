package com.api.dms.report.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import com.api.dms.report.db.entity.TbUser;
import com.api.dms.report.db.entity.TbUserBrand;
import com.api.dms.report.db.entity.TbUserMarket;
import com.api.dms.report.db.repository.TbUserBrandRepository;
import com.api.dms.report.db.repository.TbUserMarketRepository;
import com.api.dms.report.db.repository.TbUserRepository;
import com.api.dms.report.model.user.PostUserAddRequestModel;
import com.api.dms.report.model.user.PostUserAddResponseModel;
import com.api.dms.report.model.user.PostUserChangePasswordRequestModel;
import com.api.dms.report.model.user.PostUserChangePasswordResponseModel;
import com.api.dms.report.model.user.PostUserEditRequestModel;
import com.api.dms.report.model.user.PostUserEditResponseModel;
import com.api.dms.report.util.MD5;
import com.api.dms.report.util.TokenUtil;

@Service
public class UserService {

	private Logger log = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private Environment env;
	
	private TokenUtil tokenUtil = new TokenUtil();
	
	@Autowired
	private TbUserRepository tbUserRepository;
	
	@Autowired
	private TbUserMarketRepository tbUserMarketRepository;
	
	@Autowired
	private TbUserBrandRepository tbUserBrandRepository;
	
	public PostUserAddResponseModel postUserAdd(PostUserAddRequestModel requestModel) throws Exception {
		PostUserAddResponseModel responseModel = new PostUserAddResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			TbUser exampleTbUserNew = new TbUser();
			exampleTbUserNew.setTbuEmail(requestModel.getTbUser().getTbuEmail());
			Optional<TbUser> optTbUserNew = tbUserRepository.findOne(Example.of(exampleTbUserNew));
			
			if (optTbUserNew.isPresent()) {
				responseModel.setStatus("403");
				responseModel.setMessage("Data already exists. Email : " + requestModel.getTbUser().getTbuEmail());
			} else {
				TbUser tbUser = new TbUser();
				tbUser.setTbuEmail(requestModel.getTbUser().getTbuEmail());
				tbUser.setTbuFirstname(requestModel.getTbUser().getTbuFirstname());
				tbUser.setTbuLastname(requestModel.getTbUser().getTbuLastname());
				tbUser.setTbuPassword(requestModel.getTbUser().getTbuPassword());
				tbUser.setTbuCreateDate(new Date());
				tbUser.setTbuCreateId(optTbUser.get().getTbuId());
				tbUser.setTbuStatus(requestModel.getTbUser().getTbuStatus());
				tbUser.setTbuTokenSalt(requestModel.getTbUser().getTbuTokenSalt());
				tbUser.setTbuRole(requestModel.getTbUser().getTbuRole());
				tbUserRepository.save(tbUser);
				
				for (com.api.dms.report.model.user.TbUserBrand tbUserBrand_ : requestModel.getLstTbUserBrand()) {
					com.api.dms.report.db.entity.TbUserBrand tbUserBrand = new com.api.dms.report.db.entity.TbUserBrand();
					tbUserBrand.setTbubCreateDate(new Date());
					tbUserBrand.setTbubCreateId(optTbUser.get().getTbuId());
					tbUserBrand.setTbuId(tbUser.getTbuId());
					tbUserBrand.setTbbBrand(tbUserBrand_.getTbbBrand());
					tbUserBrand.setTbbBrandId(tbUserBrand_.getTbbBrandId());
					tbUserBrand.setTbbBrandCheck(tbUserBrand_.getTbbBrandCheck());
					tbUserBrandRepository.save(tbUserBrand);
				}
				
				responseModel.setStatus("200");
				responseModel.setMessage("User created");
			}			
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
	
	public PostUserEditResponseModel postUserEdit(PostUserEditRequestModel requestModel) throws Exception {
		PostUserEditResponseModel responseModel = new PostUserEditResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			TbUser exampleTbUserExisting = new TbUser();
			exampleTbUserExisting.setTbuEmail(requestModel.getTbUser().getTbuEmail());
			Optional<TbUser> optTbUserExisting = tbUserRepository.findOne(Example.of(exampleTbUserExisting));
			
			if (optTbUserExisting.isPresent()) {
				optTbUserExisting.get().setTbuRole(requestModel.getTbUser().getTbuRole());
				optTbUserExisting.get().setTbuFirstname(requestModel.getTbUser().getTbuFirstname());
				optTbUserExisting.get().setTbuLastname(requestModel.getTbUser().getTbuLastname());
				
				if (!requestModel.getTbUser().getTbuPassword().equals("")) {
					optTbUserExisting.get().setTbuPassword(requestModel.getTbUser().getTbuPassword());	
				}
				
				optTbUserExisting.get().setTbuUpdateDate(new Date());
				optTbUserExisting.get().setTbuUpdateId(optTbUser.get().getTbuId());
				tbUserRepository.save(optTbUserExisting.get());
				
				TbUserMarket exampleTbUserMarket = new TbUserMarket();
				exampleTbUserMarket.setTbuId(optTbUserExisting.get().getTbuId());
				List<TbUserMarket> lstTbUserMarket = tbUserMarketRepository.findAll(Example.of(exampleTbUserMarket));
				tbUserMarketRepository.deleteAll(lstTbUserMarket);
				for (com.api.dms.report.model.user.TbUserMarket tbUserMarket : requestModel.getLstTbUserMarket()) {
					TbUserMarket tbUserMarket_ = new TbUserMarket();
					tbUserMarket_.setTbumCreateDate(new Date());
					tbUserMarket_.setTbumCreateId(optTbUser.get().getTbuId());
					tbUserMarket_.setTbuId(optTbUserExisting.get().getTbuId());
					tbUserMarket_.setTbmMarket(tbUserMarket.getTbmMarket());					
					tbUserMarket_.setTbmMarketCheck(tbUserMarket.getTbmMarketCheck());
					tbUserMarketRepository.save(tbUserMarket_);
				}
				
				TbUserBrand exampleTbUserBrand = new TbUserBrand();
				exampleTbUserBrand.setTbuId(optTbUserExisting.get().getTbuId());
				List<TbUserBrand> lstTbUserBrand = tbUserBrandRepository.findAll(Example.of(exampleTbUserBrand));
				tbUserBrandRepository.deleteAll(lstTbUserBrand);
				for (com.api.dms.report.model.user.TbUserBrand tbUserBrand_ : requestModel.getLstTbUserBrand()) {
					TbUserBrand tbUserBrand = new TbUserBrand();
					tbUserBrand.setTbubCreateDate(new Date());
					tbUserBrand.setTbubCreateId(optTbUser.get().getTbuId());
					tbUserBrand.setTbuId(optTbUserExisting.get().getTbuId());
					tbUserBrand.setTbbBrand(tbUserBrand_.getTbbBrand());					
					tbUserBrand.setTbbBrandId(tbUserBrand_.getTbbBrandId());
					tbUserBrand.setTbbBrandCheck(tbUserBrand_.getTbbBrandCheck());
					tbUserBrandRepository.save(tbUserBrand);
				}
				
				responseModel.setStatus("200");
				responseModel.setMessage("User updated");
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
	
	public PostUserChangePasswordResponseModel postUserChangePassword(PostUserChangePasswordRequestModel requestModel) throws Exception {
		PostUserChangePasswordResponseModel responseModel = new PostUserChangePasswordResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			TbUser exampleTbUserExisting = new TbUser();
			exampleTbUserExisting.setTbuEmail(requestModel.getTbUser().getTbuEmail());
			Optional<TbUser> optTbUserExisting = tbUserRepository.findOne(Example.of(exampleTbUserExisting));
			
			if (optTbUserExisting.isPresent()) {
				optTbUserExisting.get().setTbuPassword(requestModel.getTbUser().getTbuPassword());
				optTbUserExisting.get().setTbuUpdateDate(new Date());
				optTbUserExisting.get().setTbuUpdateId(optTbUser.get().getTbuId());
				tbUserRepository.save(optTbUserExisting.get());
				
				responseModel.setStatus("200");
				responseModel.setMessage("User updated");
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
