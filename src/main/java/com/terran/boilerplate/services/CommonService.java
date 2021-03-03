package com.terran.boilerplate.services;

import com.terran.boilerplate.model.*;
import com.terran.boilerplate.repository.TeamRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommonService {

    @Autowired
    TeamRepository teamRepository;

}
