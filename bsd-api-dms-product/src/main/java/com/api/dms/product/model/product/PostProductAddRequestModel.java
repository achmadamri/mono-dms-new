package com.api.dms.product.model.product;

import java.math.BigDecimal;

import javax.validation.constraints.NotNull;

import com.api.dms.product.model.RequestModel;

public class PostProductAddRequestModel extends RequestModel {	
	@NotNull(message = "Brand is not null")
	private String tbbBrandId;
	
	@NotNull(message = "Sku is not null")
	private String tbpSku;
	
	@NotNull(message = "Item is not null")
	private String tbpItem;
	
	@NotNull(message = "Code is not null")
	private String tbpCode;
	
	@NotNull(message = "Loc is not null")
	private String tbpLoc;
	
	@NotNull(message = "Quantity is not null")
	private Integer tbpQty;

	@NotNull(message = "Unit Price is not null")
	private BigDecimal tbpUnitPrice;
	
	@NotNull(message = "Type is not null")
	private String tbpType;

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
