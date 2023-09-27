package com.api.dms.order.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.order.db.entity.TbOrderPackDetail;

public interface TbOrderPackDetailRepository extends JpaRepository<TbOrderPackDetail, Integer> {
	public final static String StatusPacked = "Packed";
	public final static String StatusAdditionalPacked = "Additional Packed";
	public final static String StatusNotPacked = "Not Packed";
	public final static String StatusDelivered = "Delivered";
	public final static String StatusReturned = "Returned";
	public final static String StatusCompleted = "Completed";

	public final static String TypeProduct = "Product";
	public final static String TypeProductNotOrdered = "Product Not Ordered";
	public final static String TypeGwp = "Gwp";
	public final static String TypeBundle = "Bundle";
	
	public final static String CheckOk = "OK";
	public final static String CheckNotOk = "NOT OK";
	
	public final static String TypeNotPackedOrder = "Order";
	public final static String TypeNotPackedItem = "Item";
}