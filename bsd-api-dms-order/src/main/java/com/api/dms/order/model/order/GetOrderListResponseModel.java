package com.api.dms.order.model.order;

import java.util.List;

import com.api.dms.order.db.entity.TbOrder;
import com.api.dms.order.model.ResponseModel;

public class GetOrderListResponseModel extends ResponseModel {
	
	public GetOrderListResponseModel(GetOrderListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<TbOrder> lstTbOrder;
	
	private Long length;

	public List<TbOrder> getLstTbOrder() {
		return lstTbOrder;
	}

	public void setLstTbOrder(List<TbOrder> lstTbOrder) {
		this.lstTbOrder = lstTbOrder;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}
}
