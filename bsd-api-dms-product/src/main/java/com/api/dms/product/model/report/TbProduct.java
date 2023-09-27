package com.api.dms.product.model.report;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


public class TbProduct implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer tbpId;

	private String tbbBrandId;

	private String tbbBrand;

	private String tbpCode;

	private Date tbpCreateDate;

	private Integer tbpCreateId;

	private String tbpItem;

	private String tbpLoc;

	private Integer tbpQty;

	private String tbpSku;

	private String tbpStatus;

	private BigDecimal tbpUnitPrice;

	private Date tbpUpdateDate;

	private Integer tbpUpdateId;

	private String tbpType;
	
	private List<TbProductMarket> lstTbProductMarket;

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

	public List<TbProductMarket> getLstTbProductMarket() {
		return lstTbProductMarket;
	}

	public void setLstTbProductMarket(List<TbProductMarket> lstTbProductMarket) {
		this.lstTbProductMarket = lstTbProductMarket;
	}

}