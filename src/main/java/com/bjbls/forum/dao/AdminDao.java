package com.bjbls.forum.dao;


import com.bjbls.forum.model.Admin;
import com.bjbls.forum.model.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminDao {

    /*
* 处理数据库的登录方法
* @return null表示登录失败
*/
    Admin login(@Param(value = "username") String username, @Param(value = "password") String password);

    /*
* 获取admin的列表方法
* 返回列表
*/
    List<Admin> readAll();
      /*
* 获取admin的列表方法
* 返回列表
*/
    int add(Admin admin);
//判断用户名是否存在
    int addCs(String username);
//删除
    int delete(int id);
    //根据id读取信息
    Admin get(int id);
    //更新管理信息
    int update(Admin admin);
    //查询记录实现分页
    List<Admin> readCus(Page page);
}

