package com.api.dms.member.model.order;

import java.util.List;

import com.api.dms.member.model.RequestModel;

public class PostUserAddRequestModel extends RequestModel {
	private TbUser tbUser;
	
	private List<TbUserMarket> lstTbUserMarket;
	
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

	public List<TbUserMarket> getLstTbUserMarket() {
		return lstTbUserMarket;
	}

	public void setLstTbUserMarket(List<TbUserMarket> lstTbUserMarket) {
		this.lstTbUserMarket = lstTbUserMarket;
	}
}
