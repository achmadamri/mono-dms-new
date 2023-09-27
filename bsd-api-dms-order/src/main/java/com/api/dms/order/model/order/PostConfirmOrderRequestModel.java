package com.api.dms.order.model.order;

import com.api.dms.order.model.RequestModel;

public class PostConfirmOrderRequestModel extends RequestModel {
	private String[] orderNo;

	private String[] sku;

	public String[] getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String[] orderNo) {
		this.orderNo = orderNo;
	}

	public String[] getSku() {
		return sku;
	}

	public void setSku(String[] sku) {
		this.sku = sku;
	}
}
