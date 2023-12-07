package com.api.dms.product.db.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.product.db.entity.ViewProductMarket;

public interface ViewProductMarketRepository extends JpaRepository<ViewProductMarket, Integer> {
	List<ViewProductMarket> findByTbpIdAndTbmMarketIdIn(Integer tbpId, List<String> tbmMarketId, Pageable pageable);

	List<ViewProductMarket> countByTbpIdAndTbmMarketIdIn(Integer tbpId, List<String> tbmMarketId);
}