package com.terran.boilerplate.model;

import java.io.Serializable;

import java.util.Date;
import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

//import com.terran.boilerplate.converters.YesNoEnumConverter;
import com.terran.boilerplate.converters.YesNoEnumConverter;
import com.terran.boilerplate.utils.CommonUtil.YesNoEnum;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "users")
public class User implements Serializable {

	private static final long serialVersionUID = 1299857863050803459L;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(unique = true, nullable = false)
	private Long id;

	@Column(name = "first_name", nullable = false, length = 250)
	private String firstName;

	@Column(name = "last_name", nullable = false, length = 250)
	private String lastName;

	@Column(name = "email", unique = true, nullable = false, length = 250)
	private String email;

	@Column(name = "password", columnDefinition = "TEXT")
	@JsonIgnore
	private String password;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_login", length = 19, nullable = true)
	private Date lastLogin;

	@Column(name = "auth_token", columnDefinition = "TEXT", nullable = true)
	private String authToken;

	@Column(name = "reset_token", columnDefinition = "TEXT", nullable = true)
	private String resetToken;

	@Column(length = 1, nullable = false)
	@Convert(converter = YesNoEnumConverter.class)
	private YesNoEnum active;

	@ManyToOne
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JoinColumn(name = "team_id")
	private Team team;


	public User() {
	}

	public User(Team team, String firstName, String lastName, String email, String password) {
		this.team = team;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.active = YesNoEnum.YES;
	}

  //Getter & Setter
	
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Team getTeam() {
		return this.team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getLastLogin() {
		return this.lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getAuthToken() {
		return this.authToken;
	}

	public void setAuthToken(String authToken) {
		this.authToken = authToken;
	}

	public String getResetToken() {
		return this.resetToken;
	}

	public void setResetToken(String resetToken) {
		this.resetToken = resetToken;
	}

	public YesNoEnum getActive() {
		return active;
	}

	public void setActive(YesNoEnum active) {
		this.active = active;
	}
}
