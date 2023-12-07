package com.api.dms.order.db.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tb_order_pack database table.
 * 
 */
@Entity
@Table(name="tb_order_pack")
@NamedQuery(name="TbOrderPack.findAll", query="SELECT t FROM TbOrderPack t")
public class TbOrderPack implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tbop_id")
	private Integer tbopId;

	@Column(name="tbop_awb")
	private String tbopAwb;

	@Column(name="tbop_brand")
	private String tbopBrand;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbop_create_date")
	private Date tbopCreateDate;

	@Column(name="tbop_create_id")
	private Integer tbopCreateId;

	@Column(name="tbop_market_id")
	private String tbopMarketId;

	@Column(name="tbop_name")
	private String tbopName;

	@Column(name="tbop_notes")
	private String tbopNotes;

	@Column(name="tbop_order_no")
	private String tbopOrderNo;

	@Column(name="tbop_qc_id")
	private Integer tbopQcId;

	@Column(name="tbop_status")
	private String tbopStatus;

	@Column(name="tbop_type")
	private String tbopType;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbop_update_date")
	private Date tbopUpdateDate;

	@Column(name="tbop_update_id")
	private Integer tbopUpdateId;

	@Column(name="tbop_frontliner")
	private String tbopFrontliner;

	public TbOrderPack() {
	}

	public Integer getTbopId() {
		return tbopId;
	}

	public void setTbopId(Integer tbopId) {
		this.tbopId = tbopId;
	}

	public String getTbopAwb() {
		return tbopAwb;
	}

	public void setTbopAwb(String tbopAwb) {
		this.tbopAwb = tbopAwb;
	}

	public String getTbopBrand() {
		return tbopBrand;
	}

	public void setTbopBrand(String tbopBrand) {
		this.tbopBrand = tbopBrand;
	}

	public Date getTbopCreateDate() {
		return tbopCreateDate;
	}

	public void setTbopCreateDate(Date tbopCreateDate) {
		this.tbopCreateDate = tbopCreateDate;
	}

	public Integer getTbopCreateId() {
		return tbopCreateId;
	}

	public void setTbopCreateId(Integer tbopCreateId) {
		this.tbopCreateId = tbopCreateId;
	}

	public String getTbopMarket() {
		return tbopMarketId;
	}

	public void setTbopMarket(String tbopMarketId) {
		this.tbopMarketId = tbopMarketId;
	}

	public String getTbopName() {
		return tbopName;
	}

	public void setTbopName(String tbopName) {
		this.tbopName = tbopName;
	}

	public String getTbopNotes() {
		return tbopNotes;
	}

	public void setTbopNotes(String tbopNotes) {
		this.tbopNotes = tbopNotes;
	}

	public String getTbopOrderNo() {
		return tbopOrderNo;
	}

	public void setTbopOrderNo(String tbopOrderNo) {
		this.tbopOrderNo = tbopOrderNo;
	}

	public Integer getTbopQcId() {
		return tbopQcId;
	}

	public void setTbopQcId(Integer tbopQcId) {
		this.tbopQcId = tbopQcId;
	}

	public String getTbopStatus() {
		return tbopStatus;
	}

	public void setTbopStatus(String tbopStatus) {
		this.tbopStatus = tbopStatus;
	}

	public String getTbopType() {
		return tbopType;
	}

	public void setTbopType(String tbopType) {
		this.tbopType = tbopType;
	}

	public Date getTbopUpdateDate() {
		return tbopUpdateDate;
	}

	public void setTbopUpdateDate(Date tbopUpdateDate) {
		this.tbopUpdateDate = tbopUpdateDate;
	}

	public Integer getTbopUpdateId() {
		return tbopUpdateId;
	}

	public void setTbopUpdateId(Integer tbopUpdateId) {
		this.tbopUpdateId = tbopUpdateId;
	}

	public String getTbopFrontliner() {
		return tbopFrontliner;
	}

	public void setTbopFrontliner(String tbopFrontliner) {
		this.tbopFrontliner = tbopFrontliner;
	}

}