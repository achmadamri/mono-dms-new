package com.api.dms.order.model.order;

import com.api.dms.order.db.entity.TbOrderPackDetail;
import com.api.dms.order.model.ResponseModel;

public class PostChangePackedResponseModel extends ResponseModel {

	public PostChangePackedResponseModel(PostChangePackedRequestModel requestModel) {
		super(requestModel);
	}
	
	private TbOrderPackDetail tbOrderPackDetail;

	public TbOrderPackDetail getTbOrderPackDetail() {
		return tbOrderPackDetail;
	}

	public void setTbOrderPackDetail(TbOrderPackDetail tbOrderPackDetail) {
		this.tbOrderPackDetail = tbOrderPackDetail;
	}
}
