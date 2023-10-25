package com.api.dms.order.db.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the view_order_pack database table.
 * 
 */
@Entity
@Table(name="view_order_pack")
@NamedQuery(name="ViewOrderPack.findAll", query="SELECT v FROM ViewOrderPack v")
public class ViewOrderPack implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="tbo_awb")
	private String tboAwb;

	@Column(name="tbo_brand")
	private String tboBrand;

	@Column(name="tbo_market")
	private String tboMarket;

	@Column(name="tbo_frontliner")
	private String tboFrontliner;

	@Column(name="tbo_name")
	private String tboName;

	@Column(name="tbo_order_no")
	private String tboOrderNo;

	@Column(name="tbo_qc_id")
	private Integer tboQcId;

	@Column(name="tbu_id")
	private Integer tbuId;

	@Id
	@Column(name="uuid")
	private String uuid;

	public ViewOrderPack() {
	}

	public String getTboAwb() {
		return this.tboAwb;
	}

	public void setTboAwb(String tboAwb) {
		this.tboAwb = tboAwb;
	}

	public String getTboBrand() {
		return this.tboBrand;
	}

	public void setTboBrand(String tboBrand) {
		this.tboBrand = tboBrand;
	}

	public String getTboMarket() {
		return this.tboMarket;
	}

	public void setTboMarket(String tboMarket) {
		this.tboMarket = tboMarket;
	}

	public String getTboFrontliner() {
		return tboFrontliner;
	}

	public void setTboFrontliner(String tboFrontliner) {
		this.tboFrontliner = tboFrontliner;
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

	public Integer getTboQcId() {
		return this.tboQcId;
	}

	public void setTboQcId(Integer tboQcId) {
		this.tboQcId = tboQcId;
	}

	public Integer getTbuId() {
		return tbuId;
	}

	public void setTbuId(Integer tbuId) {
		this.tbuId = tbuId;
	}

	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}