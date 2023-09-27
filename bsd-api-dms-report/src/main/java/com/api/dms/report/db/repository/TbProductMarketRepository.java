package com.api.dms.report.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.report.db.entity.TbProductMarket;

public interface TbProductMarketRepository extends JpaRepository<TbProductMarket, Integer> {
}