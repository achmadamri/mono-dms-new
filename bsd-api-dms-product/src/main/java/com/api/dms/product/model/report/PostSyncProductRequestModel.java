package com.api.dms.product.model.report;

import java.util.List;

import com.api.dms.product.model.RequestModel;

public class PostSyncProductRequestModel extends RequestModel {
	private List<TbProduct> lstTbProduct;
	
	public List<TbProduct> getLstTbProduct() {
		return lstTbProduct;
	}

	public void setLstTbProduct(List<TbProduct> lstTbProduct) {
		this.lstTbProduct = lstTbProduct;
	}
}
