package com.api.dms.order.db.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.api.dms.order.db.entity.TbOrder;

public interface TbOrderRepository extends JpaRepository<TbOrder, Integer> {
	public final static String StatusPacked = "Packed";
	public final static String StatusAdditionalPacked = "Additional Packed";
	public final static String StatusNotConfirmed = "Not Confirmed";
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
	


	@Query("select t1 from TbOrder t1 join TbUserMarket t2 on t2.tbmMarket = t1.tboMarket and t2.tbmMarketCheck = 1 and t2.tbuId = :tbuId where t1.tboOrderNo = :tboOrderNo and t1.tboStatus <> 'Not Confirmed'")
	List<TbOrder> findPack(@Param("tbuId") Integer tbuId, @Param("tboOrderNo") String tboOrderNo);

	@Query("select t1 from TbOrder t1 join TbUserMarket t2 on t2.tbmMarket = t1.tboMarket and t2.tbmMarketCheck = 1 and t2.tbuId = :tbuId where t1.tboOrderNo like %:tboOrderNo% and t1.tboStatus like :tboStatus% and t1.tboStatus != 'Completed' and t1.tboCreateDate >= :startDate and t1.tboCreateDate <= :endDate")
	List<TbOrder> find(@Param("tbuId") Integer tbuId, @Param("tboOrderNo") String tboOrderNo, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("tboStatus") String tboStatus, Pageable pageable);
	
	@Query("select count(0) from TbOrder t1 join TbUserMarket t2 on t2.tbmMarket = t1.tboMarket and t2.tbmMarketCheck = 1 and t2.tbuId = :tbuId where t1.tboOrderNo like %:tboOrderNo% and t1.tboStatus like :tboStatus% and t1.tboStatus != 'Completed' and t1.tboCreateDate >= :startDate and t1.tboCreateDate <= :endDate")
	Long count(@Param("tbuId") Integer tbuId, @Param("tboOrderNo") String tboOrderNo, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("tboStatus") String tboStatus);
}