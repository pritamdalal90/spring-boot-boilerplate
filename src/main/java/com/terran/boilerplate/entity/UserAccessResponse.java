package com.terran.boilerplate.entity;

public class UserAccessResponse<T, K> {
	public T user;
	public K currentUser;

	public UserAccessResponse(T user, K principal) {
		this.user = user;
		this.currentUser = principal;
	}
}
