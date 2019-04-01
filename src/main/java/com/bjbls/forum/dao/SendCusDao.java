package com.bjbls.forum.dao;

import com.bjbls.forum.model.Page;
import com.bjbls.forum.model.SendCus;

import java.util.List;

public interface SendCusDao {

    List<SendCus> ALL();

    List<SendCus> get(Integer id);

    int add(SendCus sendCus);

    int  del(Integer id);

}
