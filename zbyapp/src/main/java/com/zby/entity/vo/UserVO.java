package com.zby.entity.vo;

public class UserVO {

	private String username;
	private String password;
	private int enabled = 1;
	
	public String getUsername() {
		return username;
	}
	public void setUsernameString(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	
}
