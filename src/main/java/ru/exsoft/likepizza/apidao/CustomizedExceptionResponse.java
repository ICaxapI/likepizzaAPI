package ru.exsoft.likepizza.apidao;

import ru.exsoft.likepizza.entity.Prize;

import java.util.Date;
import java.util.List;

public class CustomizedExceptionResponse {
    private String message;
    private Integer status;
    private Date timestamp;

    public CustomizedExceptionResponse(String message, Integer status) {
        this.message = message;
        this.status = status;
        timestamp = new Date();
    }

    public String getMessage() {
        return message;
    }

    public CustomizedExceptionResponse setMessage(String message) {
        this.message = message;
        return this;
    }

    public Integer getStatus() {
        return status;
    }

    public CustomizedExceptionResponse setStatus(Integer status) {
        this.status = status;
        return this;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public CustomizedExceptionResponse setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
        return this;
    }

    public static class WithPrizes extends CustomizedExceptionResponse{
        private List<Prize> prizes;
        private Long hash;

        public WithPrizes(String message, Integer status, List<Prize> prizes, Long hash) {
            super(message, status);
            this.prizes = prizes;
            this.hash = hash;
        }

        public Long getHash() {
            return hash;
        }

        public WithPrizes setHash(Long hash) {
            this.hash = hash;
            return this;
        }

        public List<Prize> getPrizes() {
            return prizes;
        }

        public WithPrizes setPrizes(List<Prize> prizes) {
            this.prizes = prizes;
            return this;
        }
    }
}
