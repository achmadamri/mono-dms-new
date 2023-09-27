package com.api.dms.product.db.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tb_product_bundle database table.
 * 
 */
@Entity
@Table(name="tb_product_bundle")
@NamedQuery(name="TbProductBundle.findAll", query="SELECT t FROM TbProductBundle t")
public class TbProductBundle implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tbpb_id")
	private Integer tbpbId;

	@Column(name="tbp_qty")
	private Integer tbpQty;

	@Column(name="tbp_sku")
	private String tbpSku;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbpb_create_date")
	private Date tbpbCreateDate;

	@Column(name="tbpb_create_id")
	private Integer tbpbCreateId;

	@Column(name="tbpb_item")
	private String tbpbItem;

	@Column(name="tbpb_sku")
	private String tbpbSku;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbpb_update_date")
	private Date tbpbUpdateDate;

	@Column(name="tbpb_update_id")
	private Integer tbpbUpdateId;

	public TbProductBundle() {
	}

	public Integer getTbpbId() {
		return this.tbpbId;
	}

	public void setTbpbId(Integer tbpbId) {
		this.tbpbId = tbpbId;
	}

	public Integer getTbpQty() {
		return this.tbpQty;
	}

	public void setTbpQty(Integer tbpQty) {
		this.tbpQty = tbpQty;
	}

	public String getTbpSku() {
		return this.tbpSku;
	}

	public void setTbpSku(String tbpSku) {
		this.tbpSku = tbpSku;
	}

	public Date getTbpbCreateDate() {
		return this.tbpbCreateDate;
	}

	public void setTbpbCreateDate(Date tbpbCreateDate) {
		this.tbpbCreateDate = tbpbCreateDate;
	}

	public Integer getTbpbCreateId() {
		return this.tbpbCreateId;
	}

	public void setTbpbCreateId(Integer tbpbCreateId) {
		this.tbpbCreateId = tbpbCreateId;
	}

	public String getTbpbItem() {
		return this.tbpbItem;
	}

	public void setTbpbItem(String tbpbItem) {
		this.tbpbItem = tbpbItem;
	}

	public String getTbpbSku() {
		return this.tbpbSku;
	}

	public void setTbpbSku(String tbpbSku) {
		this.tbpbSku = tbpbSku;
	}

	public Date getTbpbUpdateDate() {
		return this.tbpbUpdateDate;
	}

	public void setTbpbUpdateDate(Date tbpbUpdateDate) {
		this.tbpbUpdateDate = tbpbUpdateDate;
	}

	public Integer getTbpbUpdateId() {
		return this.tbpbUpdateId;
	}

	public void setTbpbUpdateId(Integer tbpbUpdateId) {
		this.tbpbUpdateId = tbpbUpdateId;
	}

}