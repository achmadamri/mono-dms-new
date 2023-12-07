package com.api.dms.report.model.report;

import java.util.List;

import com.api.dms.report.db.entity.TbOrderStatus;
import com.api.dms.report.model.RequestModel;

public class PostSyncOrderStatusRequestModel extends RequestModel {
	private List<TbOrderStatus> lstTbOrderStatus;

	public List<TbOrderStatus> getLstTbOrderStatus() {
		return lstTbOrderStatus;
	}

	public void setLstTbOrderStatus(List<TbOrderStatus> lstTbOrderStatus) {
		this.lstTbOrderStatus = lstTbOrderStatus;
	}
}
