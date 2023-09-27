package com.api.dms.product.model.market;

import java.util.List;

import com.api.dms.product.db.entity.TbMarket;
import com.api.dms.product.model.ResponseModel;

public class GetMarketListResponseModel extends ResponseModel {
	
	public GetMarketListResponseModel(GetMarketListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<TbMarket> lstTbMarket;
	
	private Long length;

	public List<TbMarket> getLstTbMarket() {
		return lstTbMarket;
	}

	public void setLstTbMarket(List<TbMarket> lstTbMarket) {
		this.lstTbMarket = lstTbMarket;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}
}
