package com.api.dms.product.model.user;

import com.api.dms.product.model.ResponseModel;

public class PostUserEditResponseModel extends ResponseModel {

	public PostUserEditResponseModel(PostUserEditRequestModel requestModel) {
		super(requestModel);
	}

	private TbUser tbUser;

	public TbUser getTbUser() {
		return tbUser;
	}

	public void setTbUser(TbUser tbUser) {
		this.tbUser = tbUser;
	}
}
