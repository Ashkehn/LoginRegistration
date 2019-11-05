package springSecurity.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import springSecurity.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository  extends JpaRepository<User, String> {

	User findByEmail(String email);

	@Override
	@Query(value = "delete from user_roles where user_roles.user_email=?1 ", nativeQuery = true)
	@Modifying
	void deleteById(String s);

	@Query(value = "delete from user where `user`.email=?1 ", nativeQuery = true)
	@Modifying
	void deleteParent(String s);

	@Override
	List<User> findAll();

	@Override
	User getOne(String s);

	List<User> findByNameLike(String name);

}
