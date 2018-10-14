package com;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * @author Gaurav Bombatkar
 *
 */
@Controller
public class StudentController {

	List<Student> list = new ArrayList<Student>();

	@Resource
	StudentInt dao;

	@RequestMapping("/")
	public String viewStudent(Model model) {
		model.addAttribute("studentForm", new Student());
		return "student";

	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "studentInsert", method = RequestMethod.POST)

	public @ResponseBody List<Student> ajaxResponse(@ModelAttribute("studentForm") Student student) {
		// System.out.println("Student_id:-" + student.getId());
		Boolean result = dao.saveStudent(student);
		return getStudents(student);
	}

	@RequestMapping(value = "viewlist", method = RequestMethod.POST)
	public @ResponseBody List<Student> getStudents(Student student) {
		List<Student> list = dao.getStudents();
		return list;
	}

	@RequestMapping("deleteStudent")
	@ResponseBody
	public Message studentDelete(@RequestParam("id") Integer id) {
		// System.out.println("delete_ID:-" + id);
		Boolean result = dao.deleteStudent(id);
		// model.addAttribute("list", dao.getStudents());
		String msg = "Data Delete....!";
		Message message = new Message();
		message.setMessage(msg);
		return message;
	}

	@RequestMapping("editStudent")
	public @ResponseBody Student studentEdit(@RequestParam("id") Integer id) {
		return dao.getStudentId(id);
	}

}
