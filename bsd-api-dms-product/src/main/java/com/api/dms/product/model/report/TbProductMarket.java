package com.api.dms.product.model.report;

import java.io.Serializable;
import java.util.Date;

public class TbProductMarket implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer tbpmId;

	private String tbmMarketId;

	private Integer tbmMarketCheck;

	private Integer tbpId;

	private String tbpSku;

	private Date tbpmCreateDate;

	private Integer tbpmCreateId;

	private Date tbpmUpdateDate;

	private Integer tbpmUpdateId;

	public TbProductMarket() {
	}

	public Integer getTbpmId() {
		return tbpmId;
	}

	public void setTbpmId(Integer tbpmId) {
		this.tbpmId = tbpmId;
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

	public Integer getTbpId() {
		return tbpId;
	}

	public void setTbpId(Integer tbpId) {
		this.tbpId = tbpId;
	}

	public String getTbpSku() {
		return tbpSku;
	}

	public void setTbpSku(String tbpSku) {
		this.tbpSku = tbpSku;
	}

	public Date getTbpmCreateDate() {
		return tbpmCreateDate;
	}

	public void setTbpmCreateDate(Date tbpmCreateDate) {
		this.tbpmCreateDate = tbpmCreateDate;
	}

	public Integer getTbpmCreateId() {
		return tbpmCreateId;
	}

	public void setTbpmCreateId(Integer tbpmCreateId) {
		this.tbpmCreateId = tbpmCreateId;
	}

	public Date getTbpmUpdateDate() {
		return tbpmUpdateDate;
	}

	public void setTbpmUpdateDate(Date tbpmUpdateDate) {
		this.tbpmUpdateDate = tbpmUpdateDate;
	}

	public Integer getTbpmUpdateId() {
		return tbpmUpdateId;
	}

	public void setTbpmUpdateId(Integer tbpmUpdateId) {
		this.tbpmUpdateId = tbpmUpdateId;
	}

}