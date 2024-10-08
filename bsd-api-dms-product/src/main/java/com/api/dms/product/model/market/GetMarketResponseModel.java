package com.api.dms.product.model.market;

import com.api.dms.product.db.entity.TbMarket;
import com.api.dms.product.model.ResponseModel;

public class GetMarketResponseModel extends ResponseModel {
	
	public GetMarketResponseModel(GetMarketRequestModel requestModel) {
		super(requestModel);
	}
	
	private TbMarket tbMarket;

	public TbMarket getTbMarket() {
		return tbMarket;
	}

	public void setTbMarket(TbMarket tbMarket) {
		this.tbMarket = tbMarket;
	}
}
