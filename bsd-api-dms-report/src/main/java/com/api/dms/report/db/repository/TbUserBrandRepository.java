package com.api.dms.report.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.report.db.entity.TbUserBrand;

public interface TbUserBrandRepository extends JpaRepository<TbUserBrand, Integer> {
}