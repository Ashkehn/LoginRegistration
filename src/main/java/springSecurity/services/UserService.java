package springSecurity.services;

import java.util.ArrayList;
import java.util.List;

import springSecurity.entities.Role;
import springSecurity.entities.User;
import springSecurity.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.PreRemove;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	@Transactional
	public void createUser(User user) {
		BCryptPasswordEncoder  encoder = new  BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword())); 
		Role userRole = new Role(user.getRol()[0]);
		List<Role> roles = new ArrayList<>();
		roles.add(userRole);
		user.setRoles(roles);
		userRepository.save(user);
	}

	public boolean isUserPresent(String email) {
		User u=userRepository.findByEmail(email);
		if(u!=null)
			return true;
		return false;
	}

	public List<User> allUsers() {
		List<User> list = userRepository.findAll(Sort.by(Sort.Direction.ASC, "random"));
		return  list;
	}
	@javax.transaction.Transactional
	@PreRemove
	public boolean delete(String email) {
		 userRepository.deleteById(email);
		 userRepository.deleteParent(email);
		return  true;
	}

}
