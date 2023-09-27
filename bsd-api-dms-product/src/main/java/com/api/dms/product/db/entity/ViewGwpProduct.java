package com.api.dms.product.db.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the view_gwp_product database table.
 * 
 */
@Entity
@Table(name="view_gwp_product")
@NamedQuery(name="ViewGwpProduct.findAll", query="SELECT v FROM ViewGwpProduct v")
public class ViewGwpProduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="tbg_id")
	private Integer tbgId;

	@Column(name="tbg_sku")
	private String tbgSku;

	@Column(name="tbp_id")
	private Integer tbpId;

	@Column(name="tbp_item")
	private String tbpItem;

	@Id
	@Column(name="uuid")
	private String uuid;

	@Column(name="tbb_brand_id")
	private String tbbBrandId;

	@Column(name="tbb_brand")
	private String tbbBrand;
	
	@Column(name="tbu_id")
	private Integer tbuId;

	public ViewGwpProduct() {
	}

	public Integer getTbgId() {
		return this.tbgId;
	}

	public void setTbgId(Integer tbgId) {
		this.tbgId = tbgId;
	}

	public String getTbgSku() {
		return this.tbgSku;
	}

	public void setTbgSku(String tbgSku) {
		this.tbgSku = tbgSku;
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

	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
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

	public Integer getTbuId() {
		return tbuId;
	}

	public void setTbuId(Integer tbuId) {
		this.tbuId = tbuId;
	}

}