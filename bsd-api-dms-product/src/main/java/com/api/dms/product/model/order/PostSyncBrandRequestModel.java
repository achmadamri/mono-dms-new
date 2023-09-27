package com.api.dms.product.model.order;

import java.util.List;

import com.api.dms.product.model.RequestModel;

public class PostSyncBrandRequestModel extends RequestModel {
	private List<TbBrand> lstTbBrand;

	public List<TbBrand> getLstTbBrand() {
		return lstTbBrand;
	}

	public void setLstTbBrand(List<TbBrand> lstTbBrand) {
		this.lstTbBrand = lstTbBrand;
	}
}
