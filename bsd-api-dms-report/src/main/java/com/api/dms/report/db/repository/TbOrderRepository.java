package com.api.dms.report.db.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.api.dms.report.db.entity.TbOrder;

public interface TbOrderRepository extends JpaRepository<TbOrder, Integer> {
	public final static String StatusPacked = "Packed";
	public final static String StatusAdditionalPacked = "Additional Packed";
	public final static String StatusNotPacked = "Not Packed";
	public final static String StatusDelivered = "Delivered";
	public final static String StatusReturned = "Returned";
	public final static String StatusCompleted = "Completed";
	
	public final static String TypeOrder = "Order";
	public final static String TypeManualStockOut = "Manual Stock Out";
	
	public final static String TypeNotPackedOrder = "Order";
	public final static String TypeNotPackedItem = "Item";
	
	public final static String CheckOk = "OK";
	public final static String CheckNotOk = "NOT OK";

	@Query("select t from TbOrder t where t.tboOrderNo like %:tboOrderNo% and t.tboStatus like :tboStatus% and t.tboStatus != 'Completed' and t.tboCreateDate >= :startDate and t.tboCreateDate <= :endDate")
	List<TbOrder> find(@Param("tboOrderNo") String tboOrderNo, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("tboStatus") String tboStatus, Pageable pageable);
	
	@Query("select count(0) from TbOrder t where t.tboOrderNo like %:tboOrderNo% and t.tboStatus like :tboStatus% and t.tboStatus != 'Completed' and t.tboCreateDate >= :startDate and t.tboCreateDate <= :endDate")
	Long count(@Param("tboOrderNo") String tboOrderNo, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("tboStatus") String tboStatus);
}