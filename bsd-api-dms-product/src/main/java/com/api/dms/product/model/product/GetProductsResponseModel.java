package com.api.dms.product.model.product;

import java.util.ArrayList;
import java.util.List;

import com.api.dms.product.model.ResponseModel;

public class GetProductsResponseModel extends ResponseModel {
	
	public GetProductsResponseModel(GetProductRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<GetProductResponseModel> lstGetProductResponseModel = new ArrayList<GetProductResponseModel>();

	public List<GetProductResponseModel> getLstGetProductResponseModel() {
		return lstGetProductResponseModel;
	}

	public void setLstGetProductResponseModel(List<GetProductResponseModel> lstGetProductResponseModel) {
		this.lstGetProductResponseModel = lstGetProductResponseModel;
	}
}
