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
 * The persistent class for the view_sales database table.
 * 
 */
@Entity
@Table(name="view_sales")
@NamedQuery(name="ViewSales.findAll", query="SELECT v FROM ViewSales v")
public class ViewSales implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="tbo_brand")
	private String tboBrand;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbo_create_date")
	private Date tboCreateDate;

	@Column(name="tbo_create_id")
	private Integer tboCreateId;

	@Column(name="tbo_item")
	private String tboItem;

	@Column(name="tbo_market_id")
	private String tboMarketId;

	@Column(name="tbo_frontliner")
	private String tboFrontliner;

	@Column(name="tbo_order_sq")
	private String tboOrderSq;

	@Column(name="tbo_order_no")
	private String tboOrderNo;

	@Column(name="tbo_qty")
	private Integer tboQty;

	@Column(name="tbo_sku")
	private String tboSku;

	@Column(name="tbo_code")
	private String tboCode;

	@Column(name="tbo_type")
	private String tboType;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbo_update_date")
	private Date tboUpdateDate;

	@Column(name="tbo_update_id")
	private Integer tboUpdateId;

	@Column(name="tbu_id")
	private Integer tbuId;

	@Id
	@Column(name="uuid")
	private String uuid;

	public ViewSales() {
	}

	public String getTboBrand() {
		return this.tboBrand;
	}

	public void setTboBrand(String tboBrand) {
		this.tboBrand = tboBrand;
	}

	public Date getTboCreateDate() {
		return this.tboCreateDate;
	}

	public void setTboCreateDate(Date tboCreateDate) {
		this.tboCreateDate = tboCreateDate;
	}

	public Integer getTboCreateId() {
		return this.tboCreateId;
	}

	public void setTboCreateId(Integer tboCreateId) {
		this.tboCreateId = tboCreateId;
	}

	public String getTboItem() {
		return this.tboItem;
	}

	public void setTboItem(String tboItem) {
		this.tboItem = tboItem;
	}

	public String getTboMarketId() {
		return this.tboMarketId;
	}

	public void setTboMarketId(String tboMarketId) {
		this.tboMarketId = tboMarketId;
	}

	public String getTboFrontliner() {
		return tboFrontliner;
	}

	public void setTboFrontliner(String tboFrontliner) {
		this.tboFrontliner = tboFrontliner;
	}

	public String getTboOrderSq() {
		return tboOrderSq;
	}

	public void setTboOrderSq(String tboOrderSq) {
		this.tboOrderSq = tboOrderSq;
	}

	public String getTboOrderNo() {
		return this.tboOrderNo;
	}

	public void setTboOrderNo(String tboOrderNo) {
		this.tboOrderNo = tboOrderNo;
	}

	public Integer getTboQty() {
		return this.tboQty;
	}

	public void setTboQty(Integer tboQty) {
		this.tboQty = tboQty;
	}

	public String getTboSku() {
		return this.tboSku;
	}

	public void setTboSku(String tboSku) {
		this.tboSku = tboSku;
	}

	public String getTboCode() {
		return tboCode;
	}

	public void setTboCode(String tboCode) {
		this.tboCode = tboCode;
	}

	public String getTboType() {
		return this.tboType;
	}

	public void setTboType(String tboType) {
		this.tboType = tboType;
	}

	public Date getTboUpdateDate() {
		return this.tboUpdateDate;
	}

	public void setTboUpdateDate(Date tboUpdateDate) {
		this.tboUpdateDate = tboUpdateDate;
	}

	public Integer getTboUpdateId() {
		return this.tboUpdateId;
	}

	public void setTboUpdateId(Integer tboUpdateId) {
		this.tboUpdateId = tboUpdateId;
	}

	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Integer getTbuId() {
		return tbuId;
	}

	public void setTbuId(Integer tbuId) {
		this.tbuId = tbuId;
	}

}