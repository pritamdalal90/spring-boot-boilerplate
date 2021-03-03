package com.terran.boilerplate.controllers;

import com.terran.boilerplate.entity.ApiResponse;
import com.terran.boilerplate.model.Team;
import com.terran.boilerplate.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/common")
public class CommonController {

    @Autowired
    TeamRepository teamRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @GetMapping("/teams")
    public ApiResponse<Iterable<Team>> teams() {
        passwordEncoder.encode("password");
        return new ApiResponse<Iterable<Team>>(HttpStatus.OK.value(), teamRepository.findAll());
    }

    @GetMapping("/generate-password-hash")
    public ApiResponse<String> generatePasswordHash() {
        return new ApiResponse<String>(HttpStatus.OK.value(), passwordEncoder.encode("password").toString());
    }
}
