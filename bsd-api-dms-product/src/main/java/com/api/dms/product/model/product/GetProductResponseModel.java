package com.api.dms.product.model.product;

import java.util.List;

import com.api.dms.product.db.entity.TbProduct;
import com.api.dms.product.db.entity.TbProductBundle;
import com.api.dms.product.db.entity.ViewGwpSkuProduct;
import com.api.dms.product.model.ResponseModel;

public class GetProductResponseModel extends ResponseModel {
	
	public GetProductResponseModel(GetProductRequestModel requestModel) {
		super(requestModel);
	}
	
	private TbProduct tbProduct;
	
	private List<ViewGwpSkuProduct> lstViewGwpSkuProduct;
	
	private List<TbProductBundle> lstTbProductBundle;

	public TbProduct getTbProduct() {
		return tbProduct;
	}

	public void setTbProduct(TbProduct tbProduct) {
		this.tbProduct = tbProduct;
	}

	public List<ViewGwpSkuProduct> getLstViewGwpSkuProduct() {
		return lstViewGwpSkuProduct;
	}

	public void setLstViewGwpSkuProduct(List<ViewGwpSkuProduct> lstViewGwpSkuProduct) {
		this.lstViewGwpSkuProduct = lstViewGwpSkuProduct;
	}

	public List<TbProductBundle> getLstTbProductBundle() {
		return lstTbProductBundle;
	}

	public void setLstTbProductBundle(List<TbProductBundle> lstTbProductBundle) {
		this.lstTbProductBundle = lstTbProductBundle;
	}
}
