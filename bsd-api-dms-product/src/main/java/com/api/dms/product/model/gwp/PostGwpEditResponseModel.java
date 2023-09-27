package com.api.dms.product.model.gwp;

import com.api.dms.product.db.entity.TbGwp;
import com.api.dms.product.model.ResponseModel;

public class PostGwpEditResponseModel extends ResponseModel {

	public PostGwpEditResponseModel(PostGwpEditRequestModel requestModel) {
		super(requestModel);
	}

	private TbGwp tbGwp;

	public TbGwp getTbGwp() {
		return tbGwp;
	}

	public void setTbGwp(TbGwp tbGwp) {
		this.tbGwp = tbGwp;
	}
}
