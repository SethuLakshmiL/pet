package com.hcl.pet.peers1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.hcl.pet.peers1.model.User;
import com.hcl.pet.peers1.repo.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	PasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private UserRepository userRepository;

    @Override
	public void save(User user) {
		user.setUserPassword(bCryptPasswordEncoder.encode(user.getUserPassword()));
		
		userRepository.save(user);
	}

	@Override
	public User findByUsername(String username) {
		return userRepository.findByUserName(username);
	}
	
	@Override
	public User authenticateUser(String username, String password) {
		User user = findByUsername(username);
        if (user != null && bCryptPasswordEncoder.matches(password, user.getUserPassword())) {
            return user;
	}
        return null; 
	}

	

	

	


}

