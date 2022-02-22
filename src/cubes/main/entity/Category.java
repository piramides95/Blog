package cubes.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

@Entity
@Table
public class Category {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	@Size(min = 3, max = 20, message = "min 3, max 20 characters")
	private String name;
	@Transient
	private long count;
	@Transient
	private boolean isOnBlogPage;
	
	public Category() {
		
	}
	
	public Category(String name) {
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
	
	
	
	
	
	public boolean getIsOnBlogPage() {
		return isOnBlogPage;
	}

	public void setIsOnBlogPage(boolean isOnBlogPage) {
		this.isOnBlogPage = isOnBlogPage;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}
	
	

	@Override
	public String toString() {
		
		return "("+ id + ") - " + name;
	}
	
	
}
