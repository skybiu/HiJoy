package hijoy.mvc.dao;

import org.springframework.stereotype.Repository;

import hijoy.mvc.po.User;

@Repository
public interface UserMapper {
	
	public void addUser(User user) throws Exception;
	
	public void deleteUser(User user) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public User findUser(User user) throws Exception;
	

}