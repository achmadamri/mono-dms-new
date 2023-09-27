package com.api.dms.order.model.order;

import java.util.List;

import com.api.dms.order.db.entity.ViewOrderPack;
import com.api.dms.order.model.ResponseModel;

public class GetOrderPackListResponseModel extends ResponseModel {
	
	public GetOrderPackListResponseModel(GetOrderPackListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<ViewOrderPack> lstViewOrderPack;
	
	private Long length;

	public List<ViewOrderPack> getLstViewOrderPack() {
		return lstViewOrderPack;
	}

	public void setLstViewOrderPack(List<ViewOrderPack> lstViewOrderPack) {
		this.lstViewOrderPack = lstViewOrderPack;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}
}
