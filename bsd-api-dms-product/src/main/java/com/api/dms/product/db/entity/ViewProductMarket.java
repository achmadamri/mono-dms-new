package com.api.dms.product.db.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the view_product_market database table.
 * 
 */
@Entity
@Table(name="view_product_market")
@NamedQuery(name="ViewProductMarket.findAll", query="SELECT v FROM ViewProductMarket v")
public class ViewProductMarket implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="tbpm_id")
	private Integer tbpmId;

	@Column(name="tbp_id")
	private Integer tbpId;

	@Column(name="tbp_sku")
	private String tbpSku;
	
	@Column(name="tbm_market")
	private String tbmMarket;

	@Column(name="tbpm_qty")
	private Integer tbpmQty;
	
	@Id
	@Column(name="uuid")
	private String uuid;

	public ViewProductMarket() {
	}

	public Integer getTbpmId() {
		return tbpmId;
	}

	public void setTbpmId(Integer tbpmId) {
		this.tbpmId = tbpmId;
	}

	public Integer getTbpId() {
		return tbpId;
	}

	public void setTbpId(Integer tbpId) {
		this.tbpId = tbpId;
	}

	public String getTbpSku() {
		return tbpSku;
	}

	public void setTbpSku(String tbpSku) {
		this.tbpSku = tbpSku;
	}

	public String getTbmMarket() {
		return tbmMarket;
	}

	public void setTbmMarket(String tbmMarket) {
		this.tbmMarket = tbmMarket;
	}

	public Integer getTbpmQty() {
		return tbpmQty;
	}

	public void setTbpmQty(Integer tbpmQty) {
		this.tbpmQty = tbpmQty;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}