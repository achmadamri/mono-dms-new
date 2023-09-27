package com.api.dms.order.model.order;

import javax.validation.constraints.NotNull;

import com.api.dms.order.model.RequestModel;

public class PostScanBarcodeRequestModel extends RequestModel {
	@NotNull(message = "Order No is not null")
	private String tboOrderNo;
	
	@NotNull(message = "Sku is not null")
	private String tbpSku;
	
	@NotNull(message = "Add new is not null")
	private String addNew;

	public String getTboOrderNo() {
		return tboOrderNo;
	}

	public void setTboOrderNo(String tboOrderNo) {
		this.tboOrderNo = tboOrderNo;
	}

	public String getTbpSku() {
		return tbpSku;
	}

	public void setTbpSku(String tbpSku) {
		this.tbpSku = tbpSku;
	}

	public String getAddNew() {
		return addNew;
	}

	public void setAddNew(String addNew) {
		this.addNew = addNew;
	}
}
