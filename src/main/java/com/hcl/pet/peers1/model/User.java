package com.hcl.pet.peers1.model;

import javax.persistence.*;


import java.util.List;
import java.util.Set;

@Entity
@Table(name="users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="user_id")
    private Long userId;
    
    @Column(name="user_name")
    private String userName;
    
    @Column(name="user_password")
    private String userPassword;
    
    @Transient
    private String confirmPassword;
    
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Pet> pets;
    
    public Long getUserId() {
        return userId;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    public String getUserName() {
        return userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public String getUserPassword() {
        return userPassword;
    }
    
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
    
    public String getConfirmPassword() {
        return confirmPassword;
    }
    
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
    
    public List<Pet> getPets() {
		return pets;
	}
    
    public void setPets(List<Pet> pets) {
		this.pets = pets;
	}

	public void addPet(Pet pet) {
		// TODO Auto-generated method stub
		
	}
}
