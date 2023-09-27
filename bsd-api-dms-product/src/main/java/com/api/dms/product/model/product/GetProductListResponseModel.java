package com.api.dms.product.model.product;

import java.util.List;

import com.api.dms.product.db.entity.ViewBrandProduct;
import com.api.dms.product.model.ResponseModel;

public class GetProductListResponseModel extends ResponseModel {
	
	public GetProductListResponseModel(GetProductListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<ViewBrandProduct> lstViewBrandProduct;
	
	private Long length;

	public List<ViewBrandProduct> getLstViewBrandProduct() {
		return lstViewBrandProduct;
	}

	public void setLstViewBrandProduct(List<ViewBrandProduct> lstViewBrandProduct) {
		this.lstViewBrandProduct = lstViewBrandProduct;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}
}
