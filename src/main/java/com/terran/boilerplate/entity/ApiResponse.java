package com.terran.boilerplate.entity;

public class ApiResponse<T> {
	private Integer success;
	private T message;

	public ApiResponse(Integer success, T message) {
		this.success = success;
		this.message = message;
	}

	public Integer getSuccess() {
		return success;
	}

	public void setSuccess(Integer success) {
		this.success = success;
	}

	public T getMessage() {
		return message;
	}

	public void setMessage(T message) {
		this.message = message;
	}
}
