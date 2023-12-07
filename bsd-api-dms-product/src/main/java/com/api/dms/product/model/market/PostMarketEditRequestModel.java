package com.api.dms.product.model.market;

import javax.validation.constraints.NotNull;

import com.api.dms.product.model.RequestModel;

public class PostMarketEditRequestModel extends RequestModel {
	@NotNull(message = "Id is not null")
	private String tbmId;
	
	@NotNull(message = "Market is not null")
	private String tbmMarketId;
	
	@NotNull(message = "Role is not null")
	private String tbmRole;
	
	private String tbmParentId;

	public String getTbmId() {
		return tbmId;
	}

	public void setTbmId(String tbmId) {
		this.tbmId = tbmId;
	}

	public String getTbmMarketId() {
		return tbmMarketId;
	}

	public void setTbmMarketId(String tbmMarketId) {
		this.tbmMarketId = tbmMarketId;
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
