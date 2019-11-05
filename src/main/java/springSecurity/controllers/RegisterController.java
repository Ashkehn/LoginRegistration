package springSecurity.controllers;

import javax.validation.Valid;

import springSecurity.entities.User;
import springSecurity.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class RegisterController {
	@Autowired
	private UserService userService;
	@GetMapping("/register")
	public String registerForm(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}
	@PostMapping("/register")
    public String registerUser(@Valid User user, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
            model.addAttribute("name_pass",true);
			return "register";
		}
		if(userService.isUserPresent(user.getEmail())) {
			model.addAttribute("exist",true);
			return "register";
		}

		userService.createUser(user);
		model.addAttribute("success","successfuly registered");
		return "loginForm";
	}
}
