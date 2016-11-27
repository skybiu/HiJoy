package hijoy.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import hijoy.mvc.po.User;
import hijoy.mvc.service.impl.UserService;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/registerCheck")
public class RegisterCheck {
	
	@Autowired
	UserService userService;
	@RequestMapping(value="/check",method=RequestMethod.POST,consumes = "application/json")
	public String check(@RequestBody User user,HttpSession session) throws Exception{
		System.out.println("用户信息\n"+user);
		User user2 = userService.findUser(user);
		if(user2==null){
			userService.addUser(user);
			return "forward:success.do";
		}
		else{
			return "redirect:fail.do";
		}
	}
	
	@RequestMapping("/fail")
	@ResponseBody
	public JSONObject fail() throws Exception{
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", 1);
		return jsonObject;
	}
	
	@RequestMapping("/success")
	@ResponseBody
	public JSONObject success(HttpSession session) throws Exception{
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", 0);
		return jsonObject;
	}
}
