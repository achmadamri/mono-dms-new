package com.api.dms.product.model.gwp;

import javax.validation.constraints.NotNull;

import com.api.dms.product.model.RequestModel;

public class PostGwpDeleteRequestModel extends RequestModel {
	@NotNull(message = "Id is not null")
	private String tbgId;

	public String getTbgId() {
		return tbgId;
	}

	public void setTbgId(String tbgId) {
		this.tbgId = tbgId;
	}
}
