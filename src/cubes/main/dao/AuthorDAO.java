package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Author;



public interface AuthorDAO {

	public List<Author> getAuthorList();
	
	public void saveAuthor(Author author);
	
	public Author getAuthor(int id);
	
	public void deleteAuthor(int id);
	
}
