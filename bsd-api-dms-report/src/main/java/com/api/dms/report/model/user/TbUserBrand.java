package com.api.dms.report.model.user;

import java.io.Serializable;
import java.util.Date;

public class TbUserBrand implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer tbubId;

	private String tbbBrand;

	private Integer tbbBrandCheck;

	private String tbbBrandId;

	private Integer tbuId;

	private Date tbubCreateDate;

	private Integer tbubCreateId;

	private Date tbubUpdateDate;

	private Integer tbubUpdateId;

	public TbUserBrand() {
	}

	public Integer getTbubId() {
		return this.tbubId;
	}

	public void setTbubId(Integer tbubId) {
		this.tbubId = tbubId;
	}

	public String getTbbBrand() {
		return this.tbbBrand;
	}

	public void setTbbBrand(String tbbBrand) {
		this.tbbBrand = tbbBrand;
	}

	public Integer getTbbBrandCheck() {
		return this.tbbBrandCheck;
	}

	public void setTbbBrandCheck(Integer tbbBrandCheck) {
		this.tbbBrandCheck = tbbBrandCheck;
	}

	public String getTbbBrandId() {
		return this.tbbBrandId;
	}

	public void setTbbBrandId(String tbbBrandId) {
		this.tbbBrandId = tbbBrandId;
	}

	public Integer getTbuId() {
		return this.tbuId;
	}

	public void setTbuId(Integer tbuId) {
		this.tbuId = tbuId;
	}

	public Date getTbubCreateDate() {
		return this.tbubCreateDate;
	}

	public void setTbubCreateDate(Date tbubCreateDate) {
		this.tbubCreateDate = tbubCreateDate;
	}

	public Integer getTbubCreateId() {
		return this.tbubCreateId;
	}

	public void setTbubCreateId(Integer tbubCreateId) {
		this.tbubCreateId = tbubCreateId;
	}

	public Date getTbubUpdateDate() {
		return this.tbubUpdateDate;
	}

	public void setTbubUpdateDate(Date tbubUpdateDate) {
		this.tbubUpdateDate = tbubUpdateDate;
	}

	public Integer getTbubUpdateId() {
		return this.tbubUpdateId;
	}

	public void setTbubUpdateId(Integer tbubUpdateId) {
		this.tbubUpdateId = tbubUpdateId;
	}

}