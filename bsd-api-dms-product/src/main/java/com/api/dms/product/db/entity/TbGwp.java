package com.api.dms.product.db.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the tb_gwp database table.
 * 
 */
@Entity
@Table(name="tb_gwp")
@NamedQuery(name="TbGwp.findAll", query="SELECT t FROM TbGwp t")
public class TbGwp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tbg_id")
	private Integer tbgId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbg_create_date")
	private Date tbgCreateDate;

	@Column(name="tbg_create_id")
	private Integer tbgCreateId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbg_update_date")
	private Date tbgUpdateDate;

	@Column(name="tbg_update_id")
	private Integer tbgUpdateId;

	@Column(name="tbg_sku")
	private String tbgSku;

	@Column(name="tbg_status")
	private String tbgStatus;

	public TbGwp() {
	}

	public Integer getTbgId() {
		return this.tbgId;
	}

	public void setTbgId(Integer tbgId) {
		this.tbgId = tbgId;
	}

	public Date getTbgCreateDate() {
		return this.tbgCreateDate;
	}

	public void setTbgCreateDate(Date tbgCreateDate) {
		this.tbgCreateDate = tbgCreateDate;
	}

	public Integer getTbgCreateId() {
		return this.tbgCreateId;
	}

	public void setTbgCreateId(Integer tbgCreateId) {
		this.tbgCreateId = tbgCreateId;
	}

	public Date getTbgUpdateDate() {
		return this.tbgUpdateDate;
	}

	public void setTbgUpdateDate(Date tbgUpdateDate) {
		this.tbgUpdateDate = tbgUpdateDate;
	}

	public Integer getTbgUpdateId() {
		return this.tbgUpdateId;
	}

	public void setTbgUpdateId(Integer tbgUpdateId) {
		this.tbgUpdateId = tbgUpdateId;
	}

	public String getTbgSku() {
		return this.tbgSku;
	}

	public void setTbgSku(String tbgSku) {
		this.tbgSku = tbgSku;
	}

	public String getTbgStatus() {
		return tbgStatus;
	}

	public void setTbgStatus(String tbgStatus) {
		this.tbgStatus = tbgStatus;
	}

}