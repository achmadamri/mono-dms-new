package com.api.dms.order.model.order;

import java.util.List;

import com.api.dms.order.db.entity.ViewOrderConfirm;
import com.api.dms.order.model.ResponseModel;

public class GetOrderConfirmListResponseModel extends ResponseModel {
	
	public GetOrderConfirmListResponseModel(GetOrderConfirmListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<ViewOrderConfirm> lstViewOrderConfirm;
	
	private Long length;
	
	private Long sumAll;
	
	private Long sumPacked;
	
	private Long sumAdditionalPacked;
	
	private Long sumNotPacked;
	
	private Long sumDelivered;
	
	private Long sumNotConfirmed;

	public List<ViewOrderConfirm> getLstViewOrderConfirm() {
		return lstViewOrderConfirm;
	}

	public void setLstViewOrderConfirm(List<ViewOrderConfirm> lstViewOrderConfirm) {
		this.lstViewOrderConfirm = lstViewOrderConfirm;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}

	public Long getSumAll() {
		return sumAll;
	}

	public void setSumAll(Long sumAll) {
		this.sumAll = sumAll;
	}

	public Long getSumPacked() {
		return sumPacked;
	}

	public void setSumPacked(Long sumPacked) {
		this.sumPacked = sumPacked;
	}

	public Long getSumAdditionalPacked() {
		return sumAdditionalPacked;
	}

	public void setSumAdditionalPacked(Long sumAdditionalPacked) {
		this.sumAdditionalPacked = sumAdditionalPacked;
	}

	public Long getSumNotPacked() {
		return sumNotPacked;
	}

	public void setSumNotPacked(Long sumNotPacked) {
		this.sumNotPacked = sumNotPacked;
	}

	public Long getSumDelivered() {
		return sumDelivered;
	}

	public void setSumDelivered(Long sumDelivered) {
		this.sumDelivered = sumDelivered;
	}

	public Long getSumNotConfirmed() {
		return sumNotConfirmed;
	}

	public void setSumNotConfirmed(Long sumNotConfirmed) {
		this.sumNotConfirmed = sumNotConfirmed;
	}
}
