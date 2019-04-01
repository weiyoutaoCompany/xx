package com.bjbls.forum.model;

public class SendState {
    private Integer id;         //标识
    private String name;       //帖子状态

    public SendState() {
    }

    public SendState(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
