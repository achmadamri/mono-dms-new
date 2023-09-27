package com.api.dms.product.model.product;

import com.api.dms.product.model.ResponseModel;

public class PostUploadProductBundleResponseModel extends ResponseModel {
	
	public PostUploadProductBundleResponseModel(PostUploadProductBundleRequestModel requestModel) {
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
