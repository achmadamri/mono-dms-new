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
@JsonPropertyOrder({ "tbgSku", "tbgStatus", "tbgsMin", "tbgsMinAccu", "tbgsQty", "tbgsSku", "tbpgTbpBrand",
		"tbpgTbpCode", "tbpgTbpItem", "tbpgTbpLoc", "tbpgTbpUnitPrice", "tbpgsTbpBrand", "tbpgsTbpCode", "tbpgsTbpItem",
		"tbpgsTbpLoc", "tbpgsTbpUnitPrice", "uuid" })
@Generated("jsonschema2pojo")
public class LstViewGwpSkuProduct {

	@JsonProperty("tbgSku")
	private String tbgSku;
	@JsonProperty("tbgStatus")
	private String tbgStatus;
	@JsonProperty("tbgsMin")
	private Integer tbgsMin;
	@JsonProperty("tbgsMinAccu")
	private Integer tbgsMinAccu;
	@JsonProperty("tbgsQty")
	private Integer tbgsQty;
	@JsonProperty("tbgsSku")
	private String tbgsSku;
	@JsonProperty("tbpgTbpBrand")
	private String tbpgTbpBrand;
	@JsonProperty("tbpgTbpCode")
	private String tbpgTbpCode;
	@JsonProperty("tbpgTbpItem")
	private String tbpgTbpItem;
	@JsonProperty("tbpgTbpLoc")
	private String tbpgTbpLoc;
	@JsonProperty("tbpgTbpUnitPrice")
	private Integer tbpgTbpUnitPrice;
	@JsonProperty("tbpgsTbpBrand")
	private String tbpgsTbpBrand;
	@JsonProperty("tbpgsTbpCode")
	private String tbpgsTbpCode;
	@JsonProperty("tbpgsTbpItem")
	private String tbpgsTbpItem;
	@JsonProperty("tbpgsTbpLoc")
	private String tbpgsTbpLoc;
	@JsonProperty("tbpgsTbpUnitPrice")
	private Integer tbpgsTbpUnitPrice;
	@JsonProperty("uuid")
	private String uuid;
	@JsonIgnore
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

	@JsonProperty("tbgSku")
	public String getTbgSku() {
		return tbgSku;
	}

	@JsonProperty("tbgSku")
	public void setTbgSku(String tbgSku) {
		this.tbgSku = tbgSku;
	}

	@JsonProperty("tbgStatus")
	public String getTbgStatus() {
		return tbgStatus;
	}

	@JsonProperty("tbgStatus")
	public void setTbgStatus(String tbgStatus) {
		this.tbgStatus = tbgStatus;
	}

	@JsonProperty("tbgsMin")
	public Integer getTbgsMin() {
		return tbgsMin;
	}

	@JsonProperty("tbgsMin")
	public void setTbgsMin(Integer tbgsMin) {
		this.tbgsMin = tbgsMin;
	}

	@JsonProperty("tbgsMinAccu")
	public Integer getTbgsMinAccu() {
		return tbgsMinAccu;
	}

	@JsonProperty("tbgsMinAccu")
	public void setTbgsMinAccu(Integer tbgsMinAccu) {
		this.tbgsMinAccu = tbgsMinAccu;
	}

	@JsonProperty("tbgsQty")
	public Integer getTbgsQty() {
		return tbgsQty;
	}

	@JsonProperty("tbgsQty")
	public void setTbgsQty(Integer tbgsQty) {
		this.tbgsQty = tbgsQty;
	}

	@JsonProperty("tbgsSku")
	public String getTbgsSku() {
		return tbgsSku;
	}

	@JsonProperty("tbgsSku")
	public void setTbgsSku(String tbgsSku) {
		this.tbgsSku = tbgsSku;
	}

	@JsonProperty("tbpgTbpBrand")
	public String getTbpgTbpBrand() {
		return tbpgTbpBrand;
	}

	@JsonProperty("tbpgTbpBrand")
	public void setTbpgTbpBrand(String tbpgTbpBrand) {
		this.tbpgTbpBrand = tbpgTbpBrand;
	}

	@JsonProperty("tbpgTbpCode")
	public String getTbpgTbpCode() {
		return tbpgTbpCode;
	}

	@JsonProperty("tbpgTbpCode")
	public void setTbpgTbpCode(String tbpgTbpCode) {
		this.tbpgTbpCode = tbpgTbpCode;
	}

	@JsonProperty("tbpgTbpItem")
	public String getTbpgTbpItem() {
		return tbpgTbpItem;
	}

	@JsonProperty("tbpgTbpItem")
	public void setTbpgTbpItem(String tbpgTbpItem) {
		this.tbpgTbpItem = tbpgTbpItem;
	}

	@JsonProperty("tbpgTbpLoc")
	public String getTbpgTbpLoc() {
		return tbpgTbpLoc;
	}

	@JsonProperty("tbpgTbpLoc")
	public void setTbpgTbpLoc(String tbpgTbpLoc) {
		this.tbpgTbpLoc = tbpgTbpLoc;
	}

	@JsonProperty("tbpgTbpUnitPrice")
	public Integer getTbpgTbpUnitPrice() {
		return tbpgTbpUnitPrice;
	}

	@JsonProperty("tbpgTbpUnitPrice")
	public void setTbpgTbpUnitPrice(Integer tbpgTbpUnitPrice) {
		this.tbpgTbpUnitPrice = tbpgTbpUnitPrice;
	}

	@JsonProperty("tbpgsTbpBrand")
	public String getTbpgsTbpBrand() {
		return tbpgsTbpBrand;
	}

	@JsonProperty("tbpgsTbpBrand")
	public void setTbpgsTbpBrand(String tbpgsTbpBrand) {
		this.tbpgsTbpBrand = tbpgsTbpBrand;
	}

	@JsonProperty("tbpgsTbpCode")
	public String getTbpgsTbpCode() {
		return tbpgsTbpCode;
	}

	@JsonProperty("tbpgsTbpCode")
	public void setTbpgsTbpCode(String tbpgsTbpCode) {
		this.tbpgsTbpCode = tbpgsTbpCode;
	}

	@JsonProperty("tbpgsTbpItem")
	public String getTbpgsTbpItem() {
		return tbpgsTbpItem;
	}

	@JsonProperty("tbpgsTbpItem")
	public void setTbpgsTbpItem(String tbpgsTbpItem) {
		this.tbpgsTbpItem = tbpgsTbpItem;
	}

	@JsonProperty("tbpgsTbpLoc")
	public String getTbpgsTbpLoc() {
		return tbpgsTbpLoc;
	}

	@JsonProperty("tbpgsTbpLoc")
	public void setTbpgsTbpLoc(String tbpgsTbpLoc) {
		this.tbpgsTbpLoc = tbpgsTbpLoc;
	}

	@JsonProperty("tbpgsTbpUnitPrice")
	public Integer getTbpgsTbpUnitPrice() {
		return tbpgsTbpUnitPrice;
	}

	@JsonProperty("tbpgsTbpUnitPrice")
	public void setTbpgsTbpUnitPrice(Integer tbpgsTbpUnitPrice) {
		this.tbpgsTbpUnitPrice = tbpgsTbpUnitPrice;
	}

	@JsonProperty("uuid")
	public String getUuid() {
		return uuid;
	}

	@JsonProperty("uuid")
	public void setUuid(String uuid) {
		this.uuid = uuid;
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