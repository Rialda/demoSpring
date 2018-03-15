package com.example.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	

	@Autowired
	private UserRepository userRepository;


	@Override
	public List<User> userList() {
		return userRepository.findAll();
	}

	@Override
	public Optional<User> findOne (Long id) {
		return userRepository.findById(id);
	}

	@Override
	public void addUser (User user) {
	  userRepository.save(user);
	}

	@Override
	public String deleteUser(Long id) {
		userRepository.deleteById(id);
		return "{'message': 'User deleted'}";
		
	}

}
