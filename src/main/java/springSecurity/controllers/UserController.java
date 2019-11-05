package springSecurity.controllers;

import org.springframework.data.domain.Sort;
import springSecurity.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/users")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String listUsers(Model model, @RequestParam(defaultValue="")  String name, Authentication authentication) {
		model.addAttribute("users", userService.allUsers());
		model.addAttribute("role",authentication.getAuthorities());
		userService.allUsers().forEach(System.out::println);

		return "profile";
	}
	@GetMapping("/delete")
	public String remove(@RequestParam(defaultValue="get")  String get) {
          userService.delete(get);

		return "redirect:users";
	}
}
