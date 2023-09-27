package com.api.dms.product.model.gwp;

import java.util.List;

import com.api.dms.product.db.entity.ViewGwpSkuProduct;
import com.api.dms.product.model.ResponseModel;

public class GetGwpSkuListResponseModel extends ResponseModel {
	
	public GetGwpSkuListResponseModel(GetGwpSkuListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<ViewGwpSkuProduct> lstViewGwpSkuProduct;
	
	private Long length;

	public List<ViewGwpSkuProduct> getLstViewGwpSkuProduct() {
		return lstViewGwpSkuProduct;
	}

	public void setLstViewGwpSkuProduct(List<ViewGwpSkuProduct> lstViewGwpSkuProduct) {
		this.lstViewGwpSkuProduct = lstViewGwpSkuProduct;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}
}
