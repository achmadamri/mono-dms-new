package com.api.dms.order.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.order.db.entity.ViewOrderPack;

public interface ViewOrderPackRepository extends JpaRepository<ViewOrderPack, Integer> {
	public final static String StatusReadyToPack = "Ready to Pack";
	public final static String StatusPacking = "Packing";
	public final static String StatusPacked = "Packed";
	public final static String StatusNotPacked = "Not Packed";
	public final static String StatusAdditionalPacked = "Additional Packed";
	public final static String StatusReturned = "Returned";
	public final static String StatusCancelled = "Cancelled";
}