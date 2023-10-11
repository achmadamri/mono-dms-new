package com.api.dms.product.model.product;

import com.api.dms.product.db.entity.TbProductMarket;
import com.api.dms.product.model.ResponseModel;

public class PostProductConfirmResponseModel extends ResponseModel {

	public PostProductConfirmResponseModel(PostProductConfirmRequestModel requestModel) {
		super(requestModel);
	}

	private TbProductMarket tbProductMarket;

	public TbProductMarket getTbProductMarket() {
		return tbProductMarket;
	}

	public void setTbProductMarket(TbProductMarket tbProductMarket) {
		this.tbProductMarket = tbProductMarket;
	}
}
