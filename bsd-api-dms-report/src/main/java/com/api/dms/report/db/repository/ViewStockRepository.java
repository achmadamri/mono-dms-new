package com.api.dms.report.db.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.api.dms.report.db.entity.ViewStock;

public interface ViewStockRepository extends JpaRepository<ViewStock, Integer> {
	@Query("select t from ViewStock t where t.tbmMarketId in :lstTbmMarketId and t.tbmMarketId like %:tbmMarketId% and t.tbpBrand like %:tbpBrand% and (t.tbpSku like :tbpSku% or t.tbpCode like :tbpSku%) and t.tbpItem like %:tbpItem%")
	List<ViewStock> find(@Param("lstTbmMarketId") List<String> lstTbmMarketId, @Param("tbpBrand") String tbpBrand, @Param("tbmMarketId") String tbmMarketId, @Param("tbpSku") String tbpSku, @Param("tbpItem") String tbpItem, Pageable pageable);
	
	@Query("select count(0) from ViewStock t where t.tbmMarketId in :lstTbmMarketId and t.tbmMarketId like %:tbmMarketId% and t.tbpBrand like %:tbpBrand% and (t.tbpSku like :tbpSku% or t.tbpCode like :tbpSku%) and t.tbpItem like %:tbpItem%")
	Long count(@Param("lstTbmMarketId") List<String> lstTbmMarketId, @Param("tbpBrand") String tbpBrand, @Param("tbmMarketId") String tbmMarketId, @Param("tbpSku") String tbpSku, @Param("tbpItem") String tbpItem);
}