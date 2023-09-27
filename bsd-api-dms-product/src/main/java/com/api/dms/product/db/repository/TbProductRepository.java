package com.api.dms.product.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.product.db.entity.TbProduct;

public interface TbProductRepository extends JpaRepository<TbProduct, Integer> {
	public final static String Sellable = "Sellable";
	public final static String Gwp = "Gwp";
}