package com.marcelo.scrumBoard.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.marcelo.scrumBoard.services.ProjectService;
import com.marcelo.scrumBoard.services.UserService;

@RestController
public class restController {
	@Autowired
	UserService userService;
	@Autowired
	ProjectService projectService;
	
	
	@GetMapping("/getDataRandom/{id}")
	public String getDataRandom(@PathVariable("id") Long id) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
        //Converting the Object to JSONString
        String jsonString = mapper.writeValueAsString(projectService.findById(id));
        return jsonString;
	}
	@GetMapping("/getDataRandomNumber")
	public String getDataRandomNumber(@PathVariable("id") Long id) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
        //Converting the Object to JSONString
        String jsonString = mapper.writeValueAsString(projectService.findById(id));
        return jsonString;
	}

}
