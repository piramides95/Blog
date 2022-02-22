package cubes.main.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table
public class Tag {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	@Size(min = 3, max = 20, message = "min 3, max 20 characters")
	private String name;
	
	@ManyToMany
	@JoinTable(name="blog_tag", joinColumns = @JoinColumn(name="id_tag"), inverseJoinColumns = @JoinColumn(name="id_blog"))
	private List<Blog> blog;
	
	public Tag() {
		// TODO Auto-generated constructor stub
	}
	
	public Tag(String name) {
		super();
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
	public List<Blog> getBlog() {
		return blog;
	}

	public void setBlog(List<Blog> blog) {
		this.blog = blog;
	}

	@Override
	public String toString() {
	
		return "("+ id + ") - " + name;
	}
	
}
