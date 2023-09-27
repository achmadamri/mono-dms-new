package com.api.dms.order.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.order.db.entity.TbBrand;

public interface TbBrandRepository extends JpaRepository<TbBrand, Integer> {
}