package com.api.dms.member.db.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the view_user_brand database table.
 * 
 */
@Entity
@Table(name="view_user_brand")
@NamedQuery(name="ViewUserBrand.findAll", query="SELECT v FROM ViewUserBrand v")
public class ViewUserBrand implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="tbb_brand")
	private String tbbBrand;

	@Column(name="tbb_brand_check")
	private Integer tbbBrandCheck;

	@Column(name="tbb_brand_id")
	private String tbbBrandId;

	@Column(name="tbu_email")
	private String tbuEmail;

	@Column(name="tbu_firstname")
	private String tbuFirstname;

	@Column(name="tbu_id")
	private Integer tbuId;

	@Column(name="tbu_lastname")
	private String tbuLastname;

	@Id
	private String uuid;

	public ViewUserBrand() {
	}

	public String getTbbBrand() {
		return this.tbbBrand;
	}

	public void setTbbBrand(String tbbBrand) {
		this.tbbBrand = tbbBrand;
	}

	public Integer getTbbBrandCheck() {
		return this.tbbBrandCheck;
	}

	public void setTbbBrandCheck(Integer tbbBrandCheck) {
		this.tbbBrandCheck = tbbBrandCheck;
	}

	public String getTbbBrandId() {
		return this.tbbBrandId;
	}

	public void setTbbBrandId(String tbbBrandId) {
		this.tbbBrandId = tbbBrandId;
	}

	public String getTbuEmail() {
		return this.tbuEmail;
	}

	public void setTbuEmail(String tbuEmail) {
		this.tbuEmail = tbuEmail;
	}

	public String getTbuFirstname() {
		return this.tbuFirstname;
	}

	public void setTbuFirstname(String tbuFirstname) {
		this.tbuFirstname = tbuFirstname;
	}

	public Integer getTbuId() {
		return this.tbuId;
	}

	public void setTbuId(Integer tbuId) {
		this.tbuId = tbuId;
	}

	public String getTbuLastname() {
		return this.tbuLastname;
	}

	public void setTbuLastname(String tbuLastname) {
		this.tbuLastname = tbuLastname;
	}

	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

}