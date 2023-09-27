package com.api.dms.member.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.member.db.entity.TbUserBrand;

public interface TbUserBrandRepository extends JpaRepository<TbUserBrand, Integer> {
}