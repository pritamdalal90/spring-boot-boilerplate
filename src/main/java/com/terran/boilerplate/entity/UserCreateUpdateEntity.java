package com.terran.boilerplate.entity;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

public class UserCreateUpdateEntity {

    public Long id;

    @NotBlank
    public String firstName;

    @NotBlank
    public String lastName;

    @NotBlank
    @Email
    public String email;

    @NotBlank
    public String password;

    @NotBlank
    public Long team;

    public UserCreateUpdateEntity() {
    }

    public UserCreateUpdateEntity(Long team, String firstName, String lastName, String email, String password) {
        this.team = team;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }

}
