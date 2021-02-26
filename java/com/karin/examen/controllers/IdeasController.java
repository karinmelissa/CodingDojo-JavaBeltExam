package com.karin.examen.controllers;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.karin.examen.models.Ideas;
import com.karin.examen.models.User;
import com.karin.examen.services.IdeasService;
import com.karin.examen.services.UserService;

@Controller
public class IdeasController {
	private final IdeasService ideasServ;
	private final UserService uServ;
	
	public IdeasController(IdeasService ideasServ,UserService uServ) {
		this.ideasServ = ideasServ;
		this.uServ = uServ;
	}
	@RequestMapping("/ideas")
    public String Ideas(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
    	User user = uServ.findUserById(userId);
    	model.addAttribute("user", user);
    	Iterable<Ideas> ideas = ideasServ.allIdeas();
        model.addAttribute("ideas", ideas);
        return "ideasPage.jsp";
    }
	@RequestMapping("/ideas/lowest")
	public String homeL(HttpSession session, Model model) {
		Long uID = (Long) session.getAttribute("userId");
		User user = uServ.findUserById(uID);
		Iterable<Ideas> ideas = ideasServ.allIdeasDsc();
		model.addAttribute("ideas", ideas);
		model.addAttribute("user", user);
		return "ideasPage.jsp";

	}
	@RequestMapping("/ideas/highest")
	public String homeH(HttpSession session, Model model) {
		Long uID = (Long) session.getAttribute("userId");
		User user = uServ.findUserById(uID);
		Iterable<Ideas> ideas = ideasServ.allIdeasAsc();
		model.addAttribute("ideas", ideas);
		model.addAttribute("user", user);
		return "ideasPage.jsp";

	}
	@RequestMapping("/ideas/new")
	public String createForm(Model model, @ModelAttribute("idea") Ideas idea) {
		return "NewIdea.jsp";

	}

	@RequestMapping(value = "/ideas/new", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("ideas") Ideas idea, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "redirect:/ideas/new";
		}
		Long uID = (Long) session.getAttribute("userId");
		String userName = uServ.findUserById(uID).getName();
		idea.setCreatedBy(userName);
		idea.setLikes(0);
		ideasServ.createIdea(idea);
		return "redirect:/ideas";
	}
	
	@RequestMapping(value = "/ideas/{id}")
	public String show(@PathVariable("id") Long id, Model model, HttpSession session) {
		Ideas ideas = ideasServ.findIdea(id);
		Long uID = (Long) session.getAttribute("userId");
		User user = uServ.findUserById(uID);
		model.addAttribute("user", user);
		model.addAttribute("ideas", ideas);
		return "ShowIdea.jsp";
	}

	@RequestMapping(value = "/ideas/{id}/delete", method = RequestMethod.POST)
	public String destroy(@PathVariable("id") Long id) {
		ideasServ.deleteIdea(id);
		return "redirect:/ideas";
	}

	@RequestMapping(value = "/ideas/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Ideas ideas = ideasServ.findIdea(id);
		model.addAttribute("ideas", ideas);
		return "edit.jsp";
	}

	@RequestMapping(value = "/ideas/{id}/edit", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("idea") Ideas idea, BindingResult result, HttpSession session, @PathVariable("id") Long id) {
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			Ideas i = ideasServ.findIdea(id);
			Long uID = (Long) session.getAttribute("userId");
			String userName = uServ.findUserById(uID).getName();
			if (! i.getCreatedBy().equals(userName))
				return "redirect:/ideas";
			i.setTitle(idea.getTitle());
			ideasServ.updateIdea(i);
			return "redirect:/ideas/" + i.getId();
		}
	}
	
	@RequestMapping(value = "/ideas/{id}/like")
	public String like(@PathVariable("id") Long id, Model model,HttpSession session) {
		Ideas ideas = ideasServ.findIdea(id);
		Long UID=(Long) session.getAttribute("userId");
		User user = uServ.findUserById(UID);
    	List<User> users =ideas.getUsers();
    	ideas.setLikes(ideas.getLikes()+1);
    	users.add(user);
    	ideas.setUsers(users);
		ideasServ.updateIdea(ideas);
		return "redirect:/ideas";
		}
	
	@RequestMapping(value = "/ideas/{id}/Unlike")
	public String Unlike(@PathVariable("id") Long id, Model model,HttpSession session) {
		Ideas idea = ideasServ.findIdea(id);
		User user = uServ.findUserById((Long) session.getAttribute("userId"));
    	List<User> users =idea.getUsers();
    	idea.setLikes(idea.getLikes()-1);
    	users.remove(user);
    	idea.setUsers(users);
		ideasServ.updateIdea(idea);
		return "redirect:/ideas";
		}

}
