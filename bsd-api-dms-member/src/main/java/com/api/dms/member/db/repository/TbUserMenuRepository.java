package com.api.dms.member.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.member.db.entity.TbUserMenu;

public interface TbUserMenuRepository extends JpaRepository<TbUserMenu, Integer> {
}