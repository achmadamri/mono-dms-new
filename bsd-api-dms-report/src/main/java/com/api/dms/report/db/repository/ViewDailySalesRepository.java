package com.api.dms.report.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.report.db.entity.ViewDailySales;

public interface ViewDailySalesRepository extends JpaRepository<ViewDailySales, Integer> {
}