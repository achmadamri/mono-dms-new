package com.api.dms.order.model.order;

import java.util.ArrayList;
import java.util.List;

import com.api.dms.order.model.ResponseModel;

public class PostOrderAddsResponseModel extends ResponseModel {

	public PostOrderAddsResponseModel(PostOrderAddsRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<PostOrderAddResponseModel> lstPostOrderAddResponseModel = new ArrayList<PostOrderAddResponseModel>();

	public List<PostOrderAddResponseModel> getLstPostOrderAddResponseModel() {
		return lstPostOrderAddResponseModel;
	}

	public void setLstPostOrderAddResponseModel(List<PostOrderAddResponseModel> lstPostOrderAddResponseModel) {
		this.lstPostOrderAddResponseModel = lstPostOrderAddResponseModel;
	}
}
