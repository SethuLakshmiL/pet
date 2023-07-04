package com.hcl.pet.peers1.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hcl.pet.peers1.model.Pet;
import com.hcl.pet.peers1.model.User;

import java.util.List;

@Repository
public interface PetRepository extends JpaRepository<Pet, Long> {
    List<Pet> findByUser(User user);

	Pet save(Long petId);

	Pet getById(Long petId);

	Pet findByUser(Pet pet);

	List<Pet> findByUserUserId(Long userId);
	//Pet fetchById(Long eid);

	//List<Pet> findAllById(Long petId);

	
}

