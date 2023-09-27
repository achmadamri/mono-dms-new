package com.api.dms.product.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.product.db.entity.TbUserBrand;

public interface TbUserBrandRepository extends JpaRepository<TbUserBrand, Integer> {
}