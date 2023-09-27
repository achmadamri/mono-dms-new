package com.api.dms.order.model.order;

import java.util.List;

import com.api.dms.order.db.entity.TbOrder;
import com.api.dms.order.db.entity.TbOrderPack;
import com.api.dms.order.db.entity.TbOrderPackDetail;
import com.api.dms.order.model.ResponseModel;

public class GetOrderPackResponseModel extends ResponseModel {
	
	public GetOrderPackResponseModel(GetOrderPackRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<TbOrder> lstTbOrder;
	
	private TbOrderPack tbOrderPack;
	
	private List<TbOrderPackDetail> lstTbOrderPackDetail;

	public List<TbOrder> getLstTbOrder() {
		return lstTbOrder;
	}

	public void setLstTbOrder(List<TbOrder> lstTbOrder) {
		this.lstTbOrder = lstTbOrder;
	}

	public TbOrderPack getTbOrderPack() {
		return tbOrderPack;
	}

	public void setTbOrderPack(TbOrderPack tbOrderPack) {
		this.tbOrderPack = tbOrderPack;
	}

	public List<TbOrderPackDetail> getLstTbOrderPackDetail() {
		return lstTbOrderPackDetail;
	}

	public void setLstTbOrderPackDetail(List<TbOrderPackDetail> lstTbOrderPackDetail) {
		this.lstTbOrderPackDetail = lstTbOrderPackDetail;
	}
}
