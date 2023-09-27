package com.api.dms.report.model.user;

import com.api.dms.report.model.ResponseModel;

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
