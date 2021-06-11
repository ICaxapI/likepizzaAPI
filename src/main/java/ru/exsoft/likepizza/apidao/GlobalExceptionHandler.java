package ru.exsoft.likepizza.apidao;

import org.hibernate.TypeMismatchException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.support.WebExchangeBindException;

import javax.validation.ConstraintViolationException;

@ControllerAdvice
class GlobalExceptionHandler {

    @ExceptionHandler(TypeMismatchException.class)
    public ResponseEntity<?> handleTypeMismatchException(TypeMismatchException e) {
        return new ResponseEntity<>(new CustomizedExceptionResponse(e.getMessage(), HttpStatus.BAD_REQUEST.value()), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(BindException.class)
    public ResponseEntity<?> handleTypeMismatchException(BindException e) {
        return new ResponseEntity<>(new CustomizedExceptionResponse(e.getMessage(), HttpStatus.BAD_REQUEST.value()), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(WebExchangeBindException.class)
    public ResponseEntity<?> handleWebExchangeBindException(WebExchangeBindException e) {
        return new ResponseEntity<>(new CustomizedExceptionResponse(e.getMessage(), HttpStatus.BAD_REQUEST.value()), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(ConstraintViolationException.class)
    public ResponseEntity<?> handleWebExchangeBindException(ConstraintViolationException e) {
        return new ResponseEntity<>(new CustomizedExceptionResponse(e.getMessage(), HttpStatus.BAD_REQUEST.value()), HttpStatus.BAD_REQUEST);
    }
}
