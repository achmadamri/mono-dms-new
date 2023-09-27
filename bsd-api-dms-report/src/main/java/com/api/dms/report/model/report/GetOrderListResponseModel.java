package com.api.dms.report.model.report;

import java.util.List;

import com.api.dms.report.db.entity.ViewOrder;
import com.api.dms.report.model.ResponseModel;

public class GetOrderListResponseModel extends ResponseModel {
	
	public GetOrderListResponseModel(GetOrderListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<ViewOrder> lstViewOrder;
	
	private Long length;

	public List<ViewOrder> getLstViewOrder() {
		return lstViewOrder;
	}

	public void setLstViewOrder(List<ViewOrder> lstViewOrder) {
		this.lstViewOrder = lstViewOrder;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}
}
