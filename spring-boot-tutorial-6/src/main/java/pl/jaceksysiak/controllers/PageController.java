package pl.jaceksysiak.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	  @RequestMapping("/")
	  String index() {
	    return "index";
	  }
	  
	  @RequestMapping("/about")
	  String about() {
	    return "about";
	  }
	  
	  @RequestMapping("/info")
	  String info() {
	    return "info";
	  }
    
	  @RequestMapping("/hello")
	  String hello() {
	    return "hello";
	  }
}
