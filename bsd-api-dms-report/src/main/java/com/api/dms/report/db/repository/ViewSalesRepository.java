package com.api.dms.report.db.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.api.dms.report.db.entity.ViewSales;

public interface ViewSalesRepository extends JpaRepository<ViewSales, Integer> {
	@Query("select t from ViewSales t where t.tbuId = :tbuId and t.tboBrand like %:tboBrand% and t.tboOrderNo like %:tboOrderNo% and (t.tboSku like %:tboSku% or t.tboCode like %:tboSku%) and t.tboCreateDate >= :startDate and t.tboCreateDate <= :endDate")
	List<ViewSales> find(@Param("tbuId") Integer tbuId, @Param("tboBrand") String tboBrand, @Param("tboOrderNo") String tboOrderNo, @Param("tboSku") String tboSku, @Param("startDate") Date startDate, @Param("endDate") Date endDate, Pageable pageable);
	
	@Query("select count(0) from ViewSales t where t.tbuId = :tbuId and t.tboBrand like %:tboBrand% and t.tboOrderNo like %:tboOrderNo% and (t.tboSku like %:tboSku% or t.tboCode like %:tboSku%) and t.tboCreateDate >= :startDate and t.tboCreateDate <= :endDate")
	Long count(@Param("tbuId") Integer tbuId, @Param("tboBrand") String tboBrand, @Param("tboOrderNo") String tboOrderNo, @Param("tboSku") String tboSku, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
}