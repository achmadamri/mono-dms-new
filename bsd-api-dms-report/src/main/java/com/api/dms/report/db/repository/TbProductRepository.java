package com.api.dms.report.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.report.db.entity.TbProduct;

public interface TbProductRepository extends JpaRepository<TbProduct, Integer> {
	public final static String Sellable = "Sellable";
	public final static String Gwp = "Gwp";

	// Count records where tbpQty < 5
    long countByTbpQtyLessThan(int qty);
}