package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Blog;
import cubes.main.entity.Blog;

public interface BlogDAO {

	
	public List<Blog> getBlogList(); 
	
	public void saveBlog(Blog blog);
	
	public Blog getBlog(int id);
	
	public Blog getBlogWithTag(int id);
		
	public void delete(int id);
	
	public List<Blog> getBlogOnMainPage();
	
	public List<Blog> getBlogListByCategory(int id);
	
	public List<Blog> getBlogListByTag(int id);
	
	public List<Blog> getBlogByAuthor(int id);
	
	
	
	
	
	
}
