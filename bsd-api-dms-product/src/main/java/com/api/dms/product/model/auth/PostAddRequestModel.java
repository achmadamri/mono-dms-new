package com.api.dms.product.model.auth;

import com.api.dms.product.model.RequestModel;

public class PostAddRequestModel extends RequestModel {
	private String tbaEmail;

	private String tbaPassword;

	private String tbaMemberId;

	private String tbaIdLogin;

	public String getTbaEmail() {
		return tbaEmail;
	}

	public void setTbaEmail(String tbaEmail) {
		this.tbaEmail = tbaEmail;
	}

	public String getTbaPassword() {
		return tbaPassword;
	}

	public void setTbaPassword(String tbaPassword) {
		this.tbaPassword = tbaPassword;
	}

	public String getTbaMemberId() {
		return tbaMemberId;
	}

	public void setTbaMemberId(String tbaMemberId) {
		this.tbaMemberId = tbaMemberId;
	}

	public String getTbaIdLogin() {
		return tbaIdLogin;
	}

	public void setTbaIdLogin(String tbaIdLogin) {
		this.tbaIdLogin = tbaIdLogin;
	}
}
