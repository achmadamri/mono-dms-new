package com.api.dms.report.db.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the view_stock database table.
 * 
 */
@Entity
@Table(name="view_stock")
@NamedQuery(name="ViewStock.findAll", query="SELECT v FROM ViewStock v")
public class ViewStock implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="tbp_brand")
	private String tbpBrand;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbp_create_date")
	private Date tbpCreateDate;

	@Column(name="tbp_create_id")
	private Integer tbpCreateId;

	@Column(name="tbp_item")
	private String tbpItem;

	@Column(name="tbpm_qty")
	private Integer tbpmQty;

	@Column(name="tbp_sku")
	private String tbpSku;

	@Column(name="tbp_code")
	private String tbpCode;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbp_update_date")
	private Date tbpUpdateDate;

	@Column(name="tbp_update_id")
	private Integer tbpUpdateId;

	@Column(name="tbm_market_id")
	private String tbmMarketId;

	@Id
	@Column(name="uuid")
	private String uuid;

	public ViewStock() {
	}

	public String getTbpBrand() {
		return this.tbpBrand;
	}

	public void setTbpBrand(String tbpBrand) {
		this.tbpBrand = tbpBrand;
	}

	public Date getTbpCreateDate() {
		return this.tbpCreateDate;
	}

	public void setTbpCreateDate(Date tbpCreateDate) {
		this.tbpCreateDate = tbpCreateDate;
	}

	public Integer getTbpCreateId() {
		return this.tbpCreateId;
	}

	public void setTbpCreateId(Integer tbpCreateId) {
		this.tbpCreateId = tbpCreateId;
	}

	public String getTbpItem() {
		return this.tbpItem;
	}

	public void setTbpItem(String tbpItem) {
		this.tbpItem = tbpItem;
	}

	public Integer getTbpmQty() {
		return this.tbpmQty;
	}

	public void setTbpmQty(Integer tbpmQty) {
		this.tbpmQty = tbpmQty;
	}

	public String getTbpSku() {
		return this.tbpSku;
	}

	public void setTbpSku(String tbpSku) {
		this.tbpSku = tbpSku;
	}

	public String getTbpCode() {
		return tbpCode;
	}

	public void setTbpCode(String tbpCode) {
		this.tbpCode = tbpCode;
	}

	public Date getTbpUpdateDate() {
		return this.tbpUpdateDate;
	}

	public void setTbpUpdateDate(Date tbpUpdateDate) {
		this.tbpUpdateDate = tbpUpdateDate;
	}

	public Integer getTbpUpdateId() {
		return this.tbpUpdateId;
	}

	public void setTbpUpdateId(Integer tbpUpdateId) {
		this.tbpUpdateId = tbpUpdateId;
	}

	public String getTbmMarketId() {
		return tbmMarketId;
	}

	public void setTbmMarketId(String tbmMarketId) {
		this.tbmMarketId = tbmMarketId;
	}

	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}