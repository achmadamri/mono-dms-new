package com.api.dms.product.model.product;

import java.util.List;

import com.api.dms.product.db.entity.TbBrand;
import com.api.dms.product.model.ResponseModel;

public class GetBrandResponseModel extends ResponseModel {
	
	public GetBrandResponseModel(GetBrandRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<TbBrand> lstTbBrand;

	public List<TbBrand> getLstTbBrand() {
		return lstTbBrand;
	}

	public void setLstTbBrand(List<TbBrand> lstTbBrand) {
		this.lstTbBrand = lstTbBrand;
	}
}
