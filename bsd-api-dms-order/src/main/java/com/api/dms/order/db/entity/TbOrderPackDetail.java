package com.api.dms.order.db.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tb_order_pack_detail database table.
 * 
 */
@Entity
@Table(name="tb_order_pack_detail")
@NamedQuery(name="TbOrderPackDetail.findAll", query="SELECT t FROM TbOrderPackDetail t")
public class TbOrderPackDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tbopd_id")
	private Integer tbopdId;

	@Column(name="tbop_id")
	private Integer tbopId;

	@Column(name="tbopd_brand")
	private String tbopdBrand;

	@Column(name="tbopd_check")
	private String tbopdCheck;

	@Column(name="tbopd_code")
	private String tbopdCode;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbopd_create_date")
	private Date tbopdCreateDate;

	@Column(name="tbopd_create_id")
	private Integer tbopdCreateId;

	@Column(name="tbopd_item")
	private String tbopdItem;

	@Column(name="tbopd_order_no")
	private String tbopdOrderNo;

	@Column(name="tbopd_qty")
	private Integer tbopdQty;

	@Column(name="tbopd_qty_pack")
	private Integer tbopdQtyPack;

	@Column(name="tbopd_sku")
	private String tbopdSku;

	@Column(name="tbopd_sku_additional")
	private String tbopdSkuAdditional;

	@Column(name="tbopd_status")
	private String tbopdStatus;

	@Column(name="tbopd_type")
	private String tbopdType;

	@Column(name="tbopd_type_not_packed")
	private String tbopdTypeNotPacked;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbopd_update_date")
	private Date tbopdUpdateDate;

	@Column(name="tbopd_update_id")
	private Integer tbopdUpdateId;

	public TbOrderPackDetail() {
	}

	public Integer getTbopdId() {
		return this.tbopdId;
	}

	public void setTbopdId(Integer tbopdId) {
		this.tbopdId = tbopdId;
	}

	public Integer getTbopId() {
		return this.tbopId;
	}

	public void setTbopId(Integer tbopId) {
		this.tbopId = tbopId;
	}

	public String getTbopdBrand() {
		return this.tbopdBrand;
	}

	public void setTbopdBrand(String tbopdBrand) {
		this.tbopdBrand = tbopdBrand;
	}

	public String getTbopdCheck() {
		return this.tbopdCheck;
	}

	public void setTbopdCheck(String tbopdCheck) {
		this.tbopdCheck = tbopdCheck;
	}

	public String getTbopdCode() {
		return this.tbopdCode;
	}

	public void setTbopdCode(String tbopdCode) {
		this.tbopdCode = tbopdCode;
	}

	public Date getTbopdCreateDate() {
		return this.tbopdCreateDate;
	}

	public void setTbopdCreateDate(Date tbopdCreateDate) {
		this.tbopdCreateDate = tbopdCreateDate;
	}

	public Integer getTbopdCreateId() {
		return this.tbopdCreateId;
	}

	public void setTbopdCreateId(Integer tbopdCreateId) {
		this.tbopdCreateId = tbopdCreateId;
	}

	public String getTbopdItem() {
		return this.tbopdItem;
	}

	public void setTbopdItem(String tbopdItem) {
		this.tbopdItem = tbopdItem;
	}

	public String getTbopdOrderNo() {
		return this.tbopdOrderNo;
	}

	public void setTbopdOrderNo(String tbopdOrderNo) {
		this.tbopdOrderNo = tbopdOrderNo;
	}

	public Integer getTbopdQty() {
		return this.tbopdQty;
	}

	public void setTbopdQty(Integer tbopdQty) {
		this.tbopdQty = tbopdQty;
	}

	public Integer getTbopdQtyPack() {
		return this.tbopdQtyPack;
	}

	public void setTbopdQtyPack(Integer tbopdQtyPack) {
		this.tbopdQtyPack = tbopdQtyPack;
	}

	public String getTbopdSku() {
		return this.tbopdSku;
	}

	public void setTbopdSku(String tbopdSku) {
		this.tbopdSku = tbopdSku;
	}

	public String getTbopdSkuAdditional() {
		return this.tbopdSkuAdditional;
	}

	public void setTbopdSkuAdditional(String tbopdSkuAdditional) {
		this.tbopdSkuAdditional = tbopdSkuAdditional;
	}

	public String getTbopdStatus() {
		return this.tbopdStatus;
	}

	public void setTbopdStatus(String tbopdStatus) {
		this.tbopdStatus = tbopdStatus;
	}

	public String getTbopdType() {
		return this.tbopdType;
	}

	public void setTbopdType(String tbopdType) {
		this.tbopdType = tbopdType;
	}

	public String getTbopdTypeNotPacked() {
		return this.tbopdTypeNotPacked;
	}

	public void setTbopdTypeNotPacked(String tbopdTypeNotPacked) {
		this.tbopdTypeNotPacked = tbopdTypeNotPacked;
	}

	public Date getTbopdUpdateDate() {
		return this.tbopdUpdateDate;
	}

	public void setTbopdUpdateDate(Date tbopdUpdateDate) {
		this.tbopdUpdateDate = tbopdUpdateDate;
	}

	public Integer getTbopdUpdateId() {
		return this.tbopdUpdateId;
	}

	public void setTbopdUpdateId(Integer tbopdUpdateId) {
		this.tbopdUpdateId = tbopdUpdateId;
	}

}