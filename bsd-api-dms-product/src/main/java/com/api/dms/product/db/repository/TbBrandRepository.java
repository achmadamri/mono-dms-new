package com.api.dms.product.db.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.api.dms.product.db.entity.TbBrand;

public interface TbBrandRepository extends JpaRepository<TbBrand, Integer> {
	@Query("SELECT t FROM TbBrand t JOIN TbUserBrand tt ON tt.tbbBrandId = t.tbbBrandId WHERE tt.tbuId = :tbuId and tt.tbbBrandCheck = 1 order by t.tbbBrandId")	
	List<TbBrand> findAllByTbuId(Integer tbuId);
}