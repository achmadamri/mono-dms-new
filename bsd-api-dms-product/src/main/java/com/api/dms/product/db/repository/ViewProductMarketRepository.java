package com.api.dms.product.db.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.api.dms.product.db.entity.ViewProductMarket;

public interface ViewProductMarketRepository extends JpaRepository<ViewProductMarket, Integer> {
    
	@Query("select t from ViewProductMarket t where t.tbpId = :tbpId")
	List<ViewProductMarket> findAllByTbpSku(@Param("tbpId") Integer tbpId, Pageable pageable);

	@Query("select count(0) from ViewProductMarket t where t.tbpId = :tbpId")
	Long countAllByTbpSku(@Param("tbpId") Integer tbpId);
}