package com.api.dms.product.model.product;

import com.api.dms.product.db.entity.TbProduct;
import com.api.dms.product.model.ResponseModel;

public class PostProductAddResponseModel extends ResponseModel {

	public PostProductAddResponseModel(PostProductAddRequestModel requestModel) {
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
