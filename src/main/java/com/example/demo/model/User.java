package com.example.demo.model;

import javax.persistence.Entity;

import org.springframework.data.jpa.domain.AbstractPersistable; // no need to add primary key with this and annotation

@Entity
public class User extends AbstractPersistable<Long> {

	private String userId;
	private String userName;
	private String password;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
