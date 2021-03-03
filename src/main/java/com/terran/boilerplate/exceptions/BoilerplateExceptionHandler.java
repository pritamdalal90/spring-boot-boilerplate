package com.terran.boilerplate.exceptions;

import com.terran.boilerplate.BoilerplateApplication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;

import java.util.HashMap;

public class BoilerplateExceptionHandler extends Exception {

	public String message = "";

	public HttpStatus httpStat;

	public HashMap<String, String[]> errors;

	private static final long serialVersionUID = -3937601400119586591L;

	private static final Logger logger = LoggerFactory.getLogger(BoilerplateApplication.class);

	public BoilerplateExceptionHandler(String message, HttpStatus httpStat) {
		this.message = message;
		this.httpStat = httpStat;
	}

	public BoilerplateExceptionHandler(String message, HttpStatus httpStat, HashMap<String, String[]> errors) {
		this.message = message;
		this.httpStat = httpStat;
		this.errors = errors;
	}
}
