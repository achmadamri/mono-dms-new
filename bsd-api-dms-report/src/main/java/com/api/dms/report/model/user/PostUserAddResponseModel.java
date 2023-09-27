package com.api.dms.report.model.user;

import com.api.dms.report.model.RequestModel;
import com.api.dms.report.model.ResponseModel;

public class PostUserAddResponseModel extends ResponseModel {

	public PostUserAddResponseModel(RequestModel requestModel) {
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
