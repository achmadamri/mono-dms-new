package com.api.dms.order.model.order;

import java.util.List;

import com.api.dms.order.model.RequestModel;

public class PostOrderAddsRequestModel extends RequestModel {
	private List<PostOrderAddRequestModel> lstPostOrderAddRequestModel;

	public List<PostOrderAddRequestModel> getLstPostOrderAddRequestModel() {
		return lstPostOrderAddRequestModel;
	}

	public void setLstPostOrderAddRequestModel(List<PostOrderAddRequestModel> lstPostOrderAddRequestModel) {
		this.lstPostOrderAddRequestModel = lstPostOrderAddRequestModel;
	}
}
