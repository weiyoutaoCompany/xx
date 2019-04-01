package com.bjbls.forum.service;

import com.bjbls.forum.dao.CustomerDao;
import com.bjbls.forum.model.Customer;
import com.bjbls.forum.model.Page;
import com.bjbls.forum.model.exception.MyFormException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class CustomerService {
    @Resource
    private CustomerDao customerDao;

    /*
   登录方法
   @param username  账户名
   @param password  密码
   @return true表示登录成功，false表示登录失败
    */
    public boolean login(String username, String password){
        Customer customer=customerDao.login(username, password);
        if(customer!=null){

            return true;
        }else{
            return false;
        }
    }
    /*
  登录获取
  @param username  账户名
  @param password  密码
  @return true表示登录成功，false表示登录失败
   */
    public  Customer login1(String username,String password){
        Customer customer=customerDao.login(username, password);
        return customer;
    }
    /*
    注册方法
    @param username  账户名
    @param password  密码
     @return
  */
    public  void add(Customer customer) {

        if(customer!=null){
            if(customer.getName().equals("")){
                throw new MyFormException("添加失败：昵称不能为空");
            }
            if(customer.getUsername().equals("")){
                throw new MyFormException("添加失败：账号不能为空");
            }
            if(customer.getPassword().equals("")){
                throw new MyFormException("添加失败：密码不能为空");
            }

            if(customerDao.addCs(customer.getUsername())==0){
                //存入创建时间
                Date date=new Date();
                customer.setTime(date);
                customerDao.add(customer);

            }else{
                throw new MyFormException("添加失败：账号已存在");
            }
        }else{
            throw new MyFormException("添加失败：表单数据不能为空");
        }
    }
     /*
    更新密码方法
    @param username  账户名
    @param password  密码
     @return
  */
    public  boolean updatePassword(String password,Integer id){
        customerDao.updatePassword(password,id);
        if (password != null) {
            return true;
        } else {
            return false;
        }

    }

    /*
    customer列表方法
     @param username  账户名
     @param password  密码
      @return
   */
    public List<Customer> getCustomer(){
        return  customerDao.readAll();
    }
      /*
    customer用户删除方法
   */
    public  void  deleteCustomer(Integer id){customerDao.delete(id);}
      /*
    customer查询单条记录
   */
    public  Customer getCustomer(Integer id){
        Customer customer=null;
        if (id!=null){
            customer=customerDao.get(id);
        }
        return customer;
    }
    //更新用户信息
    public boolean updateCustomer(Customer customer) throws MyFormException {
        boolean status=false;
        if (customer.getName().length()==0){
            throw  new MyFormException("添加失败：昵称不能为空!");
        }
        if(customer.getPassword().equals("")){
            throw new MyFormException("添加失败：密码不能为空");
        }

        int i=customerDao.update(customer);//更新了多少条记录
        // 编写代码，判断是否编辑成功
        if (i ==1) {
            status = true;
        }
        return status;
    }
    //存入当前页和每页几条记录
    public List<Customer> raadCus(Page page){return customerDao.readCus(page);}
}
