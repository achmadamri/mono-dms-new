package com.api.dms.product.db.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.api.dms.product.db.entity.ViewBrandProduct;

public interface ViewBrandProductRepository extends JpaRepository<ViewBrandProduct, Integer> {
	@Query("select t from ViewBrandProduct t where t.tbuId = :tbuId and t.tbbBrandId like %:brand% and t.tbpSku like %:sku% and t.tbpItem like %:item% and t.tbpCode like %:code% and t.tbpType like %:type%")
	List<ViewBrandProduct> findAllByTbuId(@Param("tbuId") Integer tbuId, @Param("brand") String brand, @Param("sku") String sku, @Param("item") String item, @Param("code") String code, @Param("type") String type, Pageable pageable);

	@Query("select count(0) from ViewBrandProduct t where t.tbuId = :tbuId and t.tbbBrandId like %:brand% and t.tbpSku like %:sku% and t.tbpItem like %:item% and t.tbpCode like %:code% and t.tbpType like %:type%")
	Long countAllByTbuId(@Param("tbuId") Integer tbuId, @Param("brand") String brand, @Param("sku") String sku, @Param("item") String item, @Param("code") String code, @Param("type") String type);
}