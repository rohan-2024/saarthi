/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mavenproject1.dao;

import com.mavenproject1.entity.Student;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Atifa
 */
public class StudentDao {
 
    private final SessionFactory Factory;
     
      public StudentDao(SessionFactory Factory) {
        this.Factory = Factory;
      } 
      
       public boolean saveStudent(Student a) {
        boolean f = false;
        try{
            Session session = this.Factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(a);
            tx.commit();
            session.close();
             f = true;
        }
         catch(Exception e){
            f = false;
            e.printStackTrace();
        }
        return f;
    }
       
       
        public Student getStudentById(int id){
        Student student=null;
        try{
            String query="from Student as a where a.id =:id";
            Session session =this.Factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("id", id);
            student=(Student)q.uniqueResult();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return student;
    }
        
       
                public Student getStudentByStudentId(String student_id){
        Student student=null;
        try{
            String query="from Student as a where a.student_id =:student_id";
            Session session =this.Factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("student_id", student_id);
            student=(Student)q.uniqueResult();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return student;
    }
            public Student getStudentByStudentIdAndPassword(String student_id,String password){
        Student student=null;
        try{
            String query="from Student as a where a.student_id =:student_id and a.password=:password";
            Session session =this.Factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("student_id", student_id);
            q.setParameter("password", password);
            student=(Student)q.uniqueResult();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return student;
    }
     
               public List<Student> getAllStudentByUID(String UID) {
        Session s = this.Factory.openSession();
        Query query = s.createQuery("from Student as s where s.UID=:UID");
        query.setParameter("UID", UID);
        List<Student> ulist = query.list();
        return ulist;
  }
               
          public List<Student> getAllStudent() {
        Session s = this.Factory.openSession();
        Query query = s.createQuery("from Student");
        List<Student> ulist = query.list();
        return ulist;
  }
          
           public int getLastId() {
	Session s=this.Factory.openSession();
	final String sql = "SELECT coalesce(max(i.id), 0) FROM Student i";
	Integer lastId = (Integer) s.createQuery( sql ).uniqueResult();
	return lastId;
    }

}
