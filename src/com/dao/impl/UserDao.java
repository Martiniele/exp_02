package com.dao.impl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.dao.IUserDao;
import com.entity.User;
import com.utils.HibernateSessionFactory;

public class UserDao implements IUserDao {

	/**
	 * 验证用户登录
	 */
	@Override
	public User validateUser(String username, String password) {
		String hql = "from User u where u.username=? and u.password=?";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setParameter(0, username);
		query.setParameter(1, password);
		List<User> users = query.list();
		if (users.size() != 0) {
			User user = users.get(0);
			return user;
		}
		HibernateSessionFactory.closeSession();
		return null;
	}

	/**
	 * 获取所有用户信息
	 */
	@Override
	public List<User> getAllUsers() {
		String hql = "from User u";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		List<User> users = query.list();
		HibernateSessionFactory.closeSession();
		return users;
	}
	
	/**
	 * 修改用户信息
	 */
	@Override
	public boolean modify(int id, User newUser) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = session.beginTransaction();
		try {
			User user = (User) session.get(User.class, id);
			user.setUsername(newUser.getUsername());
			user.setPassword(newUser.getPassword());
			session.update(user);
			transaction.commit();
			return true;
		} catch (Exception e) {
			transaction.rollback();
			System.err.println(e.getMessage());
			return false;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	
	/**
	 * 添加新用户
	 */
	@Override
	public boolean addUser(User newUser) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(newUser);
			transaction.commit();
			return true;
		} catch (Exception e) {
			transaction.rollback();
			System.err.println(e.getMessage());
			return false;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	
	/**
	 * 删除用户信息
	 */
	@Override
	public boolean deleteUser(int id) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = session.beginTransaction();

		try {
			User user = (User) session.get(User.class, id);
			session.delete(user);
			transaction.commit();
			return true;
		} catch (Exception e) {
			transaction.rollback();
		
			return false;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
}
