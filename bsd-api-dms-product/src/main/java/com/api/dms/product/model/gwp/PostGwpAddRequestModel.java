package com.api.dms.product.model.gwp;

import javax.validation.constraints.NotNull;

import com.api.dms.product.db.entity.TbGwpSku;
import com.api.dms.product.model.RequestModel;

public class PostGwpAddRequestModel extends RequestModel {
	@NotNull(message = "Sku is not null")
	private String tbgSku;
	
	private TbGwpSku tbGwpSku[];

	public String getTbgSku() {
		return tbgSku;
	}

	public void setTbgSku(String tbgSku) {
		this.tbgSku = tbgSku;
	}

	public TbGwpSku[] getTbGwpSku() {
		return tbGwpSku;
	}

	public void setTbGwpSku(TbGwpSku[] tbGwpSku) {
		this.tbGwpSku = tbGwpSku;
	}
}
