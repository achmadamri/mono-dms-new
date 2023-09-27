package com.api.dms.product.model.product;

import javax.validation.constraints.NotNull;

import com.api.dms.product.model.RequestModel;

public class PostProductDeleteRequestModel extends RequestModel {
	@NotNull(message = "Id is not null")
	private String tbpId;

	public String getTbpId() {
		return tbpId;
	}

	public void setTbpId(String tbpId) {
		this.tbpId = tbpId;
	}
}
