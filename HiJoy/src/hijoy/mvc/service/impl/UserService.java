package hijoy.mvc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hijoy.mvc.dao.UserMapper;
import hijoy.mvc.po.User;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public void addUser(User user) throws Exception{
		userMapper.addUser(user);
	}
	
	public void deleteUser(User user) throws Exception{
		userMapper.deleteUser(user);
	}
	
	public void updateUser(User user) throws Exception{
		userMapper.updateUser(user);
	}
	
	public User findUser(User user) throws Exception{
		return userMapper.findUser(user);
	}
}
