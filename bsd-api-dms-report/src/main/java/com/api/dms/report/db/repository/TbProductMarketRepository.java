package com.api.dms.report.db.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.api.dms.report.db.entity.TbProductMarket;

public interface TbProductMarketRepository extends JpaRepository<TbProductMarket, Integer> {
    @Query("SELECT t FROM TbProductMarket t WHERE t.tbpmQty < 5 OR t.tbpmQty is null AND t.tbmMarketId in :tbmMarketId GROUP BY t.tbpSku")
    List<TbProductMarket> dashboardLowSku(@Param("tbmMarketId") List<String> tbmMarketId);
}