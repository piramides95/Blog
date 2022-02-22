package cubes.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;



@Entity
@Table
public class Contact {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column
	@NotNull
	@NotEmpty(message = "Required")
	private String name;
	@Column
	@NotNull
	@NotEmpty(message = "Required")
	private String email;
	@Column
	@NotNull
	@NotEmpty(message = "Required")
	private String message;
	@Column
	private boolean isSeen;
	
	public Contact() {
		
	}

	public Contact(String name, String email, String message, Boolean isSeen) {
		super();
		this.name = name;
		this.email = email;
		this.message = message;
		this.isSeen = isSeen;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	public boolean getIsSeen() {
		return isSeen;
	}

	public void setIsSeen(boolean isSeen) {
		this.isSeen = isSeen;
	}

	@Override
	public String toString() {
		
		return "("+ id + ") - " + name;
	}
	
	
	
	
}
