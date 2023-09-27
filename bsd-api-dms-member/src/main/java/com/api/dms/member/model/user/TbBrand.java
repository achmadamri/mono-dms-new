package com.api.dms.member.model.user;

import java.io.Serializable;
import java.util.Date;

public class TbBrand implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer tbbId;

	private String tbbBrand;

	private String tbbBrandId;

	private Date tbbCreateDate;

	private Integer tbbCreateId;

	private Date tbbUpdateDate;

	private Integer tbbUpdateId;

	private Integer check;

	public TbBrand() {
	}

	public Integer getTbbId() {
		return this.tbbId;
	}

	public void setTbbId(Integer tbbId) {
		this.tbbId = tbbId;
	}

	public String getTbbBrand() {
		return this.tbbBrand;
	}

	public void setTbbBrand(String tbbBrand) {
		this.tbbBrand = tbbBrand;
	}

	public String getTbbBrandId() {
		return this.tbbBrandId;
	}

	public void setTbbBrandId(String tbbBrandId) {
		this.tbbBrandId = tbbBrandId;
	}

	public Date getTbbCreateDate() {
		return this.tbbCreateDate;
	}

	public void setTbbCreateDate(Date tbbCreateDate) {
		this.tbbCreateDate = tbbCreateDate;
	}

	public Integer getTbbCreateId() {
		return this.tbbCreateId;
	}

	public void setTbbCreateId(Integer tbbCreateId) {
		this.tbbCreateId = tbbCreateId;
	}

	public Date getTbbUpdateDate() {
		return this.tbbUpdateDate;
	}

	public void setTbbUpdateDate(Date tbbUpdateDate) {
		this.tbbUpdateDate = tbbUpdateDate;
	}

	public Integer getTbbUpdateId() {
		return this.tbbUpdateId;
	}

	public void setTbbUpdateId(Integer tbbUpdateId) {
		this.tbbUpdateId = tbbUpdateId;
	}

	public Integer getCheck() {
		return check;
	}

	public void setCheck(Integer check) {
		this.check = check;
	}

}