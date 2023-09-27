package com.api.dms.product.model.market;

import javax.validation.constraints.NotNull;

import com.api.dms.product.model.RequestModel;

public class PostMarketDeleteRequestModel extends RequestModel {
	@NotNull(message = "Id is not null")
	private String tbmId;

	public String getTbmId() {
		return tbmId;
	}

	public void setTbmId(String tbmId) {
		this.tbmId = tbmId;
	}
}
