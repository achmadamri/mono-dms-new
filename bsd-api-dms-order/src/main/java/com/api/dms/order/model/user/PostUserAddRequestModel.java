package com.api.dms.order.model.user;

import java.util.List;

import com.api.dms.order.model.RequestModel;

public class PostUserAddRequestModel extends RequestModel {
	private TbUser tbUser;
	
	private List<TbUserBrand> lstTbUserBrand;

	public TbUser getTbUser() {
		return tbUser;
	}

	public void setTbUser(TbUser tbUser) {
		this.tbUser = tbUser;
	}

	public List<TbUserBrand> getLstTbUserBrand() {
		return lstTbUserBrand;
	}

	public void setLstTbUserBrand(List<TbUserBrand> lstTbUserBrand) {
		this.lstTbUserBrand = lstTbUserBrand;
	}
}
