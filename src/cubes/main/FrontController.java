package cubes.main;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cubes.main.dao.BlogDAO;
import cubes.main.dao.CategoryDAO;
import cubes.main.dao.ContactDAO;
import cubes.main.dao.TagDAO;
import cubes.main.entity.Blog;
import cubes.main.entity.Category;
import cubes.main.entity.Contact;

@Controller
@RequestMapping("/")
public class FrontController {
	
	@Autowired
	private BlogDAO blogDAO;
	
	@Autowired
	private ContactDAO contactDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private TagDAO tagDAO;

	@RequestMapping({"/","/index-page"})
	public String getIndexPage(Model model) {
		
		List<Blog> blogList = blogDAO.getBlogList();
		model.addAttribute("blogList", blogList);
		
		model.addAttribute("blog", blogDAO.getBlogOnMainPage());
		
		return "front/index-page";
	}
	
	
	@RequestMapping("/blog-page")
	public String getBlogPage(Model model) {
		
		List<Blog> blogList = blogDAO.getBlogList();
		List<Category> categoryList = categoryDAO.getCategoryList();
		
		model.addAttribute("blogList", blogList);
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("tagList", tagDAO.getTagListWithBlog());
	
		
		
		model.addAttribute("blog", blogDAO.getBlogOnMainPage());
		
		
		return "front/blog-page";
		
	}
	
	@RequestMapping("/contact-page")
	public String getContactPage(Model model) {
		
		
		
		model.addAttribute("contact", new Contact());
		
		
		
		model.addAttribute("blog", blogDAO.getBlogOnMainPage());
		
		return "front/contact-page";
		
	}
	
	@RequestMapping("/contact-save")
	public String saveContact(@Valid @ModelAttribute Contact contact, BindingResult result, Model model) {
		
	if(result.hasErrors()) {
		
		return "front/contact-page";
	}
		
		contactDAO.saveContact(contact);
		 
		return "redirect:contact-page";
	}
	
	@RequestMapping("/blog-page-filter")
	public String getBlogPageFilter(@RequestParam int id, @RequestParam String type, Model model) {
		
		if(type.equalsIgnoreCase("category")) {
			model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
			model.addAttribute("tagList", tagDAO.getTagListWithBlog());
			
			
			model.addAttribute("blogList", blogDAO.getBlogListByCategory(id));
		}
		else if(type.equalsIgnoreCase("tag")) {
			
			model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
			model.addAttribute("tagList", tagDAO.getTagListWithBlog());
			
			
			model.addAttribute("blogList", blogDAO.getBlogListByTag(id));
			
		}
		
		
		
		return "front/blog-page";
	}
	
	@RequestMapping("/blog-author")
	public String getBlogAuthor(@RequestParam int id, Model model) {
		
		List<Blog> blogList = blogDAO.getBlogList();
		
		model.addAttribute("blogList", blogDAO.getBlogByAuthor(id));
		
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("tagList", tagDAO.getTagListWithBlog());
		
		
		
		return "front/blog-author";
	}
	
	
	@RequestMapping("/blog-search")
	public String getBlogSearch(@RequestParam String text, Model model) {
		
		
		
		return "front/blog-search";
	}
		
	
	@RequestMapping("blog-view/{name}")
	public String getBlogView(@RequestParam int id, @PathVariable String name, Model model) {
		
		List<Blog> blogList = blogDAO.getBlogList();
		
		
		
		model.addAttribute("blog", blogDAO.getBlog(id));
		
		System.out.println(blogDAO.getBlog(id));
		
		return "front/blog-view";
	}
	
	

}
