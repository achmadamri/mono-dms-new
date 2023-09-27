package com.api.dms.product.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.product.db.entity.TbProductBundle;

public interface TbProductBundleRepository extends JpaRepository<TbProductBundle, Integer> {
}