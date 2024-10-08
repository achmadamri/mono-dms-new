package com.api.dms.member.model.report;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

public class TbUserMarket implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer tbumId;

	private String tbmMarketId;

	private Integer tbmMarketCheck;

	private Integer tbuId;

	private Date tbumCreateDate;

	private Integer tbumCreateId;

	private Date tbumUpdateDate;

	private Integer tbumUpdateId;

	public Integer getTbumId() {
		return tbumId;
	}

	public void setTbumId(Integer tbumId) {
		this.tbumId = tbumId;
	}

	public String getTbmMarketId() {
		return tbmMarketId;
	}

	public void setTbmMarketId(String tbmMarketId) {
		this.tbmMarketId = tbmMarketId;
	}

	public Integer getTbmMarketCheck() {
		return tbmMarketCheck;
	}

	public void setTbmMarketCheck(Integer tbmMarketCheck) {
		this.tbmMarketCheck = tbmMarketCheck;
	}

	public Integer getTbuId() {
		return tbuId;
	}

	public void setTbuId(Integer tbuId) {
		this.tbuId = tbuId;
	}

	public Date getTbumCreateDate() {
		return tbumCreateDate;
	}

	public void setTbumCreateDate(Date tbumCreateDate) {
		this.tbumCreateDate = tbumCreateDate;
	}

	public Integer getTbumCreateId() {
		return tbumCreateId;
	}

	public void setTbumCreateId(Integer tbumCreateId) {
		this.tbumCreateId = tbumCreateId;
	}

	public Date getTbumUpdateDate() {
		return tbumUpdateDate;
	}

	public void setTbumUpdateDate(Date tbumUpdateDate) {
		this.tbumUpdateDate = tbumUpdateDate;
	}

	public Integer getTbumUpdateId() {
		return tbumUpdateId;
	}

	public void setTbumUpdateId(Integer tbumUpdateId) {
		this.tbumUpdateId = tbumUpdateId;
	}
}