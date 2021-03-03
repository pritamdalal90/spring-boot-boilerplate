package com.terran.boilerplate.exceptions;

import javax.servlet.ServletException;

import com.terran.boilerplate.BoilerplateApplication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.terran.boilerplate.entity.ApiErrorResponse;;

@EnableWebMvc
@RestControllerAdvice
public class ApiGlobalExceptionHandler {

	private static final Logger logger = LoggerFactory.getLogger(BoilerplateApplication.class);

	// for debugging purpose in FRONTEND, comment this whole method
	@ExceptionHandler(Exception.class)
	@ResponseBody
	public ApiErrorResponse unhandledException(Exception ex) {
		return new ApiErrorResponse.ApiErrorResponseBuilder().withStatus(HttpStatus.NOT_FOUND)
				.withError_code(HttpStatus.NOT_FOUND.value()).withMessage(ex.getMessage())
				.withDetail(ex.getMessage()).build();
	}

	@ExceptionHandler(BoilerplateExceptionHandler.class)
	@ResponseBody
	public ApiErrorResponse unhandledException(BoilerplateExceptionHandler ex) {
		ApiErrorResponse.ApiErrorResponseBuilder builder = new ApiErrorResponse.ApiErrorResponseBuilder().withStatus(ex.httpStat).withError_code(ex.httpStat.value()).withMessage(ex.message);
		if (!ex.errors.isEmpty()) {
			builder.withErrors(ex.errors);
		}
		return builder.build();
	}

	// for debugging purpose in FRONTEND, comment this whole method
	@ExceptionHandler(ServletException.class)
	@ResponseBody
	public final ResponseEntity<Object> handleServletException(ServletException ex) {
		ApiErrorResponse response = new ApiErrorResponse.ApiErrorResponseBuilder().withStatus(HttpStatus.BAD_REQUEST)
				.withError_code(HttpStatus.BAD_REQUEST.value()).withMessage(ex.getLocalizedMessage()).build();
		return new ResponseEntity<>(response, response.getStatus());

	}

	@ExceptionHandler(BadCredentialsException.class)
	@ResponseBody
	public ApiErrorResponse badCredentialsException(BadCredentialsException ex) {
		return new ApiErrorResponse.ApiErrorResponseBuilder().withStatus(HttpStatus.BAD_REQUEST)
				.withError_code(HttpStatus.BAD_REQUEST.value()).withMessage(ex.getLocalizedMessage())
				.withDetail(ex.getLocalizedMessage()).build();
	}

	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseBody
	public ApiErrorResponse requestHandlingNoHandlerFound() {
		return new ApiErrorResponse.ApiErrorResponseBuilder().withStatus(HttpStatus.NOT_FOUND)
				.withError_code(HttpStatus.NOT_FOUND.value()).withMessage("Invalid request")
				.withDetail("Invalid request").build();
	}

	@ExceptionHandler(HttpRequestMethodNotSupportedException.class)
	@ResponseBody
	public final ResponseEntity<Object> handleHttpRequestMethodNotSupportedException(
			HttpRequestMethodNotSupportedException ex, WebRequest request) {
		ApiErrorResponse response = new ApiErrorResponse.ApiErrorResponseBuilder().withStatus(HttpStatus.BAD_REQUEST)
				.withError_code(HttpStatus.BAD_REQUEST.value()).withMessage(ex.getLocalizedMessage()).build();
		return new ResponseEntity<>(response, response.getStatus());

	}

	@ExceptionHandler(HttpMessageNotReadableException.class)
	@ResponseBody
	public final ResponseEntity<Object> handleHttpRequestMethodNotSupportedException(
			HttpMessageNotReadableException ex) {
		ApiErrorResponse response = new ApiErrorResponse.ApiErrorResponseBuilder().withStatus(HttpStatus.BAD_REQUEST)
				.withError_code(HttpStatus.BAD_REQUEST.value()).withMessage(ex.getLocalizedMessage()).build();
		return new ResponseEntity<>(response, response.getStatus());

	}

}