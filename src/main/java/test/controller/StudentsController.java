package test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import test.Entity.Students;
import test.DAO.StudentsDAO;

@Controller
public class StudentsController {
	@Autowired
	StudentsDAO dao;
	
	@RequestMapping("/Students/index")
	public String index(Model model, Students item) {
		item = new Students();
		model.addAttribute("item", item);
		List<Students> items = dao.findAll();
		model.addAttribute("items", items);
		return "Students/index";
	}
	 @PostMapping("/Students/index") // Đây là phương thức xử lý cho POST /Students/index
	    public String handlePostIndex() {
	        // Trong phương thức này, bạn có thể thực hiện các thao tác xử lý khi người dùng gửi biểu mẫu
	        // Ví dụ: kiểm tra thông tin người dùng, xử lý dữ liệu, v.v.

	        // Sau khi xử lý, bạn có thể chuyển hướng hoặc trả về trang mà bạn muốn hiển thị.
	        return "redirect:/Students/index"; // Chẳng hạn, sau khi xử lý xong, chuyển hướng lại trang /Students/index
	    }

	@RequestMapping("/Students/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Students item = dao.findById(id).get();
		model.addAttribute("item", item);
		List<Students> items = dao.findAll();
		model.addAttribute("items", items);
		return "Students/index";
	}
	
	@RequestMapping("/Students/create")
	public String create(Students item) {
		dao.save(item);
		return "redirect:/Students/index";
	}
	
	@RequestMapping("/Students/update")
	public String update(Students item) {
		dao.save(item);
		return "redirect:/Students/edit/" + item.getMasv();
	}

	@RequestMapping("/Students/delete/{id}")
	public String create(@PathVariable("id") Integer id) {
		dao.deleteById(id);
		return "redirect:/Students/index";
	}
	
	@GetMapping("/view/form/{id}")
	public String form(Model model, @PathVariable("id") Integer id, Students item) {
		
		item = dao.findById(id).get();
		model.addAttribute("item", item);
		List<Students> items = dao.findAll();
		model.addAttribute("items", items);
		return "form";
	}
	@GetMapping("/view/create")
	public String form1(Model model, Students item) {
		 item = new Students();
		 model.addAttribute("item", item);	
		return "form";
	}
}
