package com.api.dms.report.model.report;

import java.util.List;

import com.api.dms.report.model.RequestModel;

public class PostSyncProductMarketRequestModel extends RequestModel {
	private List<TbProductMarket> lstTbProductMarket;

	public List<TbProductMarket> getLstTbProductMarket() {
		return lstTbProductMarket;
	}

	public void setLstTbProductMarket(List<TbProductMarket> lstTbProductMarket) {
		this.lstTbProductMarket = lstTbProductMarket;
	}	
}
