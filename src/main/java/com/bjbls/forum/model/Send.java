package com.bjbls.forum.model;

import java.util.Date;

public class Send {
    private Integer id;         //标识
    private SendType sendType;      //帖子类型 type
    private SendState sendState;     //帖子状态
    private String theme;      //帖子主题
    private String content;    //帖子类型
    private Customer customer;  //发帖用户id
    private Date time;
    public Send(){};
    public Send(Integer id){this.id=id;};

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public SendType getSendType() {
        return sendType;
    }

    public void setSendType(SendType sendType) {
        this.sendType = sendType;
    }

    public SendState getSendState() {
        return sendState;
    }

    public void setSendState(SendState sendState) {
        this.sendState = sendState;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
