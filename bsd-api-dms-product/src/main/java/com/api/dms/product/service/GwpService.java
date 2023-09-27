package com.api.dms.product.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.api.dms.product.db.entity.TbGwp;
import com.api.dms.product.db.entity.TbGwpSku;
import com.api.dms.product.db.entity.TbProduct;
import com.api.dms.product.db.entity.TbUser;
import com.api.dms.product.db.entity.ViewGwpProduct;
import com.api.dms.product.db.entity.ViewGwpSkuProduct;
import com.api.dms.product.db.repository.TbGwpRepository;
import com.api.dms.product.db.repository.TbGwpSkuRepository;
import com.api.dms.product.db.repository.TbProductRepository;
import com.api.dms.product.db.repository.TbUserRepository;
import com.api.dms.product.db.repository.ViewGwpProductRepository;
import com.api.dms.product.db.repository.ViewGwpSkuProductRepository;
import com.api.dms.product.model.gwp.GetGwpListRequestModel;
import com.api.dms.product.model.gwp.GetGwpListResponseModel;
import com.api.dms.product.model.gwp.GetGwpProductRequestModel;
import com.api.dms.product.model.gwp.GetGwpProductResponseModel;
import com.api.dms.product.model.gwp.GetGwpRequestModel;
import com.api.dms.product.model.gwp.GetGwpResponseModel;
import com.api.dms.product.model.gwp.GetGwpSkuListRequestModel;
import com.api.dms.product.model.gwp.GetGwpSkuListResponseModel;
import com.api.dms.product.model.gwp.GetSellableProductRequestModel;
import com.api.dms.product.model.gwp.GetSellableProductResponseModel;
import com.api.dms.product.model.gwp.GetSkuProductRequestModel;
import com.api.dms.product.model.gwp.GetSkuProductResponseModel;
import com.api.dms.product.model.gwp.PostGwpAddRequestModel;
import com.api.dms.product.model.gwp.PostGwpAddResponseModel;
import com.api.dms.product.model.gwp.PostGwpDeleteRequestModel;
import com.api.dms.product.model.gwp.PostGwpDeleteResponseModel;
import com.api.dms.product.model.gwp.PostGwpEditRequestModel;
import com.api.dms.product.model.gwp.PostGwpEditResponseModel;
import com.api.dms.product.util.SimpleMapper;
import com.api.dms.product.util.TokenUtil;

@Service
public class GwpService {

	private Logger log = LoggerFactory.getLogger(GwpService.class);
	
	@Autowired
	private Environment env;
	
	private TokenUtil tokenUtil = new TokenUtil();
	
	@Autowired
	private TbUserRepository tbUserRepository;
	
	@Autowired
	private TbGwpRepository tbGwpRepository;
	
	@Autowired
	private ViewGwpProductRepository viewGwpProductRepository;
	
	@Autowired
	private ViewGwpSkuProductRepository viewGwpSkuProductRepository;
	
	@Autowired
	private TbProductRepository tbProductRepository;
	
	@Autowired
	private TbGwpSkuRepository tbGwpSkuRepository;
	
	public GetGwpListResponseModel getGwpList(String brand, String sku, String item, String length, String pageSize, String pageIndex, GetGwpListRequestModel requestModel) throws Exception {
		GetGwpListResponseModel responseModel = new GetGwpListResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			List<ViewGwpProduct> lstViewGwpProduct = viewGwpProductRepository.findAllByTbuId(tbUser.getTbuId(), brand, sku, item, PageRequest.of(Integer.valueOf(pageIndex), Integer.valueOf(pageSize), Sort.by("tbgId").ascending()));
			
			if (lstViewGwpProduct.size() > 0) {
				responseModel.setLstViewGwpProduct(lstViewGwpProduct);
				
				responseModel.setLength(viewGwpProductRepository.countAllByTbuId(tbUser.getTbuId(), brand, sku, item));
				
				responseModel.setStatus("200");
				responseModel.setMessage("Get Gwp List ok");
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
	
	public GetGwpSkuListResponseModel getGwpSkuList(String sku, GetGwpSkuListRequestModel requestModel) throws Exception {
		GetGwpSkuListResponseModel responseModel = new GetGwpSkuListResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			ViewGwpSkuProduct exampleViewGwpSkuProduct = new ViewGwpSkuProduct();	
			exampleViewGwpSkuProduct.setTbgsSku(sku);
			
			List<ViewGwpSkuProduct> lstViewGwpSkuProduct = viewGwpSkuProductRepository.findAll(Example.of(exampleViewGwpSkuProduct), Sort.by("tbpgTbpBrand", "tbpgTbpItem").ascending());
			responseModel.setLstViewGwpSkuProduct(lstViewGwpSkuProduct);
			
			responseModel.setStatus("200");
			responseModel.setMessage("Get Gwp Sku List ok");
		}, () -> {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		});
		
		return responseModel;
	}
	
	public PostGwpAddResponseModel postGwpAdd(PostGwpAddRequestModel requestModel) throws Exception {
		PostGwpAddResponseModel responseModel = new PostGwpAddResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			
			TbGwp exampleTbGwp = new TbGwp();
			exampleTbGwp.setTbgSku(requestModel.getTbgSku());
			Optional<TbGwp> optTbGwp = tbGwpRepository.findOne(Example.of(exampleTbGwp));
			
			optTbGwp.ifPresentOrElse(tbGwp -> {
				responseModel.setStatus("403");
				responseModel.setMessage("Data already exists. Sku : " + requestModel.getTbgSku());
			}, () -> {
				TbGwp tbGwp = new TbGwp();
				SimpleMapper simpleMapper = new SimpleMapper();
				tbGwp = (TbGwp) simpleMapper.assign(requestModel, tbGwp);

				tbGwp.setTbgCreateDate(new Date());
				tbGwp.setTbgCreateId(tbUser.getTbuId());
				tbGwp.setTbgStatus(TbGwpRepository.Active);
				
				tbGwpRepository.save(tbGwp);
				
				for (TbGwpSku tbGwpSkuModel : requestModel.getTbGwpSku()) {
					TbGwpSku tbGwpSku = new TbGwpSku();
					tbGwpSku = (TbGwpSku) simpleMapper.assign(tbGwpSkuModel, tbGwpSku);
				
					tbGwpSku.setTbgsCreateDate(new Date());
					tbGwpSku.setTbgsCreateId(tbUser.getTbuId());
					tbGwpSku.setTbgId(tbGwp.getTbgId());
					
					tbGwpSkuRepository.save(tbGwpSku);
				} 

				responseModel.setTbGwp(tbGwp);
				responseModel.setStatus("200");
				responseModel.setMessage("Gwp created");
			});
		}, () -> {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		});
		
		return responseModel;
	}
	
	public GetGwpProductResponseModel getGwpProduct(GetGwpProductRequestModel requestModel) throws Exception {
		GetGwpProductResponseModel responseModel = new GetGwpProductResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {			
			TbProduct exampleTbProduct = new TbProduct();
			exampleTbProduct.setTbpType(TbProductRepository.Gwp);
			
			responseModel.setLstTbProduct(tbProductRepository.findAll(Example.of(exampleTbProduct), Sort.by("tbpSku").ascending()));
			
			responseModel.setStatus("200");
			responseModel.setMessage("Gwp Product ok");
		}, () -> {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		});
		
		return responseModel;
	}
	
	public GetSkuProductResponseModel getSkuProduct(GetSkuProductRequestModel requestModel) throws Exception {
		GetSkuProductResponseModel responseModel = new GetSkuProductResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {			
			TbProduct exampleTbProduct = new TbProduct();
			
			responseModel.setLstTbProduct(tbProductRepository.findAll(Example.of(exampleTbProduct), Sort.by("tbpSku").ascending()));
			
			responseModel.setStatus("200");
			responseModel.setMessage("Sku Product ok");
		}, () -> {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		});
		
		return responseModel;
	}
	
	public GetSellableProductResponseModel getSellableProduct(GetSellableProductRequestModel requestModel) throws Exception {
		GetSellableProductResponseModel responseModel = new GetSellableProductResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {			
			TbProduct exampleTbProduct = new TbProduct();
			exampleTbProduct.setTbpType(TbProductRepository.Sellable);
			
			responseModel.setLstTbProduct(tbProductRepository.findAll(Example.of(exampleTbProduct), Sort.by("tbpSku").ascending()));
			
			responseModel.setStatus("200");
			responseModel.setMessage("Sellable Product ok");
		}, () -> {
			responseModel.setStatus("404");
			responseModel.setMessage("Not found");
		});
		
		return responseModel;
	}
	
	public GetGwpResponseModel getGwp(String tbgId, GetGwpRequestModel requestModel) throws Exception {
		GetGwpResponseModel responseModel = new GetGwpResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			TbGwp exampleTbGwp = new TbGwp();
			exampleTbGwp.setTbgId(Integer.valueOf(tbgId));
		
			Optional<TbGwp> optTbGwp = tbGwpRepository.findOne(Example.of(exampleTbGwp));
			
			optTbGwp.ifPresentOrElse(tbGwp -> {
				SimpleMapper simpleMapper = new SimpleMapper();
				tbGwp = (TbGwp) simpleMapper.assign(requestModel, tbGwp);

				responseModel.setTbGwp(tbGwp);
				
				TbGwpSku exampleTbGwpSku = new TbGwpSku();
				exampleTbGwpSku.setTbgId(Integer.valueOf(tbgId));
				List<TbGwpSku> lstTbGwpSku = tbGwpSkuRepository.findAll(Example.of(exampleTbGwpSku));

				responseModel.setLstTbGwpSku(lstTbGwpSku);				
				
				responseModel.setStatus("200");
				responseModel.setMessage("Gwp ok");
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
	
	public PostGwpEditResponseModel postGwpEdit(PostGwpEditRequestModel requestModel) throws Exception {
		PostGwpEditResponseModel responseModel = new PostGwpEditResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			
			TbGwp exampleTbGwp = new TbGwp();
			exampleTbGwp.setTbgId(Integer.valueOf(requestModel.getTbgId()));
			Optional<TbGwp> optTbGwp = tbGwpRepository.findOne(Example.of(exampleTbGwp));
			
			optTbGwp.ifPresentOrElse(tbGwp -> {
				SimpleMapper simpleMapper = new SimpleMapper();
				tbGwp = (TbGwp) simpleMapper.assign(requestModel, tbGwp);

				tbGwp.setTbgUpdateDate(new Date());
				tbGwp.setTbgUpdateId(tbUser.getTbuId());
				
				tbGwpRepository.save(tbGwp);
				
				TbGwpSku exampleTbGwpSku = new TbGwpSku();
				exampleTbGwpSku.setTbgId(Integer.valueOf(requestModel.getTbgId()));
				
				List<TbGwpSku> lstTbGwpSku = tbGwpSkuRepository.findAll(Example.of(exampleTbGwpSku));
				for (TbGwpSku tbGwpSku : lstTbGwpSku) {
					tbGwpSkuRepository.delete(tbGwpSku);
				}
				
				tbGwpSkuRepository.flush();
				
				for (TbGwpSku tbGwpSkuModel : requestModel.getTbGwpSku()) {
					TbGwpSku tbGwpSku = new TbGwpSku();
					tbGwpSku = (TbGwpSku) simpleMapper.assign(tbGwpSkuModel, tbGwpSku);
				
					tbGwpSku.setTbgsCreateDate(new Date());
					tbGwpSku.setTbgsCreateId(tbUser.getTbuId());
					tbGwpSku.setTbgId(tbGwp.getTbgId());
					
					tbGwpSkuRepository.save(tbGwpSku);
				}

				responseModel.setTbGwp(tbGwp);
				responseModel.setStatus("200");
				responseModel.setMessage("Gwp updated");
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
	
	public PostGwpDeleteResponseModel postGwpDelete(PostGwpDeleteRequestModel requestModel) throws Exception {
		PostGwpDeleteResponseModel responseModel = new PostGwpDeleteResponseModel(requestModel);
		
		tokenUtil.claims(requestModel);
		
		TbUser exampleTbUser = new TbUser();
		exampleTbUser.setTbuEmail(requestModel.getEmail());
		exampleTbUser.setTbuStatus(TbUserRepository.Active);
		Optional<TbUser> optTbUser = tbUserRepository.findOne(Example.of(exampleTbUser));
		
		optTbUser.ifPresentOrElse(tbUser -> {
			
			TbGwp exampleTbGwp = new TbGwp();
			exampleTbGwp.setTbgId(Integer.valueOf(requestModel.getTbgId()));
			Optional<TbGwp> optTbGwp = tbGwpRepository.findOne(Example.of(exampleTbGwp));
			
			optTbGwp.ifPresentOrElse(tbGwp -> {
				tbGwpRepository.delete(tbGwp);
				
				TbGwpSku exampleTbGwpSku = new TbGwpSku();
				exampleTbGwpSku.setTbgId(Integer.valueOf(requestModel.getTbgId()));
				
				List<TbGwpSku> lstTbGwpSku = tbGwpSkuRepository.findAll(Example.of(exampleTbGwpSku));
				for (TbGwpSku tbGwpSku : lstTbGwpSku) {
					tbGwpSkuRepository.delete(tbGwpSku);
				}
				
				responseModel.setStatus("200");
				responseModel.setMessage("Gwp deleted");
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
}
