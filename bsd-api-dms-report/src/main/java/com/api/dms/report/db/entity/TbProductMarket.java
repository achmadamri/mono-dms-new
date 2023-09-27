package com.api.dms.report.db.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tb_product_market database table.
 * 
 */
@Entity
@Table(name="tb_product_market")
@NamedQuery(name="TbProductMarket.findAll", query="SELECT t FROM TbProductMarket t")
public class TbProductMarket implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="tbpm_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer tbpmId;

	@Column(name="tbm_market")
	private String tbmMarket;

	@Column(name="tbm_market_check")
	private Integer tbmMarketCheck;

	@Column(name="tbp_id")
	private Integer tbpId;

	@Column(name="tbp_sku")
	private String tbpSku;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbpm_create_date")
	private Date tbpmCreateDate;

	@Column(name="tbpm_create_id")
	private Integer tbpmCreateId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbpm_update_date")
	private Date tbpmUpdateDate;

	@Column(name="tbpm_update_id")
	private Integer tbpmUpdateId;

	public TbProductMarket() {
	}

	public Integer getTbpmId() {
		return tbpmId;
	}

	public void setTbpmId(Integer tbpmId) {
		this.tbpmId = tbpmId;
	}

	public String getTbmMarket() {
		return tbmMarket;
	}

	public void setTbmMarket(String tbmMarket) {
		this.tbmMarket = tbmMarket;
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