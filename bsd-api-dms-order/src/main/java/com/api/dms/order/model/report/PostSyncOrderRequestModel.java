package com.api.dms.order.model.report;

import java.util.List;

import com.api.dms.order.db.entity.TbOrder;
import com.api.dms.order.model.RequestModel;

public class PostSyncOrderRequestModel extends RequestModel {
	private List<TbOrder> lstTbOrder;

	public List<TbOrder> getLstTbOrder() {
		return lstTbOrder;
	}

	public void setLstTbOrder(List<TbOrder> lstTbOrder) {
		this.lstTbOrder = lstTbOrder;
	}
}
