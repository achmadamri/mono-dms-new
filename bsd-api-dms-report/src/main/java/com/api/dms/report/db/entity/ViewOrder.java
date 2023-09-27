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
 * The persistent class for the view_order database table.
 * 
 */
@Entity
@Table(name="view_order")
@NamedQuery(name="ViewOrder.findAll", query="SELECT v FROM ViewOrder v")
public class ViewOrder implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="tbo_brand")
	private String tboBrand;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbo_create_date")
	private Date tboCreateDate;

	@Column(name="tbo_create_id")
	private Integer tboCreateId;

	@Column(name="tbo_full_address")
	private String tboFullAddress;

	@Column(name="tbo_hp")
	private String tboHp;

	@Column(name="tbo_market")
	private String tboMarket;

	@Column(name="tbo_name")
	private String tboName;

	@Column(name="tbo_order_no")
	private String tboOrderNo;

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

	public ViewOrder() {
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

	public String getTboFullAddress() {
		return this.tboFullAddress;
	}

	public void setTboFullAddress(String tboFullAddress) {
		this.tboFullAddress = tboFullAddress;
	}

	public String getTboHp() {
		return this.tboHp;
	}

	public void setTboHp(String tboHp) {
		this.tboHp = tboHp;
	}

	public String getTboMarket() {
		return this.tboMarket;
	}

	public void setTboMarket(String tboMarket) {
		this.tboMarket = tboMarket;
	}

	public String getTboName() {
		return this.tboName;
	}

	public void setTboName(String tboName) {
		this.tboName = tboName;
	}

	public String getTboOrderNo() {
		return this.tboOrderNo;
	}

	public void setTboOrderNo(String tboOrderNo) {
		this.tboOrderNo = tboOrderNo;
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