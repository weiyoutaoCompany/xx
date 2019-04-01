package com.bjbls.forum.dao;

import com.bjbls.forum.model.SendType;

import java.util.List;

public interface Send_TypeDao {


    SendType get(int id);

    List<SendType> readAll();
}
