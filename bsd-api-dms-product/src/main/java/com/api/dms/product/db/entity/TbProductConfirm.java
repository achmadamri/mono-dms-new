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
 * The persistent class for the tb_product_confirm database table.
 * 
 */
@Entity
@Table(name="tb_product_confirm")
@NamedQuery(name="TbProductConfirm.findAll", query="SELECT t FROM TbProductConfirm t")
public class TbProductConfirm implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tbpc_id")
	private Integer tbpcId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbpc_create_date")
	private Date tbpCreateDate;

	@Column(name="tbpc_create_id")
	private Integer tbpCreateId;

	@Column(name="tbpc_qty")
	private Integer tbpQty;

	@Column(name="tbpc_sku")
	private String tbpSku;

	@Column(name="tbpc_order_no")
	private String tbpcOrderNo;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbpc_update_date")
	private Date tbpcUpdateDate;

	@Column(name="tbpc_update_id")
	private Integer tbpcUpdateId;

	public TbProductConfirm() {
	}

	public Integer getTbpcId() {
		return tbpcId;
	}

	public void setTbpcId(Integer tbpcId) {
		this.tbpcId = tbpcId;
	}

	public Date getTbpCreateDate() {
		return tbpCreateDate;
	}

	public void setTbpCreateDate(Date tbpCreateDate) {
		this.tbpCreateDate = tbpCreateDate;
	}

	public Integer getTbpCreateId() {
		return tbpCreateId;
	}

	public void setTbpCreateId(Integer tbpCreateId) {
		this.tbpCreateId = tbpCreateId;
	}

	public Integer getTbpQty() {
		return tbpQty;
	}

	public void setTbpQty(Integer tbpQty) {
		this.tbpQty = tbpQty;
	}

	public String getTbpSku() {
		return tbpSku;
	}

	public void setTbpSku(String tbpSku) {
		this.tbpSku = tbpSku;
	}

	public String getTbpcOrderNo() {
		return tbpcOrderNo;
	}

	public void setTbpcOrderNo(String tbpcOrderNo) {
		this.tbpcOrderNo = tbpcOrderNo;
	}

	public Date getTbpcUpdateDate() {
		return tbpcUpdateDate;
	}

	public void setTbpcUpdateDate(Date tbpcUpdateDate) {
		this.tbpcUpdateDate = tbpcUpdateDate;
	}

	public Integer getTbpcUpdateId() {
		return tbpcUpdateId;
	}

	public void setTbpcUpdateId(Integer tbpcUpdateId) {
		this.tbpcUpdateId = tbpcUpdateId;
	}

}