package com.api.dms.product.model.gwp;

import com.api.dms.product.db.entity.TbGwp;
import com.api.dms.product.model.ResponseModel;

public class PostGwpAddResponseModel extends ResponseModel {

	public PostGwpAddResponseModel(PostGwpAddRequestModel requestModel) {
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
