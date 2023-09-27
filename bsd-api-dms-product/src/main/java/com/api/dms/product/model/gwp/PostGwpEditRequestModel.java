package com.api.dms.product.model.gwp;

import javax.validation.constraints.NotNull;

import com.api.dms.product.db.entity.TbGwpSku;
import com.api.dms.product.model.RequestModel;

public class PostGwpEditRequestModel extends RequestModel {
	@NotNull(message = "Id is not null")
	private String tbgId;
	
	@NotNull(message = "Sku is not null")
	private String tbgSku;
	
	private TbGwpSku tbGwpSku[];

	public String getTbgId() {
		return tbgId;
	}

	public void setTbgId(String tbgId) {
		this.tbgId = tbgId;
	}

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
