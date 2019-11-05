package springSecurity.entities;

import java.io.Serializable;
import java.util.List;
import java.util.Random;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.Transient;

@Entity
@Table(name = "user")
public class User implements Serializable {

	@Id
	@Email
	@NotNull(message = "Email can not be empty")
	@Column(unique = true)
	private String email;
	@NotNull(message = "can not be empty")
	private String name;
	@Size(min =6)
	private String password;
	private int age;
	private int random=new Random().nextInt(9000)+10000;;

	public int getAge() {

		return age;
	}

	public void setAge(int age) {

		this.age = age;
	}

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "USER_ROLES", joinColumns={
			@JoinColumn(name = "USER_EMAIL", referencedColumnName = "email") }, inverseJoinColumns = {
					@JoinColumn(name = "ROLE_NAME", referencedColumnName = "name") })
	private List<Role> roles;
	@Transient
    private transient String[] rol;

	public String[] getRol() {

		return rol;
	}

	public void setRol(String[] rol) {

		this.rol = rol;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public User(String email, String name, String password) {
		this.email = email;
		this.name = name;
		this.password = password;
	}

	public User() {

	}

	public int getRandom() {

		return random;
	}

	public void setRandom(int random) {

		this.random = random;
	}
}
