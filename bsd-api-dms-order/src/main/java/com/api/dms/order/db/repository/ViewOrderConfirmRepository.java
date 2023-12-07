package com.api.dms.order.db.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.api.dms.order.db.entity.ViewOrderConfirm;

public interface ViewOrderConfirmRepository extends JpaRepository<ViewOrderConfirm, Integer> {
	public final static String StatusReadyToPack = "Ready to Pack";
	public final static String StatusPacking = "Packing";
	public final static String StatusPacked = "Packed";
	public final static String StatusNotPacked = "Not Packed";
	public final static String StatusAdditionalPacked = "Additional Packed";
	public final static String StatusReturned = "Returned";
	public final static String StatusCancelled = "Cancelled";

	@Query("select t from ViewOrderConfirm t join TbUserMarket t2 on t2.tbmMarketId = t.market and t2.tbmMarketCheck = 1 and t2.tbuId = :tbuId where t.tbuId = :tbuId and t.orderNo like %:orderNo% and (t.sku like :sku% or t.code like :sku%) and status like :status% and status != 'Completed' and type like :type% and brand like :brand% and t.createDate >= :startDate and t.createDate <= :endDate")
	List<ViewOrderConfirm> find(@Param("tbuId") Integer tbuId, @Param("orderNo") String orderNo, @Param("sku") String sku, @Param("status") String status, @Param("type") String type, @Param("brand") String brand, @Param("startDate") Date startDate, @Param("endDate") Date endDate, Pageable pageable);
	
	@Query("select count(0) from ViewOrderConfirm t join TbUserMarket t2 on t2.tbmMarketId = t.market and t2.tbmMarketCheck = 1 and t2.tbuId = :tbuId where t.tbuId = :tbuId and t.orderNo like %:orderNo% and (t.sku like :sku% or t.code like :sku%) and status like :status% and status != 'Completed' and type like :type% and brand like :brand% and t.createDate >= :startDate and t.createDate <= :endDate")
	Long count(@Param("tbuId") Integer tbuId, @Param("orderNo") String orderNo, @Param("sku") String sku, @Param("status") String status, @Param("type") String type, @Param("brand") String brand, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
}