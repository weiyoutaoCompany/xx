package com.bjbls.forum.dao;


import com.bjbls.forum.model.Page;

public interface PageDao {
    /*
	 * 获取表格记录数 并封装
	 */
    int tatolCount(Page page);
}
