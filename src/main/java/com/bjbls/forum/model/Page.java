package com.bjbls.forum.model;

public class Page {
    private String tableName;//表名
    private Integer pageIndex=1;//当前页
    private Integer pageSize=6;//每页记录数
    private Integer pageCount;//总页数
    private Integer tatolCount;//总记录数

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public Integer getTatolCount() {
        return tatolCount;
    }

    public void setTatolCount(Integer tatolCount) {
        this.tatolCount = tatolCount;
    }
}
