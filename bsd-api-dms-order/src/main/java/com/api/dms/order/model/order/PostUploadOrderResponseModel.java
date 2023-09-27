package com.api.dms.order.model.order;

import com.api.dms.order.model.ResponseModel;

public class PostUploadOrderResponseModel extends ResponseModel {
	
	public PostUploadOrderResponseModel(PostUploadOrderRequestModel requestModel) {
		super(requestModel);
	}
	
	private String fileName;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
