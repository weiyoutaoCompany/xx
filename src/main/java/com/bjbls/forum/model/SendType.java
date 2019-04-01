package com.bjbls.forum.model;

public class SendType {
    private Integer id;         //标识
    private String name;       //板块类型
    private String content;
    public SendType() {
    }
    public SendType(Integer id) {
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
