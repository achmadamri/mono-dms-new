package com.api.dms.member.db.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tb_user_market database table.
 * 
 */
@Entity
@Table(name="tb_user_market")
@NamedQuery(name="TbUserMarket.findAll", query="SELECT t FROM TbUserMarket t")
public class TbUserMarket implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="tbum_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer tbumId;

	@Column(name="tbm_market")
	private String tbmMarket;

	@Column(name="tbm_market_check")
	private Integer tbmMarketCheck;

	@Column(name="tbu_id")
	private Integer tbuId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbum_create_date")
	private Date tbumCreateDate;

	@Column(name="tbum_create_id")
	private Integer tbumCreateId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbum_update_date")
	private Date tbumUpdateDate;

	@Column(name="tbum_update_id")
	private Integer tbumUpdateId;

	public TbUserMarket() {
	}

	public Integer getTbumId() {
		return this.tbumId;
	}

	public void setTbumId(Integer tbumId) {
		this.tbumId = tbumId;
	}

	public String getTbmMarket() {
		return this.tbmMarket;
	}

	public void setTbmMarket(String tbmMarket) {
		this.tbmMarket = tbmMarket;
	}

	public Integer getTbmMarketCheck() {
		return this.tbmMarketCheck;
	}

	public void setTbmMarketCheck(Integer tbmMarketCheck) {
		this.tbmMarketCheck = tbmMarketCheck;
	}

	public Integer getTbuId() {
		return this.tbuId;
	}

	public void setTbuId(Integer tbuId) {
		this.tbuId = tbuId;
	}

	public Date getTbumCreateDate() {
		return this.tbumCreateDate;
	}

	public void setTbumCreateDate(Date tbumCreateDate) {
		this.tbumCreateDate = tbumCreateDate;
	}

	public Integer getTbumCreateId() {
		return this.tbumCreateId;
	}

	public void setTbumCreateId(Integer tbumCreateId) {
		this.tbumCreateId = tbumCreateId;
	}

	public Date getTbumUpdateDate() {
		return this.tbumUpdateDate;
	}

	public void setTbumUpdateDate(Date tbumUpdateDate) {
		this.tbumUpdateDate = tbumUpdateDate;
	}

	public Integer getTbumUpdateId() {
		return this.tbumUpdateId;
	}

	public void setTbumUpdateId(Integer tbumUpdateId) {
		this.tbumUpdateId = tbumUpdateId;
	}

}