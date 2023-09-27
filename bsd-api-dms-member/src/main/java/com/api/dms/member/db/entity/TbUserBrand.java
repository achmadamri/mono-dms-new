package com.api.dms.member.db.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the tb_user_brand database table.
 * 
 */
@Entity
@Table(name="tb_user_brand")
@NamedQuery(name="TbUserBrand.findAll", query="SELECT t FROM TbUserBrand t")
public class TbUserBrand implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="tbub_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer tbubId;

	@Column(name="tbb_brand")
	private String tbbBrand;

	@Column(name="tbb_brand_check")
	private Integer tbbBrandCheck;

	@Column(name="tbb_brand_id")
	private String tbbBrandId;

	@Column(name="tbu_id")
	private Integer tbuId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbub_create_date")
	private Date tbubCreateDate;

	@Column(name="tbub_create_id")
	private Integer tbubCreateId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbub_update_date")
	private Date tbubUpdateDate;

	@Column(name="tbub_update_id")
	private Integer tbubUpdateId;

	public TbUserBrand() {
	}

	public Integer getTbubId() {
		return this.tbubId;
	}

	public void setTbubId(Integer tbubId) {
		this.tbubId = tbubId;
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

	public Integer getTbuId() {
		return this.tbuId;
	}

	public void setTbuId(Integer tbuId) {
		this.tbuId = tbuId;
	}

	public Date getTbubCreateDate() {
		return this.tbubCreateDate;
	}

	public void setTbubCreateDate(Date tbubCreateDate) {
		this.tbubCreateDate = tbubCreateDate;
	}

	public Integer getTbubCreateId() {
		return this.tbubCreateId;
	}

	public void setTbubCreateId(Integer tbubCreateId) {
		this.tbubCreateId = tbubCreateId;
	}

	public Date getTbubUpdateDate() {
		return this.tbubUpdateDate;
	}

	public void setTbubUpdateDate(Date tbubUpdateDate) {
		this.tbubUpdateDate = tbubUpdateDate;
	}

	public Integer getTbubUpdateId() {
		return this.tbubUpdateId;
	}

	public void setTbubUpdateId(Integer tbubUpdateId) {
		this.tbubUpdateId = tbubUpdateId;
	}

}