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
 * The persistent class for the tb_brand database table.
 * 
 */
@Entity
@Table(name="tb_brand")
@NamedQuery(name="TbBrand.findAll", query="SELECT t FROM TbBrand t")
public class TbBrand implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tbb_id")
	private Integer tbbId;

	@Column(name="tbb_brand")
	private String tbbBrand;

	@Column(name="tbb_brand_id")
	private String tbbBrandId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbb_create_date")
	private Date tbbCreateDate;

	@Column(name="tbb_create_id")
	private Integer tbbCreateId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbb_update_date")
	private Date tbbUpdateDate;

	@Column(name="tbb_update_id")
	private Integer tbbUpdateId;

	public TbBrand() {
	}

	public Integer getTbbId() {
		return this.tbbId;
	}

	public void setTbbId(Integer tbbId) {
		this.tbbId = tbbId;
	}

	public String getTbbBrand() {
		return this.tbbBrand;
	}

	public void setTbbBrand(String tbbBrand) {
		this.tbbBrand = tbbBrand;
	}

	public String getTbbBrandId() {
		return this.tbbBrandId;
	}

	public void setTbbBrandId(String tbbBrandId) {
		this.tbbBrandId = tbbBrandId;
	}

	public Date getTbbCreateDate() {
		return this.tbbCreateDate;
	}

	public void setTbbCreateDate(Date tbbCreateDate) {
		this.tbbCreateDate = tbbCreateDate;
	}

	public Integer getTbbCreateId() {
		return this.tbbCreateId;
	}

	public void setTbbCreateId(Integer tbbCreateId) {
		this.tbbCreateId = tbbCreateId;
	}

	public Date getTbbUpdateDate() {
		return this.tbbUpdateDate;
	}

	public void setTbbUpdateDate(Date tbbUpdateDate) {
		this.tbbUpdateDate = tbbUpdateDate;
	}

	public Integer getTbbUpdateId() {
		return this.tbbUpdateId;
	}

	public void setTbbUpdateId(Integer tbbUpdateId) {
		this.tbbUpdateId = tbbUpdateId;
	}

}