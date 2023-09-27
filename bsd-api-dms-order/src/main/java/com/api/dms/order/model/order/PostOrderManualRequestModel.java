package com.api.dms.order.model.order;

import javax.validation.constraints.NotNull;

import com.api.dms.order.db.entity.TbOrder;
import com.api.dms.order.model.RequestModel;

public class PostOrderManualRequestModel extends RequestModel {

	@NotNull(message = "Details is not null")
	private String details;
	
	@NotNull(message = "Brand is not null")
	private String tboBrand;
	
	private TbOrder tbOrder[];

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getTboBrand() {
		return tboBrand;
	}

	public void setTboBrand(String tboBrand) {
		this.tboBrand = tboBrand;
	}

	public TbOrder[] getTbOrder() {
		return tbOrder;
	}

	public void setTbOrder(TbOrder[] tbOrder) {
		this.tbOrder = tbOrder;
	}
}
