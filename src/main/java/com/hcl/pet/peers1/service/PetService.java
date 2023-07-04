package com.hcl.pet.peers1.service;

import java.util.List;
import java.util.Optional;

import com.hcl.pet.peers1.model.Pet;
import com.hcl.pet.peers1.model.User;

public interface PetService {
    List<Pet> getAllPets();   
    
	Pet addPet(Pet pet);
	
	Pet buyPet(Pet pet);


	void save(Pet pet);

	Pet fetchById(Long petId);

	

	List<Pet> findByUserUserId(Long userId);

	//List<Pet> findAllById(Long petId);

	//Pet fetchBYId(Long petId);
	
  



	
	
}
