package com.api.dms.order.model.product;

import java.io.Serializable;
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
@JsonPropertyOrder({ "tbpmId", "tbpId", "tbpSku", "tbmMarketId", "tbpmQty", "uuid" })
@Generated("jsonschema2pojo")
public class ViewProductMarket implements Serializable {
	@JsonProperty("tbpmId")
	private Integer tbpmId;
	@JsonProperty("tbpId")	
	private Integer tbpId;
	@JsonProperty("tbpSku")
	private String tbpSku;
	@JsonProperty("tbmMarketId")
	private String tbmMarketId;
	@JsonProperty("tbpmQty")
	private Integer tbpmQty;
	@JsonProperty("uuid")
	private String uuid;
	@JsonIgnore
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

	@JsonProperty("tbpmId")
	public Integer getTbpmId() {
		return tbpmId;
	}

	@JsonProperty("tbpmId")
	public void setTbpmId(Integer tbpmId) {
		this.tbpmId = tbpmId;
	}

	@JsonProperty("tbpId")
	public Integer getTbpId() {
		return tbpId;
	}

	@JsonProperty("tbpId")
	public void setTbpId(Integer tbpId) {
		this.tbpId = tbpId;
	}

	@JsonProperty("tbpSku")
	public String getTbpSku() {
		return tbpSku;
	}

	@JsonProperty("tbpSku")
	public void setTbpSku(String tbpSku) {
		this.tbpSku = tbpSku;
	}

	@JsonProperty("tbmMarketId")
	public String getTbmMarketId() {
		return tbmMarketId;
	}

	@JsonProperty("tbmMarketId")
	public void setTbmMarketId(String tbmMarketId) {
		this.tbmMarketId = tbmMarketId;
	}

	@JsonProperty("tbpmQty")
	public Integer getTbpmQty() {
		return tbpmQty;
	}

	@JsonProperty("tbpmQty")
	public void setTbpmQty(Integer tbpmQty) {
		this.tbpmQty = tbpmQty;
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