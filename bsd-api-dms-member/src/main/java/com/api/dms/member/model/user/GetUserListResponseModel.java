package com.api.dms.member.model.user;

import java.util.List;

import com.api.dms.member.db.entity.TbUser;
import com.api.dms.member.model.ResponseModel;

public class GetUserListResponseModel extends ResponseModel {
	
	public GetUserListResponseModel(GetUserListRequestModel requestModel) {
		super(requestModel);
	}
	
	private List<TbUser> lstTbUser;
	
	private Long length;

	public List<TbUser> getLstTbUser() {
		return lstTbUser;
	}

	public void setLstTbUser(List<TbUser> lstTbUser) {
		this.lstTbUser = lstTbUser;
	}

	public Long getLength() {
		return length;
	}

	public void setLength(Long length) {
		this.length = length;
	}
}
