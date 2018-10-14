package com;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
/**
 * 
 * @author Gaurav Bombatkar
 *
 */
@Repository
public class StudentImpl implements StudentInt {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public Boolean saveStudent(Student student) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(student);
		tx.commit();
		return tx.wasCommitted();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Student> getStudents() {
		return sessionFactory.openSession().createCriteria(Student.class).list();
	}

	@Override
	public Boolean deleteStudent(Integer id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Student student = (Student) session.get(Student.class, id);
		session.delete(student);
		tx.commit();
		return tx.wasCommitted();
	}

	@Override
	public Student getStudentId(Integer id) {
		return (Student) sessionFactory.openSession().get(Student.class, id);
	}

}
