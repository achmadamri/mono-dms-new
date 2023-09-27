package com.api.dms.product.db.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the view_gwp_sku_product database table.
 * 
 */
@Entity
@Table(name="view_gwp_sku_product")
@NamedQuery(name="ViewGwpSkuProduct.findAll", query="SELECT v FROM ViewGwpSkuProduct v")
public class ViewGwpSkuProduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="tbg_sku")
	private String tbgSku;

	@Column(name="tbg_status")
	private String tbgStatus;

	@Column(name="tbgs_min")
	private BigDecimal tbgsMin;

	@Column(name="tbgs_min_accu")
	private BigDecimal tbgsMinAccu;

	@Column(name="tbgs_qty")
	private Integer tbgsQty;

	@Column(name="tbgs_sku")
	private String tbgsSku;

	@Column(name="tbpg_tbp_brand")
	private String tbpgTbpBrand;

	@Column(name="tbpg_tbp_code")
	private String tbpgTbpCode;

	@Column(name="tbpg_tbp_item")
	private String tbpgTbpItem;

	@Column(name="tbpg_tbp_loc")
	private String tbpgTbpLoc;

	@Column(name="tbpg_tbp_unit_price")
	private BigDecimal tbpgTbpUnitPrice;

	@Column(name="tbpgs_tbp_brand")
	private String tbpgsTbpBrand;

	@Column(name="tbpgs_tbp_code")
	private String tbpgsTbpCode;

	@Column(name="tbpgs_tbp_item")
	private String tbpgsTbpItem;

	@Column(name="tbpgs_tbp_loc")
	private String tbpgsTbpLoc;

	@Column(name="tbpgs_tbp_unit_price")
	private BigDecimal tbpgsTbpUnitPrice;

	@Id
	@Column(name="uuid")
	private String uuid;

	public ViewGwpSkuProduct() {
	}

	public String getTbgSku() {
		return tbgSku;
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

	public BigDecimal getTbgsMin() {
		return tbgsMin;
	}

	public void setTbgsMin(BigDecimal tbgsMin) {
		this.tbgsMin = tbgsMin;
	}

	public BigDecimal getTbgsMinAccu() {
		return tbgsMinAccu;
	}

	public void setTbgsMinAccu(BigDecimal tbgsMinAccu) {
		this.tbgsMinAccu = tbgsMinAccu;
	}

	public Integer getTbgsQty() {
		return tbgsQty;
	}

	public void setTbgsQty(Integer tbgsQty) {
		this.tbgsQty = tbgsQty;
	}

	public String getTbgsSku() {
		return tbgsSku;
	}

	public void setTbgsSku(String tbgsSku) {
		this.tbgsSku = tbgsSku;
	}

	public String getTbpgTbpBrand() {
		return tbpgTbpBrand;
	}

	public void setTbpgTbpBrand(String tbpgTbpBrand) {
		this.tbpgTbpBrand = tbpgTbpBrand;
	}

	public String getTbpgTbpCode() {
		return tbpgTbpCode;
	}

	public void setTbpgTbpCode(String tbpgTbpCode) {
		this.tbpgTbpCode = tbpgTbpCode;
	}

	public String getTbpgTbpItem() {
		return tbpgTbpItem;
	}

	public void setTbpgTbpItem(String tbpgTbpItem) {
		this.tbpgTbpItem = tbpgTbpItem;
	}

	public String getTbpgTbpLoc() {
		return tbpgTbpLoc;
	}

	public void setTbpgTbpLoc(String tbpgTbpLoc) {
		this.tbpgTbpLoc = tbpgTbpLoc;
	}

	public BigDecimal getTbpgTbpUnitPrice() {
		return tbpgTbpUnitPrice;
	}

	public void setTbpgTbpUnitPrice(BigDecimal tbpgTbpUnitPrice) {
		this.tbpgTbpUnitPrice = tbpgTbpUnitPrice;
	}

	public String getTbpgsTbpBrand() {
		return tbpgsTbpBrand;
	}

	public void setTbpgsTbpBrand(String tbpgsTbpBrand) {
		this.tbpgsTbpBrand = tbpgsTbpBrand;
	}

	public String getTbpgsTbpCode() {
		return tbpgsTbpCode;
	}

	public void setTbpgsTbpCode(String tbpgsTbpCode) {
		this.tbpgsTbpCode = tbpgsTbpCode;
	}

	public String getTbpgsTbpItem() {
		return tbpgsTbpItem;
	}

	public void setTbpgsTbpItem(String tbpgsTbpItem) {
		this.tbpgsTbpItem = tbpgsTbpItem;
	}

	public String getTbpgsTbpLoc() {
		return tbpgsTbpLoc;
	}

	public void setTbpgsTbpLoc(String tbpgsTbpLoc) {
		this.tbpgsTbpLoc = tbpgsTbpLoc;
	}

	public BigDecimal getTbpgsTbpUnitPrice() {
		return tbpgsTbpUnitPrice;
	}

	public void setTbpgsTbpUnitPrice(BigDecimal tbpgsTbpUnitPrice) {
		this.tbpgsTbpUnitPrice = tbpgsTbpUnitPrice;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}