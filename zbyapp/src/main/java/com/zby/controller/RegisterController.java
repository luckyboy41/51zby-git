package com.zby.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zby.entity.User;
import com.zby.service.RegisterService;

@Controller
public class RegisterController {

	@Autowired
	RegisterService registerService;
	
	@RequestMapping(value="/register")
	public void register(@RequestParam(value = "username") String username,
			@RequestParam(value = "password") String password) {
		User user = new User();
		user.setUsernameString(username);
		user.setPassword(password);
		user.setEnabled(1);
		registerService.register(user);
	}
	
}
