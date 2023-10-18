package com.api.dms.report.model.report;

import java.util.List;

import com.api.dms.report.db.entity.TbOrder;
import com.api.dms.report.model.RequestModel;

public class PostSyncConfirmOrderRequestModel extends RequestModel {
	private List<TbOrder> lstTbOrder;

	public List<TbOrder> getLstTbOrder() {
		return lstTbOrder;
	}

	public void setLstTbOrder(List<TbOrder> lstTbOrder) {
		this.lstTbOrder = lstTbOrder;
	}
}
