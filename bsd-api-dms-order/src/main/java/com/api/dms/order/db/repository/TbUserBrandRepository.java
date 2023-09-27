package com.api.dms.order.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.order.db.entity.TbUserBrand;

public interface TbUserBrandRepository extends JpaRepository<TbUserBrand, Integer> {
}