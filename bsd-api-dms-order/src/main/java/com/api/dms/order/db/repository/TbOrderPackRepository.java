package com.api.dms.order.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.order.db.entity.TbOrderPack;

public interface TbOrderPackRepository extends JpaRepository<TbOrderPack, Integer> {
	public final static String StatusPacked = "Packed";
	public final static String StatusAdditionalPacked = "Additional Packed";
	public final static String StatusNotPacked = "Not Packed";
	public final static String StatusDelivered = "Delivered";
	public final static String StatusReturned = "Returned";
	public final static String StatusCompleted = "Completed";
	
	public final static String TypeOrder = "Order";
	public final static String TypeManualStockOut = "Manual Stock Out";
}