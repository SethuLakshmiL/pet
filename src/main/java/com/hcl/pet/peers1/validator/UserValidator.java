package com.hcl.pet.peers1.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.hcl.pet.peers1.service.UserService;
import com.hcl.pet.peers1.model.*;

@Component
public class UserValidator implements Validator {
    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "NotEmpty");
        if (user.getUserName().length() < 4 || user.getUserName().length() > 32) {
            errors.rejectValue("username", "Size.userForm.userName");
        }
        if (userService.findByUsername(user.getUserName()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.userName");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPassword", "NotEmpty");
        if (user.getUserPassword().length() < 4 || user.getUserPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.userPassword");
        }

        if (!user.getConfirmPassword().equals(user.getUserPassword())) {
            errors.rejectValue("ConfirmPassword", "Diff.userForm.ConfirmPassword");
        }
    }
}