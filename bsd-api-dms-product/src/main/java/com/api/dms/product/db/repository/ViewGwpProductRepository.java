package com.api.dms.product.db.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.api.dms.product.db.entity.ViewGwpProduct;

public interface ViewGwpProductRepository extends JpaRepository<ViewGwpProduct, Integer> {
	@Query("select t from ViewGwpProduct t where t.tbuId = :tbuId and t.tbbBrandId like :brand% and t.tbgSku like %:sku% and t.tbpItem like %:item%")
	List<ViewGwpProduct> findAllByTbuId(@Param("tbuId") Integer tbuId, @Param("brand") String brand, @Param("sku") String sku, @Param("item") String item, Pageable pageable);

	@Query("select count(0) from ViewGwpProduct t where t.tbuId = :tbuId and t.tbbBrandId like :brand% and t.tbgSku like %:sku% and t.tbpItem like %:item%")
	Long countAllByTbuId(@Param("tbuId") Integer tbuId, @Param("brand") String brand, @Param("sku") String sku, @Param("item") String item);
}