package com.api.dms.member.model.user;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

public class TbMarket implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer tbmId;

	private Date tbmCreateDate;

	private Integer tbmCreateId;

	private String tbmMarket;

	private Integer tbmParentId;

	private String tbmRole;

	private Date tbmUpdateDate;

	private Integer tbmUpdateId;

	private Integer check;

	public TbMarket() {
	}

	public Integer getTbmId() {
		return tbmId;
	}

	public void setTbmId(Integer tbmId) {
		this.tbmId = tbmId;
	}

	public Date getTbmCreateDate() {
		return tbmCreateDate;
	}

	public void setTbmCreateDate(Date tbmCreateDate) {
		this.tbmCreateDate = tbmCreateDate;
	}

	public Integer getTbmCreateId() {
		return tbmCreateId;
	}

	public void setTbmCreateId(Integer tbmCreateId) {
		this.tbmCreateId = tbmCreateId;
	}

	public String getTbmMarket() {
		return tbmMarket;
	}

	public void setTbmMarket(String tbmMarket) {
		this.tbmMarket = tbmMarket;
	}

	public Integer getTbmParentId() {
		return tbmParentId;
	}

	public void setTbmParentId(Integer tbmParentId) {
		this.tbmParentId = tbmParentId;
	}

	public String getTbmRole() {
		return tbmRole;
	}

	public void setTbmRole(String tbmRole) {
		this.tbmRole = tbmRole;
	}

	public Date getTbmUpdateDate() {
		return tbmUpdateDate;
	}

	public void setTbmUpdateDate(Date tbmUpdateDate) {
		this.tbmUpdateDate = tbmUpdateDate;
	}

	public Integer getTbmUpdateId() {
		return tbmUpdateId;
	}

	public void setTbmUpdateId(Integer tbmUpdateId) {
		this.tbmUpdateId = tbmUpdateId;
	}

	public Integer getCheck() {
		return check;
	}

	public void setCheck(Integer check) {
		this.check = check;
	}

}