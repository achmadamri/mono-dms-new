package com.api.dms.member.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.member.db.entity.TbUserMarket;

public interface TbUserMarketRepository extends JpaRepository<TbUserMarket, Integer> {
}