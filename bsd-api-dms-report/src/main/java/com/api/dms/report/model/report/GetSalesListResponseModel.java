package com.api.dms.report.model.report;

import java.util.List;

import com.api.dms.report.db.entity.ViewSales;
import com.api.dms.report.model.ResponseModel;

public class GetSalesListResponseModel extends ResponseModel {
	
	public GetSalesListResponseModel(GetSalesListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<ViewSales> lstViewSales;
	
	private Long length;

	public List<ViewSales> getLstViewSales() {
		return lstViewSales;
	}

	public void setLstViewSales(List<ViewSales> lstViewSales) {
		this.lstViewSales = lstViewSales;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}
}
