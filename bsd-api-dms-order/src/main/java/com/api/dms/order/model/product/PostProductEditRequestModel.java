package com.api.dms.order.model.product;

import java.math.BigDecimal;

import com.api.dms.order.model.RequestModel;

public class PostProductEditRequestModel extends RequestModel {
	private String tbpId;
	
	private String tbbBrandId;
	
	private String tbpSku;
	
	private String tbpItem;
	
	private String tbpCode;
	
	private String tbpLoc;
	
	private Integer tbpQty;

	private BigDecimal tbpUnitPrice;
	
	private String tbpType;

	public String getTbpId() {
		return tbpId;
	}

	public void setTbpId(String tbpId) {
		this.tbpId = tbpId;
	}

	public String getTbbBrandId() {
		return tbbBrandId;
	}

	public void setTbbBrandId(String tbbBrandId) {
		this.tbbBrandId = tbbBrandId;
	}

	public String getTbpSku() {
		return tbpSku;
	}

	public void setTbpSku(String tbpSku) {
		this.tbpSku = tbpSku;
	}

	public String getTbpItem() {
		return tbpItem;
	}

	public void setTbpItem(String tbpItem) {
		this.tbpItem = tbpItem;
	}

	public String getTbpCode() {
		return tbpCode;
	}

	public void setTbpCode(String tbpCode) {
		this.tbpCode = tbpCode;
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

	public BigDecimal getTbpUnitPrice() {
		return tbpUnitPrice;
	}

	public void setTbpUnitPrice(BigDecimal tbpUnitPrice) {
		this.tbpUnitPrice = tbpUnitPrice;
	}

	public String getTbpType() {
		return tbpType;
	}

	public void setTbpType(String tbpType) {
		this.tbpType = tbpType;
	}
}
