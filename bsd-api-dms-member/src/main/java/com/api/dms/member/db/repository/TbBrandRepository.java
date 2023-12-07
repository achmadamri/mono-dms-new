package com.api.dms.member.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.member.db.entity.TbBrand;

public interface TbBrandRepository extends JpaRepository<TbBrand, Integer> {
}