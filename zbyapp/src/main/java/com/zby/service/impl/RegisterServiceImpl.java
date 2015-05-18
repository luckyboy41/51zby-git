package com.zby.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zby.dao.UserDao;
import com.zby.entity.Authorities;
import com.zby.entity.User;
import com.zby.service.RegisterService;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private UserDao userDao;
	
	public void register(User user) {
		userDao.createUser(user);
		Authorities authorities = new Authorities();
		authorities.setUsername(user.getUsername());
		userDao.createAuth(authorities);
	}

}
