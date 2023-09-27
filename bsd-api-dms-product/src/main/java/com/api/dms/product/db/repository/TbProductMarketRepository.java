package com.api.dms.product.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.product.db.entity.TbProductMarket;

public interface TbProductMarketRepository extends JpaRepository<TbProductMarket, Integer> {
}