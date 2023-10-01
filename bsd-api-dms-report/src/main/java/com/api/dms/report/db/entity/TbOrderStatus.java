package com.api.dms.report.db.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the tb_order_status database table.
 * 
 */
@Entity
@Table(name="tb_order_status")
@NamedQuery(name="TbOrderStatus.findAll", query="SELECT t FROM TbOrderStatus t")
public class TbOrderStatus implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tbos_id")
	private Integer tbosId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbos_create_date")
	private Date tbosCreateDate;

	@Column(name="tbos_create_id")
	private Integer tbosCreateId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tbos_update_date")
	private Date tbosUpdateDate;

	@Column(name="tbos_update_id")
	private Integer tbosUpdateId;

	@Column(name="tbo_id")
	private Integer tboId;

	@Column(name="tbos_status")
	private String tbosStatus;

	public TbOrderStatus() {
	}

	public Integer getTbosId() {
		return tbosId;
	}

	public void setTbosId(Integer tbosId) {
		this.tbosId = tbosId;
	}

	public Date getTbosCreateDate() {
		return tbosCreateDate;
	}

	public void setTbosCreateDate(Date tbosCreateDate) {
		this.tbosCreateDate = tbosCreateDate;
	}

	public Integer getTbosCreateId() {
		return tbosCreateId;
	}

	public void setTbosCreateId(Integer tbosCreateId) {
		this.tbosCreateId = tbosCreateId;
	}

	public Date getTbosUpdateDate() {
		return tbosUpdateDate;
	}

	public void setTbosUpdateDate(Date tbosUpdateDate) {
		this.tbosUpdateDate = tbosUpdateDate;
	}

	public Integer getTbosUpdateId() {
		return tbosUpdateId;
	}

	public void setTbosUpdateId(Integer tbosUpdateId) {
		this.tbosUpdateId = tbosUpdateId;
	}

	public Integer getTboId() {
		return tboId;
	}

	public void setTboId(Integer tboId) {
		this.tboId = tboId;
	}

	public String getTbosStatus() {
		return tbosStatus;
	}

	public void setTbosStatus(String tbosStatus) {
		this.tbosStatus = tbosStatus;
	}

}