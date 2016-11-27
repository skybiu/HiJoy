package hijoy.mvc.controller;

import net.sf.json.JSONObject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hijoy.mvc.po.User;
import hijoy.mvc.service.impl.UserService;

@Controller
@RequestMapping("/loginCheck")
public class LoginCheck {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/loginIn",method=RequestMethod.POST)
	public String check(@RequestBody User user,HttpSession session) throws Exception{
		System.out.println(user);
		User user2 = userService.findUser(user);
		System.out.println(user2);
		if(user2==null)
			return "redirect:noUser.do";
		else{
			if(user2.getPassword().equals(user.getPassword())){
				session.setAttribute("username", user.getUsername());
				session.setAttribute("status", 1);
				return "forward:success.do";
			}
			else return "redirect:fail.do";
		}
	}
	
	@RequestMapping("/noUser")
	@ResponseBody
	public JSONObject noUser() throws Exception{
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", -1);
		return jsonObject;
	}
	
	@RequestMapping("/fail")
	@ResponseBody
	public JSONObject fail() throws Exception{
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", 0);
		return jsonObject;
	}
	
	@RequestMapping("/success")
	@ResponseBody
	public JSONObject success(HttpSession session) throws Exception{
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("username",session.getAttribute("username"));
		jsonObject.put("result", 1);
		return jsonObject;
	}
	
	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session) throws Exception{
		session.setAttribute("status", 0);
		return "welcome";
	}
}
