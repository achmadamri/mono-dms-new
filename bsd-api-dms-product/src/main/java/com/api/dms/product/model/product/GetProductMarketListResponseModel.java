package com.api.dms.product.model.product;

import java.util.List;

import com.api.dms.product.db.entity.ViewProductMarket;
import com.api.dms.product.model.ResponseModel;

public class GetProductMarketListResponseModel extends ResponseModel {
	
	public GetProductMarketListResponseModel(GetProductMarketListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<ViewProductMarket> lstViewProductMarket;
	
	private Long length;

	public List<ViewProductMarket> getLstViewProductMarket() {
		return lstViewProductMarket;
	}

	public void setLstViewProductMarket(List<ViewProductMarket> lstViewProductMarket) {
		this.lstViewProductMarket = lstViewProductMarket;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}
}
