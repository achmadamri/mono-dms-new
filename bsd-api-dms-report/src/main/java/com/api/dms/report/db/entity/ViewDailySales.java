package com.api.dms.report.db.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the view_daily_sales database table.
 * 
 */
@Entity
@Table(name="view_daily_sales")
@NamedQuery(name="ViewDailySales.findAll", query="SELECT v FROM ViewDailySales v")
public class ViewDailySales implements Serializable {
	private static final long serialVersionUID = 1L;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbo_create_date")
	private Date tboCreateDate;

	@Column(name="count_tbo_create_date")
	private Long countTboCreateDate;

	@Id
	@Column(name="uuid")
	private String uuid;

	public ViewDailySales() {
	}

	public Date getTboCreateDate() {
		return tboCreateDate;
	}

	public void setTboCreateDate(Date tboCreateDate) {
		this.tboCreateDate = tboCreateDate;
	}

	public Long getCountTboCreateDate() {
		return countTboCreateDate;
	}

	public void setCountTboCreateDate(Long countTboCreateDate) {
		this.countTboCreateDate = countTboCreateDate;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}	

}