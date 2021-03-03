package com.terran.boilerplate.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.terran.boilerplate.converters.YesNoEnumConverter;
import com.terran.boilerplate.utils.CommonUtil.YesNoEnum;
import com.fasterxml.jackson.annotation.JsonBackReference;

//TODO: relations for Module and team in `team_modules_mapping` table is not cascade on delete.. need to fix that. right now it's done manually
@Entity
@Table(name = "team")
public class Team implements Serializable {


    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;

    @NotBlank
    private String name;

    @NotBlank
    @Column(length = 1, nullable = false)
    @Convert(converter = YesNoEnumConverter.class)
    private YesNoEnum active;

    public Team() {
        super();
    }

    public Team(String name) {
        super();
        this.name = name;
    }

    public Team(String name, YesNoEnum active) {
        super();
        this.name = name;
        this.active = active;
    }

    // Getter & Setter

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}