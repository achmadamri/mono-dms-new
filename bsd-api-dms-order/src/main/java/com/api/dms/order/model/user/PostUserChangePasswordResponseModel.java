package com.api.dms.order.model.user;

import com.api.dms.order.model.ResponseModel;

public class PostUserChangePasswordResponseModel extends ResponseModel {

	public PostUserChangePasswordResponseModel(PostUserChangePasswordRequestModel requestModel) {
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
