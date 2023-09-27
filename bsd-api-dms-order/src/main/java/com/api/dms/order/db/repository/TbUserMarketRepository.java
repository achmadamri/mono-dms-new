package com.api.dms.order.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.order.db.entity.TbUserMarket;

public interface TbUserMarketRepository extends JpaRepository<TbUserMarket, Integer> {
}