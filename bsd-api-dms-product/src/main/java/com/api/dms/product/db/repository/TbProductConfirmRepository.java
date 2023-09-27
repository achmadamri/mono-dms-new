package com.api.dms.product.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.product.db.entity.TbProductConfirm;

public interface TbProductConfirmRepository extends JpaRepository<TbProductConfirm, Integer> {
}