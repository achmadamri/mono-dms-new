package com.api.dms.product.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.api.dms.product.db.entity.TbMarket;
import com.api.dms.product.db.entity.TbUser;
import com.api.dms.product.db.repository.TbMarketRepository;
import com.api.dms.product.db.repository.TbUserRepository;
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
import com.api.dms.product.util.SimpleMapper;
import com.api.dms.product.util.TokenUtil;

@Service
public class MarketService {

	private Logger log = LoggerFactory.getLogger(MarketService.class);
	
	@Autowired
	private Environment env;
	
	private TokenUtil tokenUtil = new TokenUtil();
	
	@Autowired
	private TbUserRepository tbUserRepository;
	
	@Autowired
	private TbMarketRepository tbMarketRepository;
	
	public GetMarketListResponseModel getMarketListByRole(String tbmRole, GetMarketListRequestModel requestModel) throws Exception {
		GetMarketListResponseModel responseModel = new GetMarketListResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			ExampleMatcher matcher = ExampleMatcher.matching()
					.withMatcher("tbmMarket", ExampleMatcher.GenericPropertyMatchers.contains().ignoreCase())
					;
		
			TbMarket exampleTbMarket = new TbMarket();
			exampleTbMarket.setTbmRole(tbmRole.equals("ADMIN") ? "PRINCIPAL" : tbmRole);
			
			List<TbMarket> lstTbMarketParent = tbMarketRepository.findAll(Example.of(exampleTbMarket), Sort.by("tbmMarket").ascending());
			List<TbMarket> lstTbMarketChild = new ArrayList<TbMarket>();
			
			for (TbMarket tbMarket_ : lstTbMarketParent) {
				lstTbMarketChild = findMarket(lstTbMarketChild, tbMarket_);
			}
			
			for (TbMarket tbMarket_ : lstTbMarketChild) {
				lstTbMarketParent.add(tbMarket_);
			}
			
			if (lstTbMarketParent.size() > 0) {
				responseModel.setLstTbMarket(lstTbMarketParent);
				
				responseModel.setStatus("200");
				responseModel.setMessage("Get Market List By Role ok");
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
	
	public List<TbMarket> findMarket(List<TbMarket> lstTbMarket, TbMarket tbMarket) {
		TbMarket exampleTbMarket = new TbMarket();
		exampleTbMarket.setTbmParentId(tbMarket.getTbmId());

		List<TbMarket> lstTbMarketParent = tbMarketRepository.findAll(Example.of(exampleTbMarket));
		
		for (TbMarket tbMarket_ : lstTbMarketParent) {
			lstTbMarket.add(tbMarket_);
			lstTbMarket = findMarket(lstTbMarket, tbMarket_);
		}
		
		return lstTbMarket;
	}
	
	public GetMarketListResponseModel getMarketList(String tbmMarket, String length, String pageSize, String pageIndex, GetMarketListRequestModel requestModel) throws Exception {
		GetMarketListResponseModel responseModel = new GetMarketListResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			ExampleMatcher matcher = ExampleMatcher.matching()
					.withMatcher("tbmMarket", ExampleMatcher.GenericPropertyMatchers.contains().ignoreCase())
					;
		
			TbMarket exampleTbMarket = new TbMarket();
			exampleTbMarket.setTbmMarket(tbmMarket);
			
			Page<TbMarket> pgTbMarket = tbMarketRepository.findAll(Example.of(exampleTbMarket, matcher), PageRequest.of(Integer.valueOf(pageIndex), Integer.valueOf(pageSize), Sort.by("tbmId").ascending()));
			
			if (pgTbMarket.toList().size() > 0) {
				List<TbMarket> lstTbMarket = pgTbMarket.toList();
				responseModel.setLstTbMarket(lstTbMarket);
				
				responseModel.setLength(tbMarketRepository.count(Example.of(exampleTbMarket, matcher)));
				
				responseModel.setStatus("200");
				responseModel.setMessage("Get Market List ok");
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
	
	public PostMarketAddResponseModel postMarketAdd(PostMarketAddRequestModel requestModel) throws Exception {
		PostMarketAddResponseModel responseModel = new PostMarketAddResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			ExampleMatcher matcher = ExampleMatcher.matching()
					.withMatcher("tbmMarket", ExampleMatcher.GenericPropertyMatchers.contains().ignoreCase())
					;
			
			TbMarket exampleTbMarket = new TbMarket();
			exampleTbMarket.setTbmMarket(requestModel.getTbmMarket());
			
			Optional<TbMarket> optTbMarket = tbMarketRepository.findOne(Example.of(exampleTbMarket, matcher));
			
			if (optTbMarket.isPresent()) {
				responseModel.setStatus("403");
				responseModel.setMessage("Data already exists");
			} else {
				TbMarket tbMarket = new TbMarket();
				SimpleMapper simpleMapper = new SimpleMapper();
				tbMarket = (TbMarket) simpleMapper.assign(requestModel, tbMarket);

				tbMarket.setTbmCreateDate(new Date());
				tbMarket.setTbmCreateId(optTbUser.get().getTbuId());
				tbMarket.setTbmMarket(requestModel.getTbmMarket());
				tbMarket.setTbmRole(requestModel.getTbmRole());

				if (requestModel.getTbmParentId() != null) tbMarket.setTbmParentId(Integer.valueOf(requestModel.getTbmParentId()));
				
				tbMarketRepository.save(tbMarket);

				responseModel.setTbMarket(tbMarket);
				responseModel.setStatus("200");
				responseModel.setMessage("Market created");
			}
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		}
		
		return responseModel;
	}
	
	public GetMarketResponseModel getMarket(String tbmId, GetMarketRequestModel requestModel) throws Exception {
		GetMarketResponseModel responseModel = new GetMarketResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));

		SimpleMapper simpleMapper = new SimpleMapper();
		
		TbMarket exampleTbMarket = null;
		TbMarket tbMarket = null;
		Optional<TbMarket> optTbMarket = null;
		
		if (optTbUser.isPresent()) {
			exampleTbMarket = new TbMarket();
			exampleTbMarket.setTbmId(Integer.valueOf(tbmId));
			optTbMarket = tbMarketRepository.findOne(Example.of(exampleTbMarket));
			
			if (optTbMarket.isPresent()) {
				tbMarket = optTbMarket.get();
				
				responseModel.setTbMarket(tbMarket);
				responseModel.setStatus("200");
				responseModel.setMessage("Market ok");
			} else {
				responseModel.setStatus("404");
				responseModel.setMessage("Market not found");
			}
		} else {
			responseModel.setStatus("404");
			responseModel.setMessage("Market not found");
		}
		
		return responseModel;
	}
	
	public PostMarketEditResponseModel postMarketEdit(PostMarketEditRequestModel requestModel) throws Exception {
		PostMarketEditResponseModel responseModel = new PostMarketEditResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			TbMarket exampleTbMarket = new TbMarket();
			exampleTbMarket.setTbmId(Integer.valueOf(requestModel.getTbmId()));
			Optional<TbMarket> optTbMarket = tbMarketRepository.findOne(Example.of(exampleTbMarket));
			
			if (optTbMarket.isPresent()) {
				TbMarket tbMarket = optTbMarket.get();
				
				SimpleMapper simpleMapper = new SimpleMapper();
				tbMarket = (TbMarket) simpleMapper.assign(requestModel, tbMarket);

				tbMarket.setTbmUpdateDate(new Date());
				tbMarket.setTbmUpdateId(optTbUser.get().getTbuId());
				tbMarket.setTbmMarket(requestModel.getTbmMarket());
				tbMarket.setTbmRole(requestModel.getTbmRole());
				
				if (requestModel.getTbmParentId() != null) tbMarket.setTbmParentId(Integer.valueOf(requestModel.getTbmParentId()));
				
				tbMarketRepository.save(tbMarket);

				responseModel.setTbMarket(tbMarket);
				responseModel.setStatus("200");
				responseModel.setMessage("Market updated");
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
	
	public PostMarketDeleteResponseModel postMarketDelete(PostMarketDeleteRequestModel requestModel) throws Exception {
		PostMarketDeleteResponseModel responseModel = new PostMarketDeleteResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		if (optTbUser.isPresent()) {
			TbMarket exampleTbMarket = new TbMarket();
			exampleTbMarket.setTbmId(Integer.valueOf(requestModel.getTbmId()));
			Optional<TbMarket> optTbMarket = tbMarketRepository.findOne(Example.of(exampleTbMarket));
			
			if (optTbMarket.isPresent()) {
				tbMarketRepository.delete(optTbMarket.get());
				
				responseModel.setStatus("200");
				responseModel.setMessage("Market deleted");
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
