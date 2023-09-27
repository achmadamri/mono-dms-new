package com.api.dms.order.model.order;

import com.api.dms.order.model.ResponseModel;

public class GetScanBarcodeCheckResponseModel extends ResponseModel {
	
	public GetScanBarcodeCheckResponseModel(GetScanBarcodeCheckRequestModel requestModel) {
		super(requestModel);
	}
	
	private String orderStatus = "";
	
	private int qtyTbo = 0;
	
	private int qtyTbopd = 0;

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getQtyTbo() {
		return qtyTbo;
	}

	public void setQtyTbo(int qtyTbo) {
		this.qtyTbo = qtyTbo;
	}

	public int getQtyTbopd() {
		return qtyTbopd;
	}

	public void setQtyTbopd(int qtyTbopd) {
		this.qtyTbopd = qtyTbopd;
	}
	
}
