package com.api.dms.order.model.order;

import javax.validation.constraints.NotNull;

import com.api.dms.order.model.RequestModel;

public class PostDeletePackedRequestModel extends RequestModel {
	@NotNull(message = "Id is not null")
	private String tbopdId;

	public String getTbopdId() {
		return tbopdId;
	}

	public void setTbopdId(String tbopdId) {
		this.tbopdId = tbopdId;
	}
}
