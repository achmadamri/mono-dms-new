package com.api.dms.product.model.gwp;

import java.util.List;

import com.api.dms.product.db.entity.ViewGwpProduct;
import com.api.dms.product.model.ResponseModel;

public class GetGwpListResponseModel extends ResponseModel {
	
	public GetGwpListResponseModel(GetGwpListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<ViewGwpProduct> lstViewGwpProduct;
	
	private Long length;

	public List<ViewGwpProduct> getLstViewGwpProduct() {
		return lstViewGwpProduct;
	}

	public void setLstViewGwpProduct(List<ViewGwpProduct> lstViewGwpProduct) {
		this.lstViewGwpProduct = lstViewGwpProduct;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}
}
