package com.terran.boilerplate.controllers;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import com.terran.boilerplate.entity.ApiResponse;
import com.terran.boilerplate.entity.UserAccessResponse;
import com.terran.boilerplate.entity.UserCreateUpdateEntity;
import com.terran.boilerplate.exceptions.BoilerplateExceptionHandler;
import com.terran.boilerplate.model.Team;
import com.terran.boilerplate.model.User;
import com.terran.boilerplate.repository.TeamRepository;
import com.terran.boilerplate.repository.UserRepository;
import com.terran.boilerplate.security.CurrentUser;
import com.terran.boilerplate.security.UserPrincipal;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    TeamRepository teamRepository;

    @Autowired
    PasswordEncoder passwordEncoder;


    @GetMapping("/list")
    public ApiResponse<Iterable<User>> users(@CurrentUser UserPrincipal currentUser) {
        Long currentUserId = currentUser.getId();
        return new ApiResponse<Iterable<User>>(HttpStatus.OK.value(), userRepository.findAllByIdNot(currentUserId));
    }

    @GetMapping("/list/paging")
    public Page<User> usersList(@RequestParam(defaultValue = "0") Integer pageNo, @RequestParam(defaultValue = "5") Integer pageSize, @RequestParam(defaultValue = "id") String sortBy) {

        return userRepository.findAll(PageRequest.of(pageNo, pageSize, Sort.by(sortBy)));
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ApiResponse<User> create(@RequestBody UserCreateUpdateEntity model, @CurrentUser UserPrincipal currentUser) throws Exception {
        User currentUserObj = userRepository.findById(currentUser.getId()).get();
        if (userRepository.existsByEmail(model.email)) {
            throw new Exception("Email is already taken!");
        }

        Optional<Team> team = teamRepository.findById(model.team);

        if (team.isPresent()) {
            User user = new User(team.get(), model.firstName, model.lastName, model.email, model.password);

            user.setPassword(passwordEncoder.encode(user.getPassword()));
            User savedUser = userRepository.save(user);
            return new ApiResponse<User>(HttpStatus.OK.value(), savedUser);

        } else {
            throw new Exception("Team not found!");
        }

    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public ApiResponse<String> delete(@PathVariable(value = "id") Long id) throws BoilerplateExceptionHandler {

        try {
            userRepository.deleteById(id);
        } catch (Exception e) {
            throw new BoilerplateExceptionHandler("User not found", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return new ApiResponse<String>(HttpStatus.OK.value(), "User record deleted");

    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ApiResponse<User> update(@RequestBody UserCreateUpdateEntity model) throws BoilerplateExceptionHandler {

        User user = userRepository.findById(model.id)
                .orElseThrow(() -> new BoilerplateExceptionHandler("User not found", HttpStatus.INTERNAL_SERVER_ERROR));
        user.setFirstName(model.firstName);
        user.setLastName(model.lastName);
        user.setEmail(model.email);
        return new ApiResponse<User>(HttpStatus.OK.value(), userRepository.save(user));

    }

    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public ApiResponse<User> view(@PathVariable(value = "id") Long id) throws BoilerplateExceptionHandler {

        User user = userRepository.findById(id)
                .orElseThrow(() -> new BoilerplateExceptionHandler("User not found", HttpStatus.INTERNAL_SERVER_ERROR));
        return new ApiResponse<User>(HttpStatus.OK.value(), user);

    }

    @RequestMapping(value = "/current", method = RequestMethod.GET)
    public ApiResponse<UserAccessResponse<User, UserPrincipal>> current(@CurrentUser UserPrincipal currentUser) throws BoilerplateExceptionHandler, IOException {

        User user = userRepository.findById(currentUser.getId()).orElseThrow(() -> new BoilerplateExceptionHandler("User not found", HttpStatus.INTERNAL_SERVER_ERROR));

        UserAccessResponse<User, UserPrincipal> map = new UserAccessResponse<User, UserPrincipal>(user, currentUser);

        return new ApiResponse<UserAccessResponse<User, UserPrincipal>>(HttpStatus.OK.value(), map);

    }

}
