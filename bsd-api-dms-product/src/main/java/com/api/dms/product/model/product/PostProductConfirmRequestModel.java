package com.api.dms.product.model.product;

import javax.validation.constraints.NotNull;

import com.api.dms.product.model.RequestModel;

public class PostProductConfirmRequestModel extends RequestModel {
	@NotNull(message = "Order No is not null")
	private String tbpcOrderNo;
	
	@NotNull(message = "Sku is not null")
	private String tbpcSku;
	
	@NotNull(message = "Quantity is not null")
	private Integer tbpcQty;

	public String getTbpcOrderNo() {
		return tbpcOrderNo;
	}

	public void setTbpcOrderNo(String tbpcOrderNo) {
		this.tbpcOrderNo = tbpcOrderNo;
	}

	public String getTbpcSku() {
		return tbpcSku;
	}

	public void setTbpcSku(String tbpcSku) {
		this.tbpcSku = tbpcSku;
	}

	public Integer getTbpcQty() {
		return tbpcQty;
	}

	public void setTbpcQty(Integer tbpcQty) {
		this.tbpcQty = tbpcQty;
	}
}
