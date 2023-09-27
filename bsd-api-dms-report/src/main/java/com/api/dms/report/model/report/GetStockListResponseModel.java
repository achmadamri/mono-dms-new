package com.api.dms.report.model.report;

import java.util.List;

import com.api.dms.report.db.entity.ViewStock;
import com.api.dms.report.model.ResponseModel;

public class GetStockListResponseModel extends ResponseModel {
	
	public GetStockListResponseModel(GetStockListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<ViewStock> lstViewStock;
	
	private Long length;

	public List<ViewStock> getLstViewStock() {
		return lstViewStock;
	}

	public void setLstViewStock(List<ViewStock> lstViewStock) {
		this.lstViewStock = lstViewStock;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}
}
