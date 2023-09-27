package com.api.dms.order.model.user;

import com.api.dms.order.model.RequestModel;
import com.api.dms.order.model.ResponseModel;

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
