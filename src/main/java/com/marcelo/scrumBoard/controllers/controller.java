package com.marcelo.scrumBoard.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.marcelo.scrumBoard.models.User;
import com.marcelo.scrumBoard.services.UserService;

@Controller
public class controller {
	@Autowired
	UserService userService;
	
	@GetMapping("/")
	public String principal(@ModelAttribute("user") User user, HttpSession session, Model model) {
		if(session.getAttribute("loggedUser")!=null) {
			model.addAttribute("loggedUser", userService.findById((Long) session.getAttribute("loggedUser")));
			return "plataforma/index.jsp";
		}else {
			return "login.jsp";
		}
	}
	
	/* FUNCIONES PARA LOGIN */
	@GetMapping("/login")
	public String login(@ModelAttribute("user") User user, HttpSession session) {
		if(session.getAttribute("loggedUser")!=null) {
			return "plataforma/index.jsp";
		}else {
			return "login.jsp";
		}
	}
	
	@PostMapping("/login")
	public String loginPost(@ModelAttribute("user") User user, Model model, HttpSession session) {
		boolean isDataCorrect = userService.authenticateUser(user.getEmail(), user.getPassword());
		User userLogged = userService.findByEmail(user.getEmail());
		ArrayList<User> userList = new ArrayList<User>();
		ArrayList<User> clientList = new ArrayList<User>();
		userList.add(user);
		clientList.add(user);
		if(isDataCorrect) {
			session.setAttribute("loggedUser", userService.findByEmail(user.getEmail()));
			session.setAttribute("userListSession", userList);
			session.setAttribute("clientListSession", clientList);
			return "plataforma/index.jsp";
		}else {
			boolean booleanError = true;
			String mensaje = "Credenciales inválidas";
			model.addAttribute("booleanError",booleanError);
			model.addAttribute("mensaje",mensaje);
			return "login.jsp";
		}
	}
	
	/* FUNCIONES PARA REGISTRO */
	@GetMapping("/registro")
	public String registro(@ModelAttribute("user") User user, HttpSession session) {
		if(session.getAttribute("loggedUser")!=null) {
			return "plataforma/index.jsp";
		}else {
			return "registro.jsp";
		}
		
	}
	@PostMapping("/registro")
	public String registroPost(@ModelAttribute("user") User user, BindingResult result, HttpSession session, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("booleanError", true);
			model.addAttribute("mensaje", "La contraseña es demasiado débil");
			return "registro.jsp";
		}else {
			if(!user.getPassword().equals(user.getPasswordConfirmation())) {
				model.addAttribute("booleanError", true);
				model.addAttribute("mensaje", "Las contraseñas no coinciden");
				return "registro.jsp";
			}else {
				// IF PARA SABER SI EXISTE O NO OTRO USUARIO REGISTRADO CON EL MISMO CORREO
				if(userService.findByEmail(user.getEmail())==null) {
					User userRegistered = userService.register(user);
					session.setAttribute("loggedUser", userRegistered.getId());
					return "redirect:/";
				}else {
					model.addAttribute("booleanError", true);
					model.addAttribute("mensaje", "El correo ya se encuentra registrado");
					return "registro.jsp";
				}
			}
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("loggedUser")!=null) {
			session.setAttribute("loggedUser", null);
			session.invalidate();
		}
		return "redirect:/";
	}
}
