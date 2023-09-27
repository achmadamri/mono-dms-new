package com.api.dms.order.model.order;

import com.api.dms.order.db.entity.TbOrder;
import com.api.dms.order.db.entity.TbOrderPack;
import com.api.dms.order.db.entity.TbOrderPackDetail;
import com.api.dms.order.model.ResponseModel;

public class PostScanBarcodeResponseModel extends ResponseModel {

	public PostScanBarcodeResponseModel(PostScanBarcodeRequestModel requestModel) {
		super(requestModel);
	}
	
	private TbOrder tbOrder;
	
	private TbOrderPack tbOrderPack;
	
	private TbOrderPackDetail tbOrderPackDetail;

	public TbOrder getTbOrder() {
		return tbOrder;
	}

	public void setTbOrder(TbOrder tbOrder) {
		this.tbOrder = tbOrder;
	}

	public TbOrderPack getTbOrderPack() {
		return tbOrderPack;
	}

	public void setTbOrderPack(TbOrderPack tbOrderPack) {
		this.tbOrderPack = tbOrderPack;
	}

	public TbOrderPackDetail getTbOrderPackDetail() {
		return tbOrderPackDetail;
	}

	public void setTbOrderPackDetail(TbOrderPackDetail tbOrderPackDetail) {
		this.tbOrderPackDetail = tbOrderPackDetail;
	}
}
