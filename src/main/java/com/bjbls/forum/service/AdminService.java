package com.bjbls.forum.service;

import com.bjbls.forum.dao.AdminDao;

import com.bjbls.forum.model.Admin;

import com.bjbls.forum.model.Page;
import com.bjbls.forum.model.exception.MyFormException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AdminService {
    @Resource
    private AdminDao adminDao;

    /*
   登录方法
   @param username  账户名
   @param password  密码
   @return true表示登录成功，false表示登录失败
    */
    public boolean login(String username, String password){

        Admin admin=adminDao.login(username, password);
        if(admin!=null){

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
    public  Admin login1(String username,String password){

        Admin admin=adminDao.login(username, password);
        return admin;
    }

    /*
    * 获取管理员列表*/
    public List<Admin> getAdmin(){ return adminDao.readAll();};
        /*
  添加管理
  @param username  账户名
  @param password  密码
  @return true表示添加成功，false表示添加失败  adminDao.addCs(admin.getUsername())==0
   */
        public  void add(Admin admin)throws MyFormException {
            if(admin!=null){
                if(admin.getName().equals("")){
                    throw new MyFormException("添加失败：昵称不能为空");
                }
                if(admin.getUsername().equals("")){
                    throw new MyFormException("添加失败：账号不能为空");
                }
                if(admin.getPassword().equals("")){
                    throw new MyFormException("添加失败：密码不能为空");
                }
                if(adminDao.addCs(admin.getUsername())==0){

                    adminDao.add(admin);
                }else{
                    throw new MyFormException("添加失败：账号已存在");
                }
            }else{
                throw new MyFormException("添加失败：表单数据不能为空");
            }
        }
    //根据id删除指定的管理
    public void  deleteAdmin(Integer id){ adminDao.delete(id);}
    //根据id读取管理信息
    public  Admin getAdmin(Integer id){
    Admin admin=null;
    if (id!=null){
        admin=adminDao.get(id);
    }
        return admin;
    }
    //更新管理员信息
    public boolean updateAdmin(Admin admin) throws MyFormException{
        boolean status=false;
        if (admin.getName().length()==0){
            throw  new MyFormException("添加失败：姓名不能为空!");
        }
        int i=adminDao.update(admin);//更新了多少条记录
        // 编写代码，判断是否编辑成功
        if (i ==1) {
            status = true;
        }
        return status;
    }
    //存入当前页和每页几条记录
    public List<Admin> raadCus(Page page){return adminDao.readCus(page);}
}
