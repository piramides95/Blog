package cubes.main.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cubes.main.entity.Blog;
import cubes.main.entity.Tag;


@Repository
public class BlogDAOImpl implements BlogDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	@Override
	public List<Blog> getBlogList() {
		Session session  = sessionFactory.getCurrentSession();
		
		Query<Blog> query = session.createQuery("from Blog ", Blog.class);
		
		List<Blog> blogList = query.getResultList();
		
		return blogList;
	}

	@Transactional
	@Override
	public void saveBlog(Blog blog) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(blog);
		
	}

	@Transactional
	@Override
	public void delete(int id) {
		
		
		Session session  = sessionFactory.getCurrentSession();
		
		Blog b = session.get(Blog.class, id);
		
		
		session.delete(b);
	}

	@Transactional
	@Override
	public Blog getBlogWithTag(int id) {
		
        Session session  = sessionFactory.getCurrentSession();
		
		Blog blog = session.get(Blog.class, id);
		Hibernate.initialize(blog.getTags());
		
		return blog;
	}
	
	@Transactional
	@Override
	public Blog getBlog(int id) {
		
        Session session  = sessionFactory.getCurrentSession();
		
		Blog b = session.get(Blog.class, id);
		
		return b;
	}

	@Transactional
	@Override
	public List<Blog> getBlogOnMainPage() {
	    Session session  = sessionFactory.getCurrentSession();
	    
	    Query<Blog> query = session.createQuery("select b from Blog b where b.isOnMainPage = 1");
	    
	    List<Blog> list = query.getResultList();
  
		return list;
	}

	@Transactional
	@Override
	public List<Blog> getBlogListByCategory(int id) {
		 Session session  = sessionFactory.getCurrentSession();
		 
		 Query<Blog> query = session.createQuery("from Blog blog where blog.category.id = :id ");
		 query.setParameter("id", id);
		 
		return query.getResultList();
	}

	@Transactional
	@Override
	public List<Blog> getBlogListByTag(int id) {
		 Session session  = sessionFactory.getCurrentSession();
		 
		Tag tag = session.get(Tag.class, id);
		
		Hibernate.initialize(tag.getBlog());
		
		System.out.println(tag.getBlog());
		 
		return tag.getBlog();
	}

	@Transactional
	@Override
	public List<Blog> getBlogByAuthor(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		 Query<Blog> query = session.createQuery("from Blog blog where blog.author.id = :id ");
		
		 query.setParameter("id", id);
		 
		 System.out.println(query.getResultList());
		 
			return query.getResultList();
	}

	


	
	

}
