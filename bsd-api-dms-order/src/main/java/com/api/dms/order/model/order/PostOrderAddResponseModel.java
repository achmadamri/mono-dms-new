package com.api.dms.order.model.order;

import com.api.dms.order.db.entity.TbOrder;
import com.api.dms.order.model.ResponseModel;

public class PostOrderAddResponseModel extends ResponseModel {

	public PostOrderAddResponseModel(PostOrderAddRequestModel requestModel) {
		super(requestModel);
	}

	private TbOrder tbOrder;

	public TbOrder getTbOrder() {
		return tbOrder;
	}

	public void setTbOrder(TbOrder tbOrder) {
		this.tbOrder = tbOrder;
	}
}
