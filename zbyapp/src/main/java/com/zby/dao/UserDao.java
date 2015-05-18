package com.zby.dao;

import com.zby.entity.Authorities;
import com.zby.entity.User;

public interface UserDao {

	public User getByName(String name);
	
	public void createUser(User user);
	
	public void createAuth(Authorities authorities);
}
