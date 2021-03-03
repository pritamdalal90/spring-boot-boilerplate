package com.terran.boilerplate.repository;

import com.terran.boilerplate.model.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TeamRepository extends JpaRepository<Team, Long> {

    public Optional<Team> findByName(String name);

}
