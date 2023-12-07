package com.api.dms.order.model.order;

import java.math.BigDecimal;

import javax.validation.constraints.NotNull;

import com.api.dms.order.model.RequestModel;

public class PostOrderEditRequestModel extends RequestModel {
	@NotNull(message = "Id is not null")
	private String tboId;
	
	@NotNull(message = "Address1 is not null")
	private String tboAddress1;

	@NotNull(message = "Address2 is not null")
	private String tboAddress2;

	@NotNull(message = "Address3 is not null")
	private String tboAddress3;

	@NotNull(message = "Address4 is not null")
	private String tboAddress4;

	@NotNull(message = "Address5 is not null")
	private String tboAddress5;

	@NotNull(message = "Awb is not null")
	private String tboAwb;

	@NotNull(message = "Brand is not null")
	private String tboBrand;

	@NotNull(message = "Code is not null")
	private String tboCode;

	@NotNull(message = "Diskon From Market is not null")
	private BigDecimal tboDiskonFromMarket;

	@NotNull(message = "Diskon Total is not null")
	private BigDecimal tboDiskonTotal;

	@NotNull(message = "Hp is not null")
	private String tboHp;

	@NotNull(message = "Item is not null")
	private String tboItem;

	@NotNull(message = "Loc is not null")
	private String tboLoc;

	@NotNull(message = "Market is not null")
	private String tboMarketId;

	@NotNull(message = "Max Seq is not null")
	private Integer tboMaxSeq;

	@NotNull(message = "Name is not null")
	private String tboName;

	@NotNull(message = "Order No is not null")
	private String tboOrderNo;

	@NotNull(message = "Order Sq is not null")
	private String tboOrderSq;

	@NotNull(message = "Order Sum is not null")
	private BigDecimal tboOrderSum;

	@NotNull(message = "Paid Total is not null")
	private BigDecimal tboPaidTotal;

	@NotNull(message = "Qc Id is not null")
	private Integer tboQcId;

	@NotNull(message = "Qty is not null")
	private Integer tboQty;

	@NotNull(message = "Row is not null")
	private Integer tboRow;

	@NotNull(message = "Seq is not null")
	private Integer tboSeq;

	@NotNull(message = "Sku is not null")
	private String tboSku;

	@NotNull(message = "Unit Price is not null")
	private BigDecimal tboUnitPrice;

	private String tboNotes;

	public String getTboId() {
		return tboId;
	}

	public void setTboId(String tboId) {
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

	public String getTboMarketId() {
		return tboMarketId;
	}

	public void setTboMarketId(String tboMarketId) {
		this.tboMarketId = tboMarketId;
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

	public String getTboNotes() {
		return tboNotes;
	}

	public void setTboNotes(String tboNotes) {
		this.tboNotes = tboNotes;
	}
}
