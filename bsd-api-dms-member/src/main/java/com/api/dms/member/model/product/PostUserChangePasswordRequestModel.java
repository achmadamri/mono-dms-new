package com.api.dms.member.model.product;

import com.api.dms.member.model.RequestModel;

public class PostUserChangePasswordRequestModel extends RequestModel {
	private TbUser tbUser;

	public TbUser getTbUser() {
		return tbUser;
	}

	public void setTbUser(TbUser tbUser) {
		this.tbUser = tbUser;
	}
}
