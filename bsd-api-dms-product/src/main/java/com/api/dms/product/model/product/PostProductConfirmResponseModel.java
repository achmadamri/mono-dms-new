package com.api.dms.product.model.product;

import com.api.dms.product.db.entity.TbProduct;
import com.api.dms.product.model.ResponseModel;

public class PostProductConfirmResponseModel extends ResponseModel {

	public PostProductConfirmResponseModel(PostProductConfirmRequestModel requestModel) {
		super(requestModel);
	}

	private TbProduct tbProduct;

	public TbProduct getTbProduct() {
		return tbProduct;
	}

	public void setTbProduct(TbProduct tbProduct) {
		this.tbProduct = tbProduct;
	}
}
