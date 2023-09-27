package com.api.dms.order.model.order;

import java.util.List;

import com.api.dms.order.db.entity.TbOrderPackDetail;
import com.api.dms.order.model.RequestModel;

public class PostOrderQcRequestModel extends RequestModel {
	private String tbopOrderNo;
	
	private List<TbOrderPackDetail> lstTbOrderPackDetail;

	public String getTbopOrderNo() {
		return tbopOrderNo;
	}

	public void setTbopOrderNo(String tbopOrderNo) {
		this.tbopOrderNo = tbopOrderNo;
	}

	public List<TbOrderPackDetail> getLstTbOrderPackDetail() {
		return lstTbOrderPackDetail;
	}

	public void setLstTbOrderPackDetail(List<TbOrderPackDetail> lstTbOrderPackDetail) {
		this.lstTbOrderPackDetail = lstTbOrderPackDetail;
	}
}
