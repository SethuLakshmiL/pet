package com.hcl.pet.peers1.service;

import com.hcl.pet.peers1.model.User;

public interface UserService {
    void save(User user);
    
    User findByUsername(String username);
    User authenticateUser(String username, String password);

	

	
}