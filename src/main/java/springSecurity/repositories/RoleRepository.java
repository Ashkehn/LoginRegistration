package springSecurity.repositories;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import springSecurity.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository  extends JpaRepository<Role, String>{
	@Query(value = "delete from user_roles where user_roles.user_email=:s", nativeQuery = true)
	@Modifying
	void deleteById(String s);
}
