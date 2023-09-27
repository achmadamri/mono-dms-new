package com.api.dms.product.model.market;

import javax.validation.constraints.NotNull;

import com.api.dms.product.model.RequestModel;

public class PostMarketAddRequestModel extends RequestModel {	
	@NotNull(message = "Market is not null")
	private String tbmMarket;
	
	@NotNull(message = "Role is not null")
	private String tbmRole;
	
	@NotNull(message = "Parent Id is not null")
	private String tbmParentId;

	public String getTbmMarket() {
		return tbmMarket;
	}

	public void setTbmMarket(String tbmMarket) {
		this.tbmMarket = tbmMarket;
	}

	public String getTbmRole() {
		return tbmRole;
	}

	public void setTbmRole(String tbmRole) {
		this.tbmRole = tbmRole;
	}

	public String getTbmParentId() {
		return tbmParentId;
	}

	public void setTbmParentId(String tbmParentId) {
		this.tbmParentId = tbmParentId;
	}
}
