package com.bjbls.forum.dao;

import com.bjbls.forum.model.Customer;
import org.apache.ibatis.annotations.Param;

public interface CustomerDao {
    	/*
	 * 处理数据库的登录方法
	 * @return null表示登录失败
	 */
    Customer login(@Param(value = "username") String username, @Param(value = "password") String password);


    /*
    根据账户的标志符删除对应的账户信息
    @param id 账户信息的id
    @return 删除的记录数
     */
    int delete(int id);

    /*
    根据账户的标志符读取对应的账户信息
	@param id 账户信息的id
	@return 账户对象，如果是null表示读取失败
	 */
    Customer get(int id);

    int addCs(String username);

    /*
	将账户信息存入账户表中
	@param admin 账户信息，注意表中的非空字段不能为空
	@return 添加了几条记录信息
	 */
    int add(Customer customer);
    /*
    * */
    int updatePassword(@Param(value = "password") String password, @Param(value = "id") Integer id);

}
