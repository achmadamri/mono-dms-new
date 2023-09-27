package com.api.dms.product.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.product.db.entity.TbMarket;

public interface TbMarketRepository extends JpaRepository<TbMarket, Integer> {
	public final static String PRINCIPAL = "PRINCIPAL";
	public final static String DISTRIBUTOR = "DISTRIBUTOR";
	public final static String SUBDIST = "SUBDIST";
	public final static String GROSIR = "GROSIR";
}