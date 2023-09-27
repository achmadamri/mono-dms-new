package com.api.dms.product.model.gwp;

import java.util.List;

import com.api.dms.product.db.entity.TbProduct;
import com.api.dms.product.model.ResponseModel;


public class GetSellableProductResponseModel extends ResponseModel {
	
	public GetSellableProductResponseModel(GetSellableProductRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<TbProduct> lstTbProduct;

	public List<TbProduct> getLstTbProduct() {
		return lstTbProduct;
	}

	public void setLstTbProduct(List<TbProduct> lstTbProduct) {
		this.lstTbProduct = lstTbProduct;
	}
}
