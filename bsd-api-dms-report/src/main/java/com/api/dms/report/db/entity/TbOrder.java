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
 * The persistent class for the tb_order database table.
 * 
 */
@Entity
@Table(name="tb_order")
@NamedQuery(name="TbOrder.findAll", query="SELECT t FROM TbOrder t")
public class TbOrder implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="tbo_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer tboId;

	@Column(name="tbo_address1")
	private String tboAddress1;

	@Column(name="tbo_address2")
	private String tboAddress2;

	@Column(name="tbo_address3")
	private String tboAddress3;

	@Column(name="tbo_address4")
	private String tboAddress4;

	@Column(name="tbo_address5")
	private String tboAddress5;

	@Column(name="tbo_awb")
	private String tboAwb;

	@Column(name="tbo_brand")
	private String tboBrand;

	@Column(name="tbo_code")
	private String tboCode;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbo_create_date")
	private Date tboCreateDate;

	@Column(name="tbo_create_id")
	private Integer tboCreateId;

	@Column(name="tbo_diskon_from_market")
	private BigDecimal tboDiskonFromMarket;

	@Column(name="tbo_diskon_total")
	private BigDecimal tboDiskonTotal;

	@Column(name="tbo_full_address")
	private String tboFullAddress;

	@Column(name="tbo_hp")
	private String tboHp;

	@Column(name="tbo_item")
	private String tboItem;

	@Column(name="tbo_loc")
	private String tboLoc;

	@Column(name="tbo_market")
	private String tboMarket;

	@Column(name="tbo_max_seq")
	private Integer tboMaxSeq;

	@Column(name="tbo_name")
	private String tboName;

	@Column(name="tbo_order_no")
	private String tboOrderNo;

	@Column(name="tbo_order_sq")
	private String tboOrderSq;

	@Column(name="tbo_order_sum")
	private BigDecimal tboOrderSum;

	@Column(name="tbo_paid_total")
	private BigDecimal tboPaidTotal;

	@Column(name="tbo_qc_id")
	private Integer tboQcId;

	@Column(name="tbo_qty")
	private Integer tboQty;

	@Column(name="tbo_row")
	private Integer tboRow;

	@Column(name="tbo_seq")
	private Integer tboSeq;

	@Column(name="tbo_sku")
	private String tboSku;

	@Column(name="tbo_unit_price")
	private BigDecimal tboUnitPrice;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbo_update_date")
	private Date tboUpdateDate;

	@Column(name="tbo_update_id")
	private Integer tboUpdateId;

	@Column(name="tbo_status")
	private String tboStatus;

	@Column(name="tbo_check")
	private String tboCheck;

	@Column(name="tbo_file")
	private String tboFile;

	@Column(name="tbo_notes")
	private String tboNotes;

	@Column(name="tbo_type")
	private String tboType;

	@Column(name="tbo_type_not_packed")
	private String tboTypeNotPacked;

	public TbOrder() {
	}

	public Integer getTboId() {
		return tboId;
	}

	public void setTboId(Integer tboId) {
		this.tboId = tboId;
	}

	public String getTboAddress1() {
		return tboAddress1;
	}

	public void setTboAddress1(String tboAddress1) {
		this.tboAddress1 = tboAddress1;
	}

	public String getTboAddress2() {
		return tboAddress2;
	}

	public void setTboAddress2(String tboAddress2) {
		this.tboAddress2 = tboAddress2;
	}

	public String getTboAddress3() {
		return tboAddress3;
	}

	public void setTboAddress3(String tboAddress3) {
		this.tboAddress3 = tboAddress3;
	}

	public String getTboAddress4() {
		return tboAddress4;
	}

	public void setTboAddress4(String tboAddress4) {
		this.tboAddress4 = tboAddress4;
	}

	public String getTboAddress5() {
		return tboAddress5;
	}

	public void setTboAddress5(String tboAddress5) {
		this.tboAddress5 = tboAddress5;
	}

	public String getTboAwb() {
		return tboAwb;
	}

	public void setTboAwb(String tboAwb) {
		this.tboAwb = tboAwb;
	}

	public String getTboBrand() {
		return tboBrand;
	}

	public void setTboBrand(String tboBrand) {
		this.tboBrand = tboBrand;
	}

	public String getTboCode() {
		return tboCode;
	}

	public void setTboCode(String tboCode) {
		this.tboCode = tboCode;
	}

	public Date getTboCreateDate() {
		return tboCreateDate;
	}

	public void setTboCreateDate(Date tboCreateDate) {
		this.tboCreateDate = tboCreateDate;
	}

	public Integer getTboCreateId() {
		return tboCreateId;
	}

	public void setTboCreateId(Integer tboCreateId) {
		this.tboCreateId = tboCreateId;
	}

	public BigDecimal getTboDiskonFromMarket() {
		return tboDiskonFromMarket;
	}

	public void setTboDiskonFromMarket(BigDecimal tboDiskonFromMarket) {
		this.tboDiskonFromMarket = tboDiskonFromMarket;
	}

	public BigDecimal getTboDiskonTotal() {
		return tboDiskonTotal;
	}

	public void setTboDiskonTotal(BigDecimal tboDiskonTotal) {
		this.tboDiskonTotal = tboDiskonTotal;
	}

	public String getTboFullAddress() {
		return tboFullAddress;
	}

	public void setTboFullAddress(String tboFullAddress) {
		this.tboFullAddress = tboFullAddress;
	}

	public String getTboHp() {
		return tboHp;
	}

	public void setTboHp(String tboHp) {
		this.tboHp = tboHp;
	}

	public String getTboItem() {
		return tboItem;
	}

	public void setTboItem(String tboItem) {
		this.tboItem = tboItem;
	}

	public String getTboLoc() {
		return tboLoc;
	}

	public void setTboLoc(String tboLoc) {
		this.tboLoc = tboLoc;
	}

	public String getTboMarket() {
		return tboMarket;
	}

	public void setTboMarket(String tboMarket) {
		this.tboMarket = tboMarket;
	}

	public Integer getTboMaxSeq() {
		return tboMaxSeq;
	}

	public void setTboMaxSeq(Integer tboMaxSeq) {
		this.tboMaxSeq = tboMaxSeq;
	}

	public String getTboName() {
		return tboName;
	}

	public void setTboName(String tboName) {
		this.tboName = tboName;
	}

	public String getTboOrderNo() {
		return tboOrderNo;
	}

	public void setTboOrderNo(String tboOrderNo) {
		this.tboOrderNo = tboOrderNo;
	}

	public String getTboOrderSq() {
		return tboOrderSq;
	}

	public void setTboOrderSq(String tboOrderSq) {
		this.tboOrderSq = tboOrderSq;
	}

	public BigDecimal getTboOrderSum() {
		return tboOrderSum;
	}

	public void setTboOrderSum(BigDecimal tboOrderSum) {
		this.tboOrderSum = tboOrderSum;
	}

	public BigDecimal getTboPaidTotal() {
		return tboPaidTotal;
	}

	public void setTboPaidTotal(BigDecimal tboPaidTotal) {
		this.tboPaidTotal = tboPaidTotal;
	}

	public Integer getTboQcId() {
		return tboQcId;
	}

	public void setTboQcId(Integer tboQcId) {
		this.tboQcId = tboQcId;
	}

	public Integer getTboQty() {
		return tboQty;
	}

	public void setTboQty(Integer tboQty) {
		this.tboQty = tboQty;
	}

	public Integer getTboRow() {
		return tboRow;
	}

	public void setTboRow(Integer tboRow) {
		this.tboRow = tboRow;
	}

	public Integer getTboSeq() {
		return tboSeq;
	}

	public void setTboSeq(Integer tboSeq) {
		this.tboSeq = tboSeq;
	}

	public String getTboSku() {
		return tboSku;
	}

	public void setTboSku(String tboSku) {
		this.tboSku = tboSku;
	}

	public BigDecimal getTboUnitPrice() {
		return tboUnitPrice;
	}

	public void setTboUnitPrice(BigDecimal tboUnitPrice) {
		this.tboUnitPrice = tboUnitPrice;
	}

	public Date getTboUpdateDate() {
		return tboUpdateDate;
	}

	public void setTboUpdateDate(Date tboUpdateDate) {
		this.tboUpdateDate = tboUpdateDate;
	}

	public Integer getTboUpdateId() {
		return tboUpdateId;
	}

	public void setTboUpdateId(Integer tboUpdateId) {
		this.tboUpdateId = tboUpdateId;
	}

	public String getTboStatus() {
		return tboStatus;
	}

	public void setTboStatus(String tboStatus) {
		this.tboStatus = tboStatus;
	}

	public String getTboCheck() {
		return tboCheck;
	}

	public void setTboCheck(String tboCheck) {
		this.tboCheck = tboCheck;
	}

	public String getTboFile() {
		return tboFile;
	}

	public void setTboFile(String tboFile) {
		this.tboFile = tboFile;
	}

	public String getTboNotes() {
		return tboNotes;
	}

	public void setTboNotes(String tboNotes) {
		this.tboNotes = tboNotes;
	}

	public String getTboType() {
		return tboType;
	}

	public void setTboType(String tboType) {
		this.tboType = tboType;
	}

	public String getTboTypeNotPacked() {
		return tboTypeNotPacked;
	}

	public void setTboTypeNotPacked(String tboTypeNotPacked) {
		this.tboTypeNotPacked = tboTypeNotPacked;
	}

}