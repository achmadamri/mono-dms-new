package com.api.dms.product.db.entity;

import java.io.Serializable;
import java.math.BigDecimal;
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
 * The persistent class for the tb_gwp_sku database table.
 * 
 */
@Entity
@Table(name="tb_gwp_sku")
@NamedQuery(name="TbGwpSku.findAll", query="SELECT t FROM TbGwpSku t")
public class TbGwpSku implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tbgs_id")
	private Integer tbgsId;

	@Column(name="tbg_id")
	private Integer tbgId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbgs_create_date")
	private Date tbgsCreateDate;

	@Column(name="tbgs_create_id")
	private Integer tbgsCreateId;

	@Column(name="tbgs_sku")
	private String tbgsSku;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbgs_update_date")
	private Date tbgsUpdateDate;

	@Column(name="tbgs_update_id")
	private Integer tbgsUpdateId;

	@Column(name="tbgs_min")
	private BigDecimal tbgsMin;

	@Column(name="tbgs_min_accu")
	private BigDecimal tbgsMinAccu;

	@Column(name="tbgs_qty")
	private Integer tbgsQty;

	public TbGwpSku() {
	}

	public Integer getTbgsId() {
		return this.tbgsId;
	}

	public void setTbgsId(Integer tbgsId) {
		this.tbgsId = tbgsId;
	}

	public Integer getTbgId() {
		return this.tbgId;
	}

	public void setTbgId(Integer tbgId) {
		this.tbgId = tbgId;
	}

	public Date getTbgsCreateDate() {
		return this.tbgsCreateDate;
	}

	public void setTbgsCreateDate(Date tbgsCreateDate) {
		this.tbgsCreateDate = tbgsCreateDate;
	}

	public Integer getTbgsCreateId() {
		return this.tbgsCreateId;
	}

	public void setTbgsCreateId(Integer tbgsCreateId) {
		this.tbgsCreateId = tbgsCreateId;
	}

	public String getTbgsSku() {
		return this.tbgsSku;
	}

	public void setTbgsSku(String tbgsSku) {
		this.tbgsSku = tbgsSku;
	}

	public Date getTbgsUpdateDate() {
		return this.tbgsUpdateDate;
	}

	public void setTbgsUpdateDate(Date tbgsUpdateDate) {
		this.tbgsUpdateDate = tbgsUpdateDate;
	}

	public Integer getTbgsUpdateId() {
		return this.tbgsUpdateId;
	}

	public void setTbgsUpdateId(Integer tbgsUpdateId) {
		this.tbgsUpdateId = tbgsUpdateId;
	}

	public BigDecimal getTbgsMin() {
		return tbgsMin;
	}

	public void setTbgsMin(BigDecimal tbgsMin) {
		this.tbgsMin = tbgsMin;
	}

	public Integer getTbgsQty() {
		return tbgsQty;
	}

	public void setTbgsQty(Integer tbgsQty) {
		this.tbgsQty = tbgsQty;
	}

	public BigDecimal getTbgsMinAccu() {
		return tbgsMinAccu;
	}

	public void setTbgsMinAccu(BigDecimal tbgsMinAccu) {
		this.tbgsMinAccu = tbgsMinAccu;
	}

}