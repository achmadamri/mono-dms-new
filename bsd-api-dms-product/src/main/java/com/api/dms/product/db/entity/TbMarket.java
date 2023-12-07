package com.api.dms.product.db.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tb_market database table.
 * 
 */
@Entity
@Table(name="tb_market")
@NamedQuery(name="TbMarket.findAll", query="SELECT t FROM TbMarket t")
public class TbMarket implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="tbm_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer tbmId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbm_create_date")
	private Date tbmCreateDate;

	@Column(name="tbm_create_id")
	private Integer tbmCreateId;

	@Column(name="tbm_market_id")
	private String tbmMarketId;

	@Column(name="tbm_parent_id")
	private Integer tbmParentId;

	@Column(name="tbm_role")
	private String tbmRole;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbm_update_date")
	private Date tbmUpdateDate;

	@Column(name="tbm_update_id")
	private Integer tbmUpdateId;

	public TbMarket() {
	}

	public Integer getTbmId() {
		return this.tbmId;
	}

	public void setTbmId(Integer tbmId) {
		this.tbmId = tbmId;
	}

	public Date getTbmCreateDate() {
		return this.tbmCreateDate;
	}

	public void setTbmCreateDate(Date tbmCreateDate) {
		this.tbmCreateDate = tbmCreateDate;
	}

	public Integer getTbmCreateId() {
		return this.tbmCreateId;
	}

	public void setTbmCreateId(Integer tbmCreateId) {
		this.tbmCreateId = tbmCreateId;
	}

	public String getTbmMarketId() {
		return this.tbmMarketId;
	}

	public void setTbmMarketId(String tbmMarketId) {
		this.tbmMarketId = tbmMarketId;
	}

	public Integer getTbmParentId() {
		return this.tbmParentId;
	}

	public void setTbmParentId(Integer tbmParentId) {
		this.tbmParentId = tbmParentId;
	}

	public String getTbmRole() {
		return this.tbmRole;
	}

	public void setTbmRole(String tbmRole) {
		this.tbmRole = tbmRole;
	}

	public Date getTbmUpdateDate() {
		return this.tbmUpdateDate;
	}

	public void setTbmUpdateDate(Date tbmUpdateDate) {
		this.tbmUpdateDate = tbmUpdateDate;
	}

	public Integer getTbmUpdateId() {
		return this.tbmUpdateId;
	}

	public void setTbmUpdateId(Integer tbmUpdateId) {
		this.tbmUpdateId = tbmUpdateId;
	}

}