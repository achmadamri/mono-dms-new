package com.api.dms.product.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.product.db.entity.TbGwp;

public interface TbGwpRepository extends JpaRepository<TbGwp, Integer> {
	public final static String Active = "active";
	public final static String NonActive = "non active";
}