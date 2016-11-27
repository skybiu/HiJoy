package hijoy.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Welcome {
	
	@RequestMapping("/welcome")
	public ModelAndView welcome(HttpSession session){
		ModelAndView modelAndView = new ModelAndView("welcome");
		modelAndView.addObject("username",session.getAttribute("username"));
		modelAndView.addObject("status",session.getAttribute("status"));
		return modelAndView;
	}
	
	@RequestMapping("/loginIn")
	public String loginIn(){
		return "login";
	}
	
	@RequestMapping("/loginOut")
	public String loginOut(){
		return "redirect:/loginCheck/loginOut.do";
	}
	
	@RequestMapping("/register")
	public String register(){
		return "register";
	}
}
