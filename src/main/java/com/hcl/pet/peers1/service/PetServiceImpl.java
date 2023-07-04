package com.hcl.pet.peers1.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.pet.peers1.model.Pet;
import com.hcl.pet.peers1.model.User;
import com.hcl.pet.peers1.repo.PetRepository;

@Service
public class PetServiceImpl implements PetService {

    @Autowired
    private PetRepository petRepository;

    @Override
    public List<Pet> getAllPets() {
        return petRepository.findAll();
    }
   
    @Override
    public Pet addPet(Pet pet) {
      return petRepository.save(pet);
    }
	
	@Override
	public Pet buyPet(Pet pet) {
		// TODO Auto-generated method stub
		return petRepository.findByUser(pet);
	}

	/*@Override
	public Pet fetchBYId(Long petId) {
		// TODO Auto-generated method stub
		Pet pet = petRepository.fetchById(petId);
		return pet;
	}
*/
	@Override
	public void save(Pet addPet) {
		// TODO Auto-generated method stub
		 petRepository.save(addPet);
	}

	@Override
    public Pet fetchById(Long petId) {
        return petRepository.findById(petId).orElse(null);
    }
	@Override
	public List<Pet> findByUserUserId(Long userId) {
	        return petRepository.findByUserUserId(userId);
	    }

	
		
	/*@Override
	public List<Pet> findAllById(Long petId) {
		// TODO Auto-generated method stub
		List<Pet> pet = petRepository.findAllById(petId);
		return pet;
	}
	
*/

	









	


}
