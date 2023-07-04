package com.hcl.pet.peers1.model;

import javax.persistence.*;
import java.lang.*;

@Entity
@Table(name = "pets")
public class Pet {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pet_id")
	private Long petId;

	@Column(name = "pet_Name")
	private String petName;

	@Column(name = "pet_Age")
	private Integer petAge;

	@Column(name = "pet_place")
	private String petPlace;

	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;

	public Long getPetId() {
		return petId;
	}

	public void setPetId(Long petId) {
		this.petId = petId;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public Integer getPetAge() {
		return petAge;
	}

	public void setPetAge(Integer petAge) {
		this.petAge = petAge;
	}

	public String getPetPlace() {
		return petPlace;
	}

	public void setPetPlace(String petPlace) {
		this.petPlace = petPlace;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
		 
	}

	public boolean isSold() {
		// TODO Auto-generated method stub
		return false;
	}

	

	public void setSold(boolean b) {
		// TODO Auto-generated method stub

	}

	public void setAvailable(boolean b) {
		// TODO Auto-generated method stub

	}

	public boolean isAvailable() {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean isBought() {
		// TODO Auto-generated method stub
		return false;
	}
}
