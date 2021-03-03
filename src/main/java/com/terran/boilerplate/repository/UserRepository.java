package com.terran.boilerplate.repository;

import com.terran.boilerplate.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);

//	static Team getRoles() {
//		return null;
//	}

    Boolean existsByEmail(String email);

    List<User> findAllByIdNot(Long Id);

}
