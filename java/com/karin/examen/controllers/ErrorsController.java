package com.karin.examen.controllers;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorsController implements ErrorController{
	 @RequestMapping("/error")
	    public String handleError() {
	        //do something like logout
	        return "redirect:/";
	    }

	    @Override
	    public String getErrorPath() {
	        return null;
	    }


}
