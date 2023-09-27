package com.api.dms.order.model.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({ "requestId", "requestDate", "responseId", "responseDate", "status", "error", "message",
		"tbProduct", "lstViewGwpSkuProduct" })
@Generated("jsonschema2pojo")
public class GetProductResponseModel {

	@JsonProperty("requestId")
	private String requestId;
	@JsonProperty("requestDate")
	private String requestDate;
	@JsonProperty("responseId")
	private String responseId;
	@JsonProperty("responseDate")
	private String responseDate;
	@JsonProperty("status")
	private String status;
	@JsonProperty("error")
	private Object error;
	@JsonProperty("message")
	private String message;
	@JsonProperty("tbProduct")
	private TbProduct tbProduct;
	@JsonProperty("lstViewGwpSkuProduct")
	private List<LstViewGwpSkuProduct> lstViewGwpSkuProduct = null;
	@JsonIgnore
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

	@JsonProperty("requestId")
	public String getRequestId() {
		return requestId;
	}

	@JsonProperty("requestId")
	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	@JsonProperty("requestDate")
	public String getRequestDate() {
		return requestDate;
	}

	@JsonProperty("requestDate")
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	@JsonProperty("responseId")
	public String getResponseId() {
		return responseId;
	}

	@JsonProperty("responseId")
	public void setResponseId(String responseId) {
		this.responseId = responseId;
	}

	@JsonProperty("responseDate")
	public String getResponseDate() {
		return responseDate;
	}

	@JsonProperty("responseDate")
	public void setResponseDate(String responseDate) {
		this.responseDate = responseDate;
	}

	@JsonProperty("status")
	public String getStatus() {
		return status;
	}

	@JsonProperty("status")
	public void setStatus(String status) {
		this.status = status;
	}

	@JsonProperty("error")
	public Object getError() {
		return error;
	}

	@JsonProperty("error")
	public void setError(Object error) {
		this.error = error;
	}

	@JsonProperty("message")
	public String getMessage() {
		return message;
	}

	@JsonProperty("message")
	public void setMessage(String message) {
		this.message = message;
	}

	@JsonProperty("tbProduct")
	public TbProduct getTbProduct() {
		return tbProduct;
	}

	@JsonProperty("tbProduct")
	public void setTbProduct(TbProduct tbProduct) {
		this.tbProduct = tbProduct;
	}

	@JsonProperty("lstViewGwpSkuProduct")
	public List<LstViewGwpSkuProduct> getLstViewGwpSkuProduct() {
		return lstViewGwpSkuProduct;
	}

	@JsonProperty("lstViewGwpSkuProduct")
	public void setLstViewGwpSkuProduct(List<LstViewGwpSkuProduct> lstViewGwpSkuProduct) {
		this.lstViewGwpSkuProduct = lstViewGwpSkuProduct;
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