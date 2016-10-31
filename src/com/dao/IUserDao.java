package com.dao;
import java.util.List;

import com.entity.User;


public interface IUserDao {
	/*
	 * 登录验证
	 */
	public User validateUser(String username, String password);
	/*
	 * 获取所有用户	
	 */
	public List<User> getAllUsers();
	/*
	 * 修改用户信息	
	 */
	public boolean modify(int id, User newUser);
	/*
	 * 添加新用户
	 */
	public boolean addUser(User newUser);
	/*
	 * 删除用户
	 */
	public boolean deleteUser(int id);
	
}
