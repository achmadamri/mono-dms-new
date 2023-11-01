package com.api.dms.report.db.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.api.dms.report.db.entity.ViewOrder;

public interface ViewOrderRepository extends JpaRepository<ViewOrder, Integer> {
	@Query("select t from ViewOrder t where t.tboMarketId in :tboMarketId and t.tboBrand like %:tboBrand% and t.tboOrderNo like %:tboOrderNo% and t.tboCreateDate >= :startDate and t.tboCreateDate <= :endDate")
	List<ViewOrder> find(@Param("tboMarketId") List<String> tboMarketId, @Param("tboBrand") String tboBrand, @Param("tboOrderNo") String tboOrderNo, @Param("startDate") Date startDate, @Param("endDate") Date endDate, Pageable pageable);
	
	@Query("select count(0) from ViewOrder t where t.tboMarketId in :tboMarketId and  t.tboBrand like %:tboBrand% and t.tboOrderNo like %:tboOrderNo% and t.tboCreateDate >= :startDate and t.tboCreateDate <= :endDate")
	Long count(@Param("tboMarketId") List<String> tboMarketId, @Param("tboBrand") String tboBrand, @Param("tboOrderNo") String tboOrderNo, @Param("startDate") Date startDate, @Param("endDate") Date endDate);

	@Query("SELECT SUM(t.tboOrderSum) FROM ViewOrder t WHERE t.tboMarketId in :tboMarketId AND DATE(t.tboCreateDate) = :tboCreateDate")
	Long dashboardCountRevenue(@Param("tboMarketId") List<String> tboMarketId, @Param("tboCreateDate") Date tboCreateDate);

	@Query("SELECT COUNT(t.tboOrderNo) FROM ViewOrder t WHERE t.tboMarketId in :tboMarketId AND DATE(t.tboCreateDate) = :tboCreateDate and tbo_status = 'Packed'")
	Long dashboardCountOrderPacked(@Param("tboMarketId") List<String> tboMarketId, @Param("tboCreateDate") Date tboCreateDate);

	@Query("SELECT COUNT(t.tboOrderNo) FROM ViewOrder t WHERE t.tboMarketId in :tboMarketId AND DATE(t.tboCreateDate) = :tboCreateDate and tbo_status = 'Delivered'")
	Long dashboardCountOrderDelivered(@Param("tboMarketId") List<String> tboMarketId, @Param("tboCreateDate") Date tboCreateDate);

	@Query("SELECT t FROM ViewOrder t WHERE t.tboMarketId in :tboMarketId AND DATE(t.tboCreateDate) = :tboCreateDate")
	List<ViewOrder> dashboardMarketStats(@Param("tboMarketId") List<String> tboMarketId, @Param("tboCreateDate") Date tboCreateDate);
}