package com.api.dms.member.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.api.dms.member.db.entity.TbUser;

public interface TbUserRepository extends JpaRepository<TbUser, Integer> {
	public final static String Created = "created";
	public final static String NeedConfirmation = "need confirmation";
	public final static String Active = "active";
	public final static String NonActive = "non active";
}