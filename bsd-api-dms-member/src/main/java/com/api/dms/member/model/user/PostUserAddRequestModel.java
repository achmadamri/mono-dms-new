package com.api.dms.member.model.user;

import java.util.List;

import com.api.dms.member.db.entity.TbUser;
import com.api.dms.member.db.entity.ViewUserMenu;
import com.api.dms.member.model.RequestModel;

public class PostUserAddRequestModel extends RequestModel {
	private TbUser tbUser;
	
	private List<ViewUserMenu> lstViewUserMenu;
	
	private List<TbMarket> lstTbMarket;
	
	private List<TbBrand> lstTbBrand;

	public TbUser getTbUser() {
		return tbUser;
	}

	public void setTbUser(TbUser tbUser) {
		this.tbUser = tbUser;
	}

	public List<ViewUserMenu> getLstViewUserMenu() {
		return lstViewUserMenu;
	}

	public void setLstViewUserMenu(List<ViewUserMenu> lstViewUserMenu) {
		this.lstViewUserMenu = lstViewUserMenu;
	}

	public List<TbMarket> getLstTbMarket() {
		return lstTbMarket;
	}

	public void setLstTbMarket(List<TbMarket> lstTbMarket) {
		this.lstTbMarket = lstTbMarket;
	}

	public List<TbBrand> getLstTbBrand() {
		return lstTbBrand;
	}

	public void setLstTbBrand(List<TbBrand> lstTbBrand) {
		this.lstTbBrand = lstTbBrand;
	}
}
