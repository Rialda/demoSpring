package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import com.example.demo.model.User;

public interface UserService {
	
	List<User> userList();
	
	Optional<User> findOne(Long id);
	void addUser (User user);
	String deleteUser(Long id);
	
}
