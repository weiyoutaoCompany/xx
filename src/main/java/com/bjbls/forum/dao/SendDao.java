package com.bjbls.forum.dao;

import com.bjbls.forum.model.Page;
import com.bjbls.forum.model.Send;


import java.util.List;

public interface SendDao {
    //前台读取前四条
    List<Send> readAll();
    //后台读取所有属于state=2
    List<Send> readAll2();
    //后台读取所有属于state=1
    List<Send> readAll3();
    //
    int add(Send send);
    //查询单个记录
    Send get(int id);

    //更新帖子状态
    int update(Send send);
    //删除帖子
    int delete(int id);
    //查询用户的所有帖子
    List<Send> getCus(int id);
    //查询所属版块的帖子
    List<Send> getBan(int id);
    //查询记录实现分页
    List<Send> readCus(Page page);

}
