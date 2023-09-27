package com.api.dms.order.model.order;

import javax.validation.constraints.NotNull;

import com.api.dms.order.model.RequestModel;

public class PostOrderDeleteRequestModel extends RequestModel {
	@NotNull(message = "Id is not null")
	private String tboId;

	public String getTboId() {
		return tboId;
	}

	public void setTboId(String tboId) {
		this.tboId = tboId;
	}
}
