package com.api.dms.order.model.order;

import javax.validation.constraints.NotNull;

import com.api.dms.order.model.RequestModel;

public class PostChangePackedRequestModel extends RequestModel {
	@NotNull(message = "Order No is not null")
	private String tboOrderNo;
	
	@NotNull(message = "Sku is not null")
	private String tbpSku;

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
}
