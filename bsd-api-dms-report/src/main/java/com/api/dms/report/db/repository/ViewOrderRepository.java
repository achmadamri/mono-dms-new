package com.api.dms.report.db.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.api.dms.report.db.entity.ViewOrder;

public interface ViewOrderRepository extends JpaRepository<ViewOrder, Integer> {
	@Query("select t from ViewOrder t where t.tbuId = :tbuId and t.tboMarketId in :lstTboMarketId and t.tboMarketId like %:tboMarketId% and t.tboFrontliner like %:tboFrontliner% and t.tboBrand like %:tboBrand% and t.tboOrderNo like %:tboOrderNo% and t.tboSku like %:tboSku% and t.tboItem like %:tboItem% and t.tboName like %:tboName% and t.tboCreateDate >= :startDate and t.tboCreateDate <= :endDate")
	List<ViewOrder> find(@Param("tbuId") Integer tbuId, @Param("lstTboMarketId") List<String> lstTboMarketId, @Param("tboBrand") String tboBrand, @Param("tboMarketId") String tboMarketId, @Param("tboFrontliner") String tboFrontliner, @Param("tboOrderNo") String tboOrderNo, @Param("tboSku") String tboSku, @Param("tboItem") String tboItem, @Param("tboName") String tboName, @Param("startDate") Date startDate, @Param("endDate") Date endDate, Pageable pageable);
	
	@Query("select count(0) from ViewOrder t where t.tbuId = :tbuId and t.tboMarketId in :lstTboMarketId and t.tboMarketId like %:tboMarketId% and t.tboFrontliner like %:tboFrontliner% and t.tboBrand like %:tboBrand% and t.tboOrderNo like %:tboOrderNo% and t.tboSku like %:tboSku% and t.tboItem like %:tboItem% and t.tboName like %:tboName% and t.tboCreateDate >= :startDate and t.tboCreateDate <= :endDate")
	Long count(@Param("tbuId") Integer tbuId, @Param("lstTboMarketId") List<String> lstTboMarketId, @Param("tboBrand") String tboBrand, @Param("tboMarketId") String tboMarketId, @Param("tboFrontliner") String tboFrontliner, @Param("tboOrderNo") String tboOrderNo, @Param("tboSku") String tboSku, @Param("tboItem") String tboItem, @Param("tboName") String tboName, @Param("startDate") Date startDate, @Param("endDate") Date endDate);

	@Query("SELECT SUM(t.tboOrderSum) FROM ViewOrder t WHERE t.tbuId = :tbuId and t.tboMarketId in :tboMarketId AND DATE(t.tboCreateDate) = :tboCreateDate")
	Long dashboardCountAmount(@Param("tbuId") Integer tbuId, @Param("tboMarketId") List<String> tboMarketId, @Param("tboCreateDate") Date tboCreateDate);

	@Query("SELECT COUNT(t.tboOrderNo) FROM ViewOrder t WHERE t.tbuId = :tbuId and t.tboMarketId in :tboMarketId AND DATE(t.tboCreateDate) = :tboCreateDate and tbo_status = 'Packed'")
	Long dashboardCountOrderPacked(@Param("tbuId") Integer tbuId, @Param("tboMarketId") List<String> tboMarketId, @Param("tboCreateDate") Date tboCreateDate);

	@Query("SELECT COUNT(t.tboOrderNo) FROM ViewOrder t WHERE t.tboMarketId in :tboMarketId AND DATE(t.tboCreateDate) = :tboCreateDate and tbo_status = 'Delivered'")
	Long dashboardCountOrderDelivered(@Param("tboMarketId") List<String> tboMarketId, @Param("tboCreateDate") Date tboCreateDate);

	@Query("SELECT t FROM ViewOrder t WHERE t.tbuId = :tbuId and t.tboMarketId in :tboMarketId AND DATE(t.tboCreateDate) = :tboCreateDate")
	List<ViewOrder> dashboardMarketStats(@Param("tbuId") Integer tbuId, @Param("tboMarketId") List<String> tboMarketId, @Param("tboCreateDate") Date tboCreateDate);

	@Query("SELECT DATE(t.tboCreateDate) as tboCreateDate, COUNT(t.tboCreateDate) as tboOrderSum " +
           "FROM ViewOrder t " +
           "WHERE DATE(t.tboCreateDate) >= :startDate " +
           "GROUP BY DATE(t.tboCreateDate)")
    List<Object[]> dashboardDailySales(@Param("startDate") Date startDate);

	@Query("SELECT DATE(t.tboCreateDate) as tboCreateDate, SUM(t.tboOrderSum / 1000) as tboOrderSum " +
           "FROM ViewOrder t " +
           "WHERE DATE(t.tboCreateDate) >= :startDate " +
           "GROUP BY DATE(t.tboCreateDate)")
    List<Object[]> dashboardMarketPerformance(@Param("startDate") Date startDate);

	@Query("SELECT v.tboFrontliner " +
           "FROM ViewOrder v " +
           "WHERE v.tbuId = :tbuId and v.tboMarketId in :tboMarketId " +
           "GROUP BY v.tboMarketId, v.tboFrontliner")
    List<Object[]> reportFrontliner(@Param("tbuId") Integer tbuId, @Param("tboMarketId") List<String> tboMarketId);

	@Query("SELECT t " +
           "FROM ViewOrder t " +
           "WHERE DATE(t.tboCreateDate) >= :startDate " +
           "ORDER BY t.tboQty DESC")
    List<ViewOrder> top10SalesByQuantity(@Param("startDate") Date startDate, Pageable pageable);

	@Query("SELECT t " +
           "FROM ViewOrder t " +
           "WHERE DATE(t.tboCreateDate) >= :startDate " +
           "ORDER BY t.tboOrderSum DESC")
    List<ViewOrder> top10SalesByValues(@Param("startDate") Date startDate, Pageable pageable);
}