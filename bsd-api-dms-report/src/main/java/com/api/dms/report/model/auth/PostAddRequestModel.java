package com.api.dms.report.model.auth;

import com.api.dms.report.model.RequestModel;

public class PostAddRequestModel extends RequestModel {
	private String tbaEmail;

	private String tbaPassword;

	private String tbaStatus;

	private String tbaTokenSalt;

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

	public String getTbaStatus() {
		return tbaStatus;
	}

	public void setTbaStatus(String tbaStatus) {
		this.tbaStatus = tbaStatus;
	}

	public String getTbaTokenSalt() {
		return tbaTokenSalt;
	}

	public void setTbaTokenSalt(String tbaTokenSalt) {
		this.tbaTokenSalt = tbaTokenSalt;
	}
}
