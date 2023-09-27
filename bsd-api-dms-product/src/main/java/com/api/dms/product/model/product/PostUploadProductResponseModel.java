package com.api.dms.product.model.product;

import com.api.dms.product.model.ResponseModel;

public class PostUploadProductResponseModel extends ResponseModel {
	
	public PostUploadProductResponseModel(PostUploadProductRequestModel requestModel) {
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
