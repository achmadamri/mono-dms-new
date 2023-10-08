package com.api.dms.report.model.report;

import java.util.List;

import com.api.dms.report.db.entity.ViewOrder;
import com.api.dms.report.model.ResponseModel;

public class GetDashboardResponseModel extends ResponseModel {
	
	public GetDashboardResponseModel(GetDashboardRequestModel requestModel) {
		super(requestModel);
	}

	private String sku;

	private String revenue;

	private String orderPending;

	private String orderDelivered;

	private List<ViewOrder> listDailySales;

	private List<ViewOrder> listTeamPerformance;

	private List<ViewOrder> listMarketStats;

	private List<ViewOrder> listLowSku;

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getRevenue() {
		return revenue;
	}

	public void setRevenue(String revenue) {
		this.revenue = revenue;
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

	public List<ViewOrder> getListDailySales() {
		return listDailySales;
	}

	public void setListDailySales(List<ViewOrder> listDailySales) {
		this.listDailySales = listDailySales;
	}

	public List<ViewOrder> getListTeamPerformance() {
		return listTeamPerformance;
	}

	public void setListTeamPerformance(List<ViewOrder> listTeamPerformance) {
		this.listTeamPerformance = listTeamPerformance;
	}

	public List<ViewOrder> getListMarketStats() {
		return listMarketStats;
	}

	public void setListMarketStats(List<ViewOrder> listMarketStats) {
		this.listMarketStats = listMarketStats;
	}

	public List<ViewOrder> getListLowSku() {
		return listLowSku;
	}

	public void setListLowSku(List<ViewOrder> listLowSku) {
		this.listLowSku = listLowSku;
	}
}
