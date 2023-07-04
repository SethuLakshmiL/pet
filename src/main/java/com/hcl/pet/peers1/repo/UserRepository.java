package com.hcl.pet.peers1.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.hcl.pet.peers1.model.Pet;
import com.hcl.pet.peers1.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

	User findByUserName(String username);
	
	  


	
}

