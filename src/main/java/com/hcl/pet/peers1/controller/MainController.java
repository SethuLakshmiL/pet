package com.hcl.pet.peers1.controller;

import java.security.Principal;


import java.util.ArrayList;


import java.util.List;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hcl.pet.peers1.model.Pet;
import com.hcl.pet.peers1.model.User;
import com.hcl.pet.peers1.repo.UserRepository;
import com.hcl.pet.peers1.service.PetService;
import com.hcl.pet.peers1.service.PetServiceImpl;
import com.hcl.pet.peers1.service.UserService;
import com.hcl.pet.peers1.service.UserServiceImpl;
import com.hcl.pet.peers1.validator.UserValidator;

@Controller

public class MainController {
	@Autowired
	private UserValidator userValidator;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PetService petService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registrationPage";
    }

	 @RequestMapping(value = "/", method = RequestMethod.POST)
	    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
	    	userValidator.validate(userForm, bindingResult);
	        if (bindingResult.hasErrors()) {
	            return "registrationPage";
	        }
	        userService.save(userForm);
	        return "redirect:/login";
	    }
	 @RequestMapping(value = { "/login"}, method = RequestMethod.GET)
	    public String login(Model model, String error, String logout, Object user) {
	        if (error != null)
	            model.addAttribute("error", "Your username and password is invalid.");
	        

	        if (logout != null)
	            model.addAttribute("message", "You have been logged out successfully.");

	        return "loginPage";
	    }
		
		@RequestMapping(value = "/login", method = RequestMethod.POST)
	    public String processLogin(@RequestParam String username, @RequestParam String password, HttpSession session, Model model) {
	        User user = userService.authenticateUser(username, password);
	        if (user != null) {
	            session.setAttribute("user", user);
	         
	            System.out.println("User object added to the session: " + user);

	            model.addAttribute("message", "you have successfully registered");
	            return "redirect:/welcome";
	 	       
	        } else {
	            return "redirect:/login?error=true";
	        }
	    }
		 
		 @RequestMapping(value = "/add", method = RequestMethod.GET)
		  public String addPetPage(Model model) {
		    model.addAttribute("pet", new Pet());
		    return "addPetPage";
		  }

		 @RequestMapping(value = "/add", method = RequestMethod.POST)
		 public String addPet(@Valid @ModelAttribute("pet") Pet petDto, BindingResult bindingResult, Model model, HttpSession session) {
		     if (bindingResult.hasErrors()) {
		         return "addPetPage";
		     }
		     User user = (User) session.getAttribute("user");
		     if (user == null) {
		         System.out.println("User object is null!");
		         // redirect to login page or handle the error appropriately
		     }
		     petDto.setUser(user);
		     Pet pet = petService.addPet(petDto);
		     model.addAttribute("pet", pet);
		     return "redirect:/welcome";
		 }

		
		 @RequestMapping(value = "/welcome", method = RequestMethod.GET)
		 public String welcome(Model model) {
		     List<Pet> pets = petService.getAllPets();
		     model.addAttribute("pets", pets);
		     return "welcome";
		 }
		 @RequestMapping(value = "/buyPet/{petId}", method = {RequestMethod.GET, RequestMethod.POST})
		 public String handlePetPurchase(@PathVariable("petId") Long petId, Model model, Principal principal) {
		     if (principal != null) {
	        	 System.out.println("User object is null!");

		         String username = principal.getName();
		         User user = userService.findByUsername(username);
		         Long userId = user.getUserId();

		         Pet pet = petService.fetchById(petId);

		         if (pet != null && pet.getUser() == null) {
		             pet.setUser(user);
		             petService.save(pet);
		             return "redirect:/myPets";
		         }
		     }

		     return "redirect:/welcome";
		 }




				
		 @RequestMapping(value = "/myPets", method = RequestMethod.GET)
		 public String myPets(Model model, Principal principal, HttpSession session) {
		     User user = (User) session.getAttribute("user");
		     Long userId = user.getUserId();
		     List<Pet> pets = petService.findByUserUserId(userId);

		     // Filter the pets list to show only the bought pets
		     List<Pet> boughtPets = new ArrayList<>();
		     for (Pet pet : pets) {
		         if (pet.isBought()) {
		             boughtPets.add(pet);
		         }
		     }
		     
		     model.addAttribute("pets", boughtPets);
		     return "myPetsPage";
		 }



		



}
