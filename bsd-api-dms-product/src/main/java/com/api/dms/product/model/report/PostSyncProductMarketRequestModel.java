package com.api.dms.product.model.report;

import java.util.List;

import com.api.dms.product.model.RequestModel;

public class PostSyncProductMarketRequestModel extends RequestModel {
	private List<TbProductMarket> lstTbProductMarket;

	public List<TbProductMarket> getLstTbProductMarket() {
		return lstTbProductMarket;
	}

	public void setLstTbProductMarket(List<TbProductMarket> lstTbProductMarket) {
		this.lstTbProductMarket = lstTbProductMarket;
	}	
}
