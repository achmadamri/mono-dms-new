package com.api.dms.order.db.entity;

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
 * The persistent class for the view_order_confirm database table.
 * 
 */
@Entity
@Table(name="view_order_confirm")
@NamedQuery(name="ViewOrderConfirm.findAll", query="SELECT v FROM ViewOrderConfirm v")
public class ViewOrderConfirm implements Serializable {
	private static final long serialVersionUID = 1L;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	private String item;

	@Column(name="order_no")
	private String orderNo;

	@Column(name="order_qty")
	private Integer orderQty;

	@Column(name="pack_qty")
	private Integer packQty;

	@Column(name="packing_pic")
	private String packingPic;

	@Column(name="sku")
	private String sku;

	@Column(name="code")
	private String code;

	@Column(name="status")
	private String status;

	@Column(name="type")
	private String type;

	@Column(name="type_not_packed")
	private String typeNotPacked;

	@Column(name="brand")
	private String brand;

	@Column(name="market")
	private String market;

	@Column(name="awb")
	private String awb;

	@Id
	@Column(name="uuid")
	private String uuid;

	@Column(name="tbu_id")
	private Integer tbuId;

	@Column(name="tbo_id")
	private Integer tboId;

	public ViewOrderConfirm() {
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(Integer orderQty) {
		this.orderQty = orderQty;
	}

	public Integer getPackQty() {
		return packQty;
	}

	public void setPackQty(Integer packQty) {
		this.packQty = packQty;
	}

	public String getPackingPic() {
		return packingPic;
	}

	public void setPackingPic(String packingPic) {
		this.packingPic = packingPic;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTypeNotPacked() {
		return typeNotPacked;
	}

	public void setTypeNotPacked(String typeNotPacked) {
		this.typeNotPacked = typeNotPacked;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getMarket() {
		return market;
	}

	public void setMarket(String market) {
		this.market = market;
	}

	public String getAwb() {
		return awb;
	}

	public void setAwb(String awb) {
		this.awb = awb;
	}

	public String getUuid() {
		return uuid;
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

	public Integer getTboId() {
		return tboId;
	}

	public void setTboId(Integer tboId) {
		this.tboId = tboId;
	}

}