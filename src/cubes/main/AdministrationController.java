package cubes.main;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cubes.main.dao.AuthorDAO;
import cubes.main.dao.BlogDAO;
import cubes.main.dao.CategoryDAO;
import cubes.main.dao.ContactDAO;
import cubes.main.dao.TagDAO;
import cubes.main.dao.UserDAO;
import cubes.main.entity.Author;
import cubes.main.entity.Blog;
import cubes.main.entity.Category;
import cubes.main.entity.ChangePassword;
import cubes.main.entity.Contact;
import cubes.main.entity.Tag;
import cubes.main.entity.User;

@Controller
@RequestMapping("/administration")
public class AdministrationController {
	
	@Autowired 
	private CategoryDAO categoryDAO;
	
	@Autowired
	private TagDAO tagDAO;
	
	@Autowired
	private BlogDAO blogDAO;
	
	@Autowired
	private AuthorDAO authorDAO;
	
	@Autowired
	private ContactDAO contactDAO;
	
	@Autowired
	private UserDAO userDAO;
	
//BLOGS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	@RequestMapping("/blog-list")
	public String getBlogList(Model model) {
		List<Blog> list = blogDAO.getBlogList();
		
		
		model.addAttribute("blogList", list);
		model.addAttribute("contactCount", contactDAO.getUnreadContactCount());
		
		return "blog-list";
		
	}
	
	@RequestMapping("/blog-form")
	public String getBlogForm(Model model) {
		
		 Blog blog = new Blog();
		 
		 
		 List<Category> categoryList = categoryDAO.getCategoryList();
		 List<Tag> tagList = tagDAO.getTagList();

		model.addAttribute("blog", blog);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("taglist", tagList);
		model.addAttribute("contactCount", contactDAO.getUnreadContactCount());
		
		return  "blog-form";
	}
	
	@RequestMapping("/blog-save")
	public String saveBlog(@Valid @ModelAttribute Blog blog, BindingResult result, Model model) {
		
		
		if(result.hasErrors()) {
			 List<Category> categoryList = categoryDAO.getCategoryList();
			 List<Tag> tagList = tagDAO.getTagList();
			 		 
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("taglist", tagList);
			 
			return "blog-form";
		}
		
		Category category = categoryDAO.getCategory(blog.getCategory().getId());
		
		List<Integer> ids = new ArrayList<Integer>();
		
		for(Tag tag: blog.getTags()) {
			ids.add(Integer.parseInt(tag.getName()));
			
		}
		
		List<Tag> tags = tagDAO.getTagsById(ids);
		
		blog.setCategory(category);
		blog.setTags(tags);
		
		blogDAO.saveBlog(blog);
		
		return "redirect:/administration/blog-list";
	}
	
	@RequestMapping("/blog-form-update")
	public String getBlogUpdateForm(@RequestParam int id, Model model){
		
		Blog blog = blogDAO.getBlogWithTag(id);
		
		 List<Category> categoryList = categoryDAO.getCategoryList();
		 List<Tag> tagList = tagDAO.getTagList();
		 
		model.addAttribute("blog", blog);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("taglist", tagList);
		model.addAttribute("contactCount", contactDAO.getUnreadContactCount());
		
		return "blog-form";
		
	}
		
	@RequestMapping("/blog-delete")
	public String deleteBlog(@RequestParam int id) {
		
		blogDAO.delete(id);
		
		
		return "redirect:/administration/blog-list";
		
	}
	
	
	//AUTHOR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	@RequestMapping("/author-list")
	public String getAuthorList(Model model) {
		
		
		
		List<Author> list = authorDAO.getAuthorList();

		
		model.addAttribute("authorList", list);
		model.addAttribute("contactCount", contactDAO.getUnreadContactCount());
		
		return "author-list";
	}
	
	@RequestMapping("/author-save")
	public String saveAuthor(@ModelAttribute Author author) {
		
		
		authorDAO.saveAuthor(author);
		
		return "redirect:/administration/author-list";
	}
	
	@RequestMapping("/author-delete")
	public String deleteAuthor(@RequestParam int id) {
		
		authorDAO.deleteAuthor(id);
		
		return "redirect:/administration/author-list";
	}
	
	
	
// CATEGORY !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	@RequestMapping("/category-list")
	public String getCategoryList(Model model) {
		
		
		
		List<Category> list = categoryDAO.getCategoryList();

		
		model.addAttribute("categoryList", list);
		model.addAttribute("contactCount", contactDAO.getUnreadContactCount());
		
		return "category-list";
	}
	
	@RequestMapping("/category-form")
	public String getCategoryForm(Model model) {
		
		Category category = new Category();
		model.addAttribute("category", category);
		model.addAttribute("contactCount", contactDAO.getUnreadContactCount());
		
		return  "category-form";
	}
	
	
	@RequestMapping("/category-form-update")
	public String getCategoryUpdateForm(@RequestParam int id, Model model) {
		
		Category category = categoryDAO.getCategory(id);
		model.addAttribute("category", category);
		model.addAttribute("contactCount", contactDAO.getUnreadContactCount());
		
		return  "category-form";
	}
	
	@RequestMapping("/category-save")
	public String saveCategory(@Valid @ModelAttribute Category category, BindingResult result) {
		
		if(result.hasErrors()) {
			return "category-form";
			
		}
		
		categoryDAO.saveCategory(category);
		
		return "redirect:/administration/category-list";
	}
	
	@RequestMapping("/category-delete")
	public String deleteCategory(@RequestParam int id) {
		
		categoryDAO.deleteCategory(id);
		
		return "redirect:/administration/category-list";
	}
	//TAG!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	@RequestMapping("/tag-list")
	public String getTagList(Model model) {
		
		List<Tag> tagList = tagDAO.getTagList();
		
		model.addAttribute("tagList", tagList);
		model.addAttribute("contactCount", contactDAO.getUnreadContactCount());
		
		return  "tag-list";
	}
	
	@RequestMapping("/tag-form")
	public String getTagForm(Model model) {
		
		Tag tag = new Tag();
		
		model.addAttribute("tag", tag);
		model.addAttribute("contactCount", contactDAO.getUnreadContactCount());
		
		return "tag-form";
	}
	@RequestMapping("/tag-save")
	public String saveTag(@Valid @ModelAttribute Tag tag, BindingResult result) {
		
		if(result.hasErrors()) {
			
			return "tag-form";
		}
		
		tagDAO.saveTag(tag);
		
		return  "redirect:/administration/tag-list";
		
	}
	@RequestMapping("/tag-delete")
	public String deleteTag(@RequestParam int id) {
		
		tagDAO.deleteTag(id);
		
		return  "redirect:/administration/tag-list";
	}
	
	@RequestMapping("/tag-form-update")
	public String getTagUpdateForm(@RequestParam int id, Model model) {
		
		Tag tag = tagDAO.getTag(id);
		model.addAttribute("tag", tag);
		model.addAttribute("contactCount", contactDAO.getUnreadContactCount());
		
		
		return "tag-form";
	}
	
	
	// CONTACT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	@RequestMapping("/contact-list")
	public String getContactList(Model model) {
		
		model.addAttribute("contactList", contactDAO.getAllContacts());
		model.addAttribute("contactCount", contactDAO.getUnreadContactCount());
		
		return "contact-list";
	}
	@RequestMapping("/contact-seen")
	public String getMarkContactSeen(@RequestParam int id) {
		
		Contact c = contactDAO.getContact(id);
		
		c.setIsSeen(true);
		
		contactDAO.saveContact(c);
		
		return "redirect:contact-list";
	}
	
	
	//USERS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	@RequestMapping("/user-list")
	public String getUserListPage( Model model) {
		
		
		model.addAttribute("reservationCount", contactDAO.getUnreadContactCount());
		model.addAttribute("userList",userDAO.getUserList() );
		
		model.addAttribute("user", userDAO.getUserByUserName("marko"));
		
		return "user-list";
	}
	
	@RequestMapping("/user-enable")
	public String enableUser(@RequestParam String username) {
		
		userDAO.enableUser(username);
		
		return "redirect:/administration/user-list";
	}
	
	@RequestMapping("/user-form")
	public String getUserForm(Model model) {
		
		
		model.addAttribute("user", new User());
		model.addAttribute("roles", userDAO.getRoles());
		
		return "user-form";
		
	}
	
	@RequestMapping("/user-save")
	public String getUserForm(@ModelAttribute User user) {
		
		
		String password = user.getPassword();
		
		System.out.println("pass - " + user.getPassword());
		
		String passwordEncode = new BCryptPasswordEncoder().encode(user.getPassword());
		
		System.out.println("pass - " + passwordEncode);
		
		user.setEnabled(true);
		user.setPassword("{bcrypt}"+passwordEncode);
		
		userDAO.saveUser(user);
		
		return "redirect:/administration/user-list";
		
	}
	
	@RequestMapping("/user-delete")
	public String getUserForm(@RequestParam String username) {
		
		
		userDAO.deleteUser(username);
		
		return "redirect:/administration/user-list";
		
	}
	
	
	@RequestMapping("/user-edit-profile")
	public String getUserEditProfile(Principal principal, Model model) {
		
		
	User user =  userDAO.getUserByUserName(principal.getName());
	
	model.addAttribute("user", user);
		
		return "user-edit-profile";
		
	}
	
	@RequestMapping("/user-edit")
	public String getUserEdit(@ModelAttribute User user) {
		
		
		userDAO.saveUser(user);
		
		return "redirect:/administration/user-list";
		
	}
	
	@RequestMapping("/user-change-password")
	public String getUserChangePassword( Model model) {
		
		
	
		
		model.addAttribute("changePassword", new ChangePassword());
		
		return "user-change-password";
		
	}
	
	@RequestMapping("/user-change-password-action")
	public String getUserChangePasswordAction(@ModelAttribute ChangePassword changePassword, Principal principal, Model model) {
	
		if(changePassword.getNewPassword().equalsIgnoreCase(changePassword.getConfirmPassword())) {
			
			User user = userDAO.getUserByUserName(principal.getName());
			
			
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			if(encoder.matches(changePassword.getOldPassword(), user.getPassword().replace("{bcrypt}", ""))) {
				user.setPassword("{bcrypt}"+encoder.encode(changePassword.getNewPassword()));
				
				userDAO.saveUser(user);
			}
			else {
				
				//nije unet dobar stari password
				return "user-change-password";
			}
		}
		else {
			// ne poklapaju se new password i confirm password
			return "user-change-password";
		}

		
		return "redirect:/administration/user-list";
		
	}
}
