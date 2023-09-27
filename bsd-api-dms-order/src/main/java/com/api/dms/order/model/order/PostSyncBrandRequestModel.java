package com.api.dms.order.model.order;

import java.util.List;

import com.api.dms.order.model.RequestModel;

public class PostSyncBrandRequestModel extends RequestModel {
	private List<TbBrand> lstTbBrand;

	public List<TbBrand> getLstTbBrand() {
		return lstTbBrand;
	}

	public void setLstTbBrand(List<TbBrand> lstTbBrand) {
		this.lstTbBrand = lstTbBrand;
	}
}
