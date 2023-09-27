package com.api.dms.product.db.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the view_brand_product database table.
 * 
 */
@Entity
@Table(name="view_brand_product")
@NamedQuery(name="ViewBrandProduct.findAll", query="SELECT v FROM ViewBrandProduct v")
public class ViewBrandProduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="tbb_brand")
	private String tbbBrand;

	@Column(name="tbb_brand_id")
	private String tbbBrandId;

	@Column(name="tbb_id")
	private Integer tbbId;

	@Column(name="tbp_code")
	private String tbpCode;

	@Column(name="tbp_id")
	private Integer tbpId;

	@Column(name="tbp_item")
	private String tbpItem;

	@Column(name="tbp_loc")
	private String tbpLoc;

	@Column(name="tbp_qty")
	private Integer tbpQty;

	@Column(name="tbp_sku")
	private String tbpSku;

	@Column(name="tbp_unit_price")
	private BigDecimal tbpUnitPrice;

	@Column(name="tbp_type")
	private String tbpType;
	
	@Id
	@Column(name="uuid")
	private String uuid;

	@Column(name="tbu_id")
	private Integer tbuId;

	public ViewBrandProduct() {
	}

	public String getTbbBrand() {
		return this.tbbBrand;
	}

	public void setTbbBrand(String tbbBrand) {
		this.tbbBrand = tbbBrand;
	}

	public String getTbbBrandId() {
		return this.tbbBrandId;
	}

	public void setTbbBrandId(String tbbBrandId) {
		this.tbbBrandId = tbbBrandId;
	}

	public Integer getTbbId() {
		return this.tbbId;
	}

	public void setTbbId(Integer tbbId) {
		this.tbbId = tbbId;
	}

	public String getTbpCode() {
		return this.tbpCode;
	}

	public void setTbpCode(String tbpCode) {
		this.tbpCode = tbpCode;
	}

	public Integer getTbpId() {
		return this.tbpId;
	}

	public void setTbpId(Integer tbpId) {
		this.tbpId = tbpId;
	}

	public String getTbpItem() {
		return this.tbpItem;
	}

	public void setTbpItem(String tbpItem) {
		this.tbpItem = tbpItem;
	}

	public String getTbpLoc() {
		return this.tbpLoc;
	}

	public void setTbpLoc(String tbpLoc) {
		this.tbpLoc = tbpLoc;
	}

	public Integer getTbpQty() {
		return this.tbpQty;
	}

	public void setTbpQty(Integer tbpQty) {
		this.tbpQty = tbpQty;
	}

	public String getTbpSku() {
		return this.tbpSku;
	}

	public void setTbpSku(String tbpSku) {
		this.tbpSku = tbpSku;
	}

	public BigDecimal getTbpUnitPrice() {
		return this.tbpUnitPrice;
	}

	public void setTbpUnitPrice(BigDecimal tbpUnitPrice) {
		this.tbpUnitPrice = tbpUnitPrice;
	}

	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getTbpType() {
		return tbpType;
	}

	public void setTbpType(String tbpType) {
		this.tbpType = tbpType;
	}

	public Integer getTbuId() {
		return tbuId;
	}

	public void setTbuId(Integer tbuId) {
		this.tbuId = tbuId;
	}

}