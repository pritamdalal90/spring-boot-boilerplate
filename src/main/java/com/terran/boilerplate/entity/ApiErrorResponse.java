package com.terran.boilerplate.entity;

import org.springframework.http.HttpStatus;

import java.util.HashMap;

public class ApiErrorResponse {

	private HttpStatus status;
	private int error_code;
	private String message;
	private String detail;
	private HashMap<String, String[]> errors;

	public HashMap<String, String[]> getErrors() { return errors; }

	public void setErrors(HashMap<String, String[]> errors) { this.errors = errors; }

	public HttpStatus getStatus() {
		return status;
	}
	
	public int getError_code() {
		return error_code;
	}
	
	public String getMessage() {
		return message;
	}
	
	public String getDetail() {
		return detail;
	}
	
	public void setStatus(String message) {
		this.message = message;
	}
	
	public void setError_code(int error_code) {
		this.error_code = error_code;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	// Builder
	public static final class ApiErrorResponseBuilder {
		private HttpStatus status;
		private int error_code;
		private String message;
		private String detail;
		private HashMap<String, String[]> errors;

		public ApiErrorResponseBuilder() {
		}

		public static ApiErrorResponseBuilder anApiErrorResponse() {
			return new ApiErrorResponseBuilder();
		}

		public ApiErrorResponseBuilder withStatus(HttpStatus status) {
			this.status = status;
			return this;
		}

		public ApiErrorResponseBuilder withError_code(int i) {
			this.error_code = i;
			return this;
		}

		public ApiErrorResponseBuilder withMessage(String message) {
			this.message = message;
			return this;
		}

		public ApiErrorResponseBuilder withDetail(String detail) {
			this.detail = detail;
			return this;
		}

		public ApiErrorResponseBuilder withErrors(HashMap<String, String[]> errors) {
			this.errors = errors;
			return this;
		}

		public ApiErrorResponse build() {
			ApiErrorResponse apiErrorResponse = new ApiErrorResponse();
			apiErrorResponse.status = this.status;
			apiErrorResponse.error_code = this.error_code;
			apiErrorResponse.detail = this.detail;
			apiErrorResponse.message = this.message;
			apiErrorResponse.errors = this.errors;
			return apiErrorResponse;
		}
	}
}
