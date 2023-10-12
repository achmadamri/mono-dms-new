package com.api.dms.order.model.product;

import com.api.dms.order.model.RequestModel;

public class PostProductConfirmRequestModel extends RequestModel {
	private String tbpcOrderNo;
	
	private String tbpcSku;
	
	private Integer tbpcQty;

	private String tbpcMarket;

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

	public String getTbpcMarket() {
		return tbpcMarket;
	}

	public void setTbpcMarket(String tbpcMarket) {
		this.tbpcMarket = tbpcMarket;
	}
}
