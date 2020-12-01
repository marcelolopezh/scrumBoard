package com.marcelo.scrumBoard.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marcelo.scrumBoard.models.Project;
import com.marcelo.scrumBoard.models.User;
import com.marcelo.scrumBoard.services.ProjectService;
import com.marcelo.scrumBoard.services.UserService;

@Controller
public class projectController {
	@Autowired
	UserService userService;
	@Autowired
	ProjectService projectService;
	
	@GetMapping("/createProject")
	public String principal(@ModelAttribute("user") User user, HttpSession session, @ModelAttribute("project") Project project, @ModelAttribute("map") HashMap<Long, Object> map) {
		if(session.getAttribute("loggedUser")!=null) {
			//List<User> usuarios = userService.findAll();
			//for(int i = 0; i<usuarios.size(); i++) {
			//	map.put(usuarios.get(i).getId(),usuarios.get(i));
			//}
			System.out.println("HAS ENTRADO A CREAR PROYECTO");
			// CODIGO PARA LIMPIAR LA VARIABLE DE SESION AL MOMENTO DE RECARGAR LA PAGINA POR ABC MOTIVO
			Long id = (Long) session.getAttribute("loggedUser");
			ArrayList<User> userListSession = new ArrayList<User>();
			ArrayList<User> clientListSession = new ArrayList<User>();
			userListSession.add(userService.findById(id));
			clientListSession.add(userService.findById(id));
			session.setAttribute("userListSession", userListSession);
			session.setAttribute("clientListSession", clientListSession);
			return "plataforma/projects/createProject.jsp";
		}else {
			return "login.jsp";
		}
	}
	@PostMapping("/createProject")
	public String principal(@ModelAttribute("project") Project project, HttpSession session) {
		List<User> userListSession = (List<User>) session.getAttribute("userListSession");
		List<User> clientListSession = (List<User>) session.getAttribute("clientListSession");
		User user = userService.findById((Long)session.getAttribute("loggedUser"));
		// REMOVER AL PRIMER ELEMENTO (EL USUARIO LOGEADO).
		userListSession.remove(0);
		clientListSession.remove(0);
		
		
		System.out.println("\n USUARIOS AGREGADOS EN SESION:");
		for(int i = 0 ; i < userListSession.size() ; i++ ) {
			System.out.println( userListSession.get(i).getEmail() );
		}
		System.out.println("\n CLIENTES AGREGADOS EN SESION:");
		for(int i = 0 ; i < clientListSession.size() ; i++ ) {
			System.out.println( clientListSession.get(i).getEmail() );
		}
		
		
		
		project.setMembers(userListSession);
		project.setClients(clientListSession);
		Long id = (Long) session.getAttribute("loggedUser");
		project.setUser(userService.findById(id));
		projectService.createProject(project);	
		
		// LIMPIANDO VARIABLES 
		//userListSession.clear();
		//clientListSession.clear();
		userListSession.add(userService.findById(id));
		clientListSession.add(userService.findById(id));
		
		session.setAttribute("userListSession", userListSession);
		session.setAttribute("clientListSession", clientListSession);
		return "redirect:/createProject";
	}
	
	@RequestMapping(value = "/searchUser", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	Boolean searchUser(@RequestParam("email") String email, HttpSession session) {
		List<User> userListSession = (List<User>) session.getAttribute("userListSession");
		List<User> clientListSession = (List<User>) session.getAttribute("clientListSession");

		User user = userService.findByEmail(email);
		boolean flag = false;
		for(int i = 0 ; i < userListSession.size(); i++) {
			if(userListSession.get(i).getEmail().toLowerCase().equals(email.toLowerCase())) {
				flag = true;
			}
		}
		
		for(int i = 0 ; i < clientListSession.size(); i++) {
			if(clientListSession.get(i).getEmail().toLowerCase().equals(email.toLowerCase())) {
				flag = true;
			}
		}
		
		
		if(user==null) {
			return false;
		}
		
		
		if(flag) {
			return false;
		}else {
			userListSession.add(user);
			session.setAttribute("userListSession", userListSession);
			return true;
		}		
	}
	
	@RequestMapping(value = "/searchUserClient", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	Boolean searchUserClient(@RequestParam("email") String email, HttpSession session) {
		List<User> userListSession = (List<User>) session.getAttribute("userListSession");
		List<User> clientListSession = (List<User>) session.getAttribute("clientListSession");

		User user = userService.findByEmail(email);
	
		boolean flag = false;
		for(int i = 0 ; i < clientListSession.size(); i++) {
			if(clientListSession.get(i).getEmail().toLowerCase().equals(email.toLowerCase())) {
				flag = true;
			}
		}
		for(int i = 0 ; i < userListSession.size(); i++) {
			if(userListSession.get(i).getEmail().toLowerCase().equals(email.toLowerCase())) {
				flag = true;
			}
		}
		
		if(user==null) {
			return false;
		}
		
		if(flag) {
			return false;
		}else {
			clientListSession.add(user);
			session.setAttribute("clientListSession", clientListSession);
			return true;
		}		
	}
	
	
}
