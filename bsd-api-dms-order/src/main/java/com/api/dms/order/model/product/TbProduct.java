package com.api.dms.order.model.product;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({ "tbpId", "tbbBrandId", "tbbBrand", "tbpCode", "tbpCreateDate", "tbpCreateId", "tbpItem", "tbpLoc",
		"tbpQty", "tbpSku", "tbpStatus", "tbpUnitPrice", "tbpUpdateDate", "tbpUpdateId", "tbpType" })
@Generated("jsonschema2pojo")
public class TbProduct {

	@JsonProperty("tbpId")
	private Integer tbpId;
	@JsonProperty("tbbBrandId")
	private String tbbBrandId;
	@JsonProperty("tbbBrand")
	private String tbbBrand;
	@JsonProperty("tbpCode")
	private String tbpCode;
	@JsonProperty("tbpCreateDate")
	private Long tbpCreateDate;
	@JsonProperty("tbpCreateId")
	private Integer tbpCreateId;
	@JsonProperty("tbpItem")
	private String tbpItem;
	@JsonProperty("tbpLoc")
	private String tbpLoc;
	@JsonProperty("tbpQty")
	private Integer tbpQty;
	@JsonProperty("tbpSku")
	private String tbpSku;
	@JsonProperty("tbpStatus")
	private Object tbpStatus;
	@JsonProperty("tbpUnitPrice")
	private Integer tbpUnitPrice;
	@JsonProperty("tbpUpdateDate")
	private Object tbpUpdateDate;
	@JsonProperty("tbpUpdateId")
	private Object tbpUpdateId;
	@JsonProperty("tbpType")
	private String tbpType;
	@JsonIgnore
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

	@JsonProperty("tbpId")
	public Integer getTbpId() {
		return tbpId;
	}

	@JsonProperty("tbpId")
	public void setTbpId(Integer tbpId) {
		this.tbpId = tbpId;
	}

	@JsonProperty("tbbBrandId")
	public String getTbbBrandId() {
		return tbbBrandId;
	}

	@JsonProperty("tbbBrandId")
	public void setTbbBrandId(String tbbBrandId) {
		this.tbbBrandId = tbbBrandId;
	}

	@JsonProperty("tbbBrand")
	public String getTbbBrand() {
		return tbbBrand;
	}

	@JsonProperty("tbbBrand")
	public void setTbbBrand(String tbbBrand) {
		this.tbbBrand = tbbBrand;
	}

	@JsonProperty("tbpCode")
	public String getTbpCode() {
		return tbpCode;
	}

	@JsonProperty("tbpCode")
	public void setTbpCode(String tbpCode) {
		this.tbpCode = tbpCode;
	}

	@JsonProperty("tbpCreateDate")
	public Long getTbpCreateDate() {
		return tbpCreateDate;
	}

	@JsonProperty("tbpCreateDate")
	public void setTbpCreateDate(Long tbpCreateDate) {
		this.tbpCreateDate = tbpCreateDate;
	}

	@JsonProperty("tbpCreateId")
	public Integer getTbpCreateId() {
		return tbpCreateId;
	}

	@JsonProperty("tbpCreateId")
	public void setTbpCreateId(Integer tbpCreateId) {
		this.tbpCreateId = tbpCreateId;
	}

	@JsonProperty("tbpItem")
	public String getTbpItem() {
		return tbpItem;
	}

	@JsonProperty("tbpItem")
	public void setTbpItem(String tbpItem) {
		this.tbpItem = tbpItem;
	}

	@JsonProperty("tbpLoc")
	public String getTbpLoc() {
		return tbpLoc;
	}

	@JsonProperty("tbpLoc")
	public void setTbpLoc(String tbpLoc) {
		this.tbpLoc = tbpLoc;
	}

	@JsonProperty("tbpQty")
	public Integer getTbpQty() {
		return tbpQty;
	}

	@JsonProperty("tbpQty")
	public void setTbpQty(Integer tbpQty) {
		this.tbpQty = tbpQty;
	}

	@JsonProperty("tbpSku")
	public String getTbpSku() {
		return tbpSku;
	}

	@JsonProperty("tbpSku")
	public void setTbpSku(String tbpSku) {
		this.tbpSku = tbpSku;
	}

	@JsonProperty("tbpStatus")
	public Object getTbpStatus() {
		return tbpStatus;
	}

	@JsonProperty("tbpStatus")
	public void setTbpStatus(Object tbpStatus) {
		this.tbpStatus = tbpStatus;
	}

	@JsonProperty("tbpUnitPrice")
	public Integer getTbpUnitPrice() {
		return tbpUnitPrice;
	}

	@JsonProperty("tbpUnitPrice")
	public void setTbpUnitPrice(Integer tbpUnitPrice) {
		this.tbpUnitPrice = tbpUnitPrice;
	}

	@JsonProperty("tbpUpdateDate")
	public Object getTbpUpdateDate() {
		return tbpUpdateDate;
	}

	@JsonProperty("tbpUpdateDate")
	public void setTbpUpdateDate(Object tbpUpdateDate) {
		this.tbpUpdateDate = tbpUpdateDate;
	}

	@JsonProperty("tbpUpdateId")
	public Object getTbpUpdateId() {
		return tbpUpdateId;
	}

	@JsonProperty("tbpUpdateId")
	public void setTbpUpdateId(Object tbpUpdateId) {
		this.tbpUpdateId = tbpUpdateId;
	}

	@JsonProperty("tbpType")
	public String getTbpType() {
		return tbpType;
	}

	@JsonProperty("tbpType")
	public void setTbpType(String tbpType) {
		this.tbpType = tbpType;
	}

	@JsonAnyGetter
	public Map<String, Object> getAdditionalProperties() {
		return this.additionalProperties;
	}

	@JsonAnySetter
	public void setAdditionalProperty(String name, Object value) {
		this.additionalProperties.put(name, value);
	}

}