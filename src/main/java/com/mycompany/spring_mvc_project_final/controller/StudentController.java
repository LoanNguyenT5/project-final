package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.StudentEntity;
import com.mycompany.spring_mvc_project_final.repository.StudentRepository;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;


@Controller
@RequestMapping("/user")
public class StudentController {

	@Autowired
	StudentRepository studentRepository;

	@RequestMapping(value = "/insertImage", method = RequestMethod.POST,
			consumes = MediaType.MULTIPART_FORM_DATA_VALUE,
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ModelAndView save(@RequestParam("name") String name, @RequestParam("age") Integer age,
							 @RequestPart("photo") MultipartFile photo) {
		try {
			StudentEntity s = new StudentEntity();
			s.setName(name);
			s.setAge(age);
			s.setPhoto(photo.getBytes());
			studentRepository.save(s);
			return new ModelAndView( "redirect:/user/fetch");
			//return new ModelAndView("stu", "msg", "Records succesfully inserted into database.");

		} catch (Exception e) {
			return new ModelAndView("student/index", "msg", "Error: " + e.getMessage());
		}
	}

	@RequestMapping(value = "/fetch")
	public ModelAndView listStudent(ModelAndView model) throws IOException {

		List<StudentEntity> listStu = (List<StudentEntity>) studentRepository.findAll();

		model.addObject("listStu", listStu);
		model.setViewName("student/student");

		return model;
	}
	@RequestMapping(value = "/getStudentPhoto/{id}")
	public void getStudentPhoto(HttpServletResponse response, @PathVariable("id") long id) throws Exception {
		response.setContentType("image/jpeg");

		StudentEntity s = studentRepository.findById(id).get();
		byte[] ph = s.getPhoto();
		InputStream inputStream = new ByteArrayInputStream(ph);
		IOUtils.copy(inputStream, response.getOutputStream());
	}
}
