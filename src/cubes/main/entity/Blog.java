package cubes.main.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.Valid;
import javax.validation.constraints.Size;

@Entity
@Table
public class Blog {
	
@Id
@Column
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
@Column
@Size(min = 3, max = 40, message = "min 3, max 40 characters")
private String name;
@Column
@Size(max = 200, message = "max 200 characters")
private String image;
@Column
private int enableOrDisable;
@Column
private int importance;

//private int idCategory;
@Column
private int commentsNumber;
@Column
private int viewNumber;
@JoinColumn(name = "idAuthor")
@OneToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
private Author author;


@Column
private String time;
@Column
private String text;
@Column
private boolean isOnMainPage;

@Column
private boolean isOnMenu;










@JoinColumn(name = "idCategory")
@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
private Category category;

@ManyToMany(cascade = {CascadeType.DETACH,CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
@JoinTable(name = "blog_tag", joinColumns = @JoinColumn(name="id_blog"), inverseJoinColumns = @JoinColumn(name="id_tag"))
private List<Tag> tags;


public Blog() {
	
}


public Blog(String name, String description, String image, int enableOrDisable, int importance, int commentsNumber,
		int viewNumber, Author author, String time, String text) {
	super();
	this.name = name;
	this.image = image;
	this.enableOrDisable = enableOrDisable;
	this.importance = importance;
	this.commentsNumber = commentsNumber;
	this.viewNumber = viewNumber;
	this.author = author;
	this.time = time;
	this.text = text;
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

public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public int getEnableOrDisable() {
	return enableOrDisable;
}
public void setEnableOrDisable(int enableOrDisable) {
	this.enableOrDisable = enableOrDisable;
}
public int getImportance() {
	return importance;
}
public void setImportance(int importance) {
	this.importance = importance;
}
public int getCommentsNumber() {
	return commentsNumber;
}
public void setCommentsNumber(int commentsNumber) {
	this.commentsNumber = commentsNumber;
}
public int getViewNumber() {
	return viewNumber;
}
public void setViewNumber(int viewNumber) {
	this.viewNumber = viewNumber;
}

public Author getAuthor() {
	return author;
}
public void setAuthors(Author author) {
	this.author = author;
}


public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getText() {
	return text;
}
public void setText(String text) {
	this.text = text;
}




public Category getCategory() {
	return category;
}


public void setCategory(Category category) {
	this.category = category;
}




public List<Tag> getTags() {
	return tags;
}


public void setTags(List<Tag> tags) {
	this.tags = tags;
}



public void setAuthor(Author author) {
	this.author = author;
}


public boolean getIsOnMainPage() {
	return isOnMainPage;
}


public void setIsOnMainPage(boolean isOnMainPage) {
	this.isOnMainPage = isOnMainPage;
}

public boolean getIsOnMenu() {
	return isOnMenu;
}


public void setIsOnMenu(boolean isOnMenu) {
	this.isOnMenu = isOnMenu;
}





@Override
public String toString() {
	
	return "("+ id + ") - " + name;
}


}
