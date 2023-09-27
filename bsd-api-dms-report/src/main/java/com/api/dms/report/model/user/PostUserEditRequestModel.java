package com.api.dms.report.model.user;

import java.util.List;

import com.api.dms.report.model.RequestModel;

public class PostUserEditRequestModel extends RequestModel {
	private TbUser tbUser;
	
	private List<TbUserMarket> lstTbUserMarket;
	
	private List<TbUserBrand> lstTbUserBrand;

	public TbUser getTbUser() {
		return tbUser;
	}

	public void setTbUser(TbUser tbUser) {
		this.tbUser = tbUser;
	}

	public List<TbUserMarket> getLstTbUserMarket() {
		return lstTbUserMarket;
	}

	public void setLstTbUserMarket(List<TbUserMarket> lstTbUserMarket) {
		this.lstTbUserMarket = lstTbUserMarket;
	}

	public List<TbUserBrand> getLstTbUserBrand() {
		return lstTbUserBrand;
	}

	public void setLstTbUserBrand(List<TbUserBrand> lstTbUserBrand) {
		this.lstTbUserBrand = lstTbUserBrand;
	}
}
