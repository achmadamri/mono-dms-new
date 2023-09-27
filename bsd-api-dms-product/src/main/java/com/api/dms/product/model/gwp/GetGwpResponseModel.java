package com.api.dms.product.model.gwp;

import java.util.List;

import com.api.dms.product.db.entity.TbGwp;
import com.api.dms.product.db.entity.TbGwpSku;
import com.api.dms.product.model.ResponseModel;

public class GetGwpResponseModel extends ResponseModel {
	
	public GetGwpResponseModel(GetGwpRequestModel requestModel) {
		super(requestModel);
	}
	
	private TbGwp tbGwp;
	
	private List<TbGwpSku> lstTbGwpSku;

	public TbGwp getTbGwp() {
		return tbGwp;
	}

	public void setTbGwp(TbGwp tbGwp) {
		this.tbGwp = tbGwp;
	}

	public List<TbGwpSku> getLstTbGwpSku() {
		return lstTbGwpSku;
	}

	public void setLstTbGwpSku(List<TbGwpSku> lstTbGwpSku) {
		this.lstTbGwpSku = lstTbGwpSku;
	}
}
