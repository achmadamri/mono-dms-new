package com.api.dms.report.model.report;

import java.util.List;

import com.api.dms.report.db.entity.TbUserMarket;
import com.api.dms.report.model.ResponseModel;

public class GetReportResponseModel extends ResponseModel {
	
	public GetReportResponseModel(GetReportRequestModel requestModel) {
		super(requestModel);
	}

	private List<TbUserMarket> lstTbUserMarket;

	private List<Object[]> lstFrontliner;

	public List<TbUserMarket> getLstTbUserMarket() {
		return lstTbUserMarket;
	}

	public void setLstTbUserMarket(List<TbUserMarket> lstTbUserMarket) {
		this.lstTbUserMarket = lstTbUserMarket;
	}

	public List<Object[]> getLstFrontliner() {
		return lstFrontliner;
	}

	public void setLstFrontliner(List<Object[]> lstFrontliner) {
		this.lstFrontliner = lstFrontliner;
	}
}
