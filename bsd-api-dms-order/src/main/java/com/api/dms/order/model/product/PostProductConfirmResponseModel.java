package com.api.dms.order.model.product;

import com.api.dms.order.model.RequestModel;
import com.api.dms.order.model.ResponseModel;

public class PostProductConfirmResponseModel extends ResponseModel {	
	public PostProductConfirmResponseModel(RequestModel requestModel) {
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
