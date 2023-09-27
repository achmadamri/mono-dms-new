package com.api.dms.report.db.entity;

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
 * The persistent class for the tb_product database table.
 * 
 */
@Entity
@Table(name="tb_product")
@NamedQuery(name="TbProduct.findAll", query="SELECT t FROM TbProduct t")
public class TbProduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tbp_id")
	private Integer tbpId;

	@Column(name="tbb_brand_id")
	private String tbbBrandId;

	@Column(name="tbp_brand")
	private String tbbBrand;

	@Column(name="tbp_code")
	private String tbpCode;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbp_create_date")
	private Date tbpCreateDate;

	@Column(name="tbp_create_id")
	private Integer tbpCreateId;

	@Column(name="tbp_item")
	private String tbpItem;

	@Column(name="tbp_loc")
	private String tbpLoc;

	@Column(name="tbp_qty")
	private Integer tbpQty;

	@Column(name="tbp_sku")
	private String tbpSku;

	@Column(name="tbp_status")
	private String tbpStatus;

	@Column(name="tbp_unit_price")
	private BigDecimal tbpUnitPrice;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbp_update_date")
	private Date tbpUpdateDate;

	@Column(name="tbp_update_id")
	private Integer tbpUpdateId;

	@Column(name="tbp_type")
	private String tbpType;

	public TbProduct() {
	}

	public Integer getTbpId() {
		return tbpId;
	}

	public void setTbpId(Integer tbpId) {
		this.tbpId = tbpId;
	}

	public String getTbbBrandId() {
		return tbbBrandId;
	}

	public void setTbbBrandId(String tbbBrandId) {
		this.tbbBrandId = tbbBrandId;
	}

	public String getTbbBrand() {
		return tbbBrand;
	}

	public void setTbbBrand(String tbbBrand) {
		this.tbbBrand = tbbBrand;
	}

	public String getTbpCode() {
		return tbpCode;
	}

	public void setTbpCode(String tbpCode) {
		this.tbpCode = tbpCode;
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

	public String getTbpItem() {
		return tbpItem;
	}

	public void setTbpItem(String tbpItem) {
		this.tbpItem = tbpItem;
	}

	public String getTbpLoc() {
		return tbpLoc;
	}

	public void setTbpLoc(String tbpLoc) {
		this.tbpLoc = tbpLoc;
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

	public String getTbpStatus() {
		return tbpStatus;
	}

	public void setTbpStatus(String tbpStatus) {
		this.tbpStatus = tbpStatus;
	}

	public BigDecimal getTbpUnitPrice() {
		return tbpUnitPrice;
	}

	public void setTbpUnitPrice(BigDecimal tbpUnitPrice) {
		this.tbpUnitPrice = tbpUnitPrice;
	}

	public Date getTbpUpdateDate() {
		return tbpUpdateDate;
	}

	public void setTbpUpdateDate(Date tbpUpdateDate) {
		this.tbpUpdateDate = tbpUpdateDate;
	}

	public Integer getTbpUpdateId() {
		return tbpUpdateId;
	}

	public void setTbpUpdateId(Integer tbpUpdateId) {
		this.tbpUpdateId = tbpUpdateId;
	}

	public String getTbpType() {
		return tbpType;
	}

	public void setTbpType(String tbpType) {
		this.tbpType = tbpType;
	}

}