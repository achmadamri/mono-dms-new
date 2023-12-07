package com.api.dms.order.model.order;

import java.util.List;

import com.api.dms.order.db.entity.ViewOrderConfirm;
import com.api.dms.order.model.ResponseModel;

public class GetOrderConfirmListResponseModel extends ResponseModel {
	
	public GetOrderConfirmListResponseModel(GetOrderConfirmListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<ViewOrderConfirm> lstViewOrderConfirm;
	
	private Long length;

	public List<ViewOrderConfirm> getLstViewOrderConfirm() {
		return lstViewOrderConfirm;
	}

	public void setLstViewOrderConfirm(List<ViewOrderConfirm> lstViewOrderConfirm) {
		this.lstViewOrderConfirm = lstViewOrderConfirm;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}
}
