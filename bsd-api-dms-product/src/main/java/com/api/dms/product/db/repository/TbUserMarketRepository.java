package com.api.dms.product.db.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.product.db.entity.TbUserMarket;

public interface TbUserMarketRepository extends JpaRepository<TbUserMarket, Integer> {
}