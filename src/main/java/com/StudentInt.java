package com;

import java.util.List;
/**
 * 
 * @author Gaurav Bombatkar
 *
 */
public interface StudentInt {

	public Boolean saveStudent(Student student);

	public List<Student> getStudents();

	public Boolean deleteStudent(Integer id);

	public Student getStudentId(Integer id);

}
