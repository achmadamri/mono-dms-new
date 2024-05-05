package com.api.dms.report.model.report;

import java.util.List;

import com.api.dms.report.db.entity.TbProductMarket;
import com.api.dms.report.db.entity.ViewOrder;
import com.api.dms.report.model.ResponseModel;

public class GetDashboardResponseModel extends ResponseModel {
	
	public GetDashboardResponseModel(GetDashboardRequestModel requestModel) {
		super(requestModel);
	}

	private String sku;

	private String amount;

	private String orderPending;

	private String orderDelivered;

	private List<Object[]> lstDailySales;

	private List<Object[]> lstMarketPerformance;

	private List<ViewOrder> lstMarketStats;

	private List<TbProductMarket> lstLowSku;

	private List<ViewOrder> lstTop10SalesByQuantity;

	private List<ViewOrder> lstTop10SalesByValues;

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getOrderPending() {
		return orderPending;
	}

	public void setOrderPending(String orderPending) {
		this.orderPending = orderPending;
	}

	public String getOrderDelivered() {
		return orderDelivered;
	}

	public void setOrderDelivered(String orderDelivered) {
		this.orderDelivered = orderDelivered;
	}

	public List<Object[]> getLstDailySales() {
		return lstDailySales;
	}

	public void setLstDailySales(List<Object[]> lstDailySales) {
		this.lstDailySales = lstDailySales;
	}

	public List<Object[]> getLstMarketPerformance() {
		return lstMarketPerformance;
	}

	public void setLstMarketPerformance(List<Object[]> lstMarketPerformance) {
		this.lstMarketPerformance = lstMarketPerformance;
	}

	public List<ViewOrder> getLstMarketStats() {
		return lstMarketStats;
	}

	public void setLstMarketStats(List<ViewOrder> lstMarketStats) {
		this.lstMarketStats = lstMarketStats;
	}

	public List<TbProductMarket> getLstLowSku() {
		return lstLowSku;
	}

	public void setLstLowSku(List<TbProductMarket> lstLowSku) {
		this.lstLowSku = lstLowSku;
	}

	public List<ViewOrder> getLstTop10SalesByQuantity() {
		return lstTop10SalesByQuantity;
	}

	public void setLstTop10SalesByQuantity(List<ViewOrder> lstTop10SalesByQuantity) {
		this.lstTop10SalesByQuantity = lstTop10SalesByQuantity;
	}

	public List<ViewOrder> getLstTop10SalesByValues() {
		return lstTop10SalesByValues;
	}

	public void setLstTop10SalesByValues(List<ViewOrder> lstTop10SalesByValues) {
		this.lstTop10SalesByValues = lstTop10SalesByValues;
	}
}
