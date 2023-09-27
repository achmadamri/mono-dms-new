package com.api.dms.member.model.user;

import javax.validation.constraints.NotNull;

import com.api.dms.member.model.RequestModel;

public class PostUserDeleteRequestModel extends RequestModel {
	@NotNull(message = "Id is not null")
	private String tbuId;

	public String getTbuId() {
		return tbuId;
	}

	public void setTbuId(String tbuId) {
		this.tbuId = tbuId;
	}
}
