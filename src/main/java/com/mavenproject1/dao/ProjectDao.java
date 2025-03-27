
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mavenproject1.dao;

import com.mavenproject1.entity.Project;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Rohan
 */
public class ProjectDao {
    
    private final SessionFactory Factory;
     
      public ProjectDao(SessionFactory Factory) {
        this.Factory = Factory;
      } 
      
       public boolean saveProject(Project a) {
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
         
           public List<Project> getAllProjectByCollegeID(int College_id) {
        Session s = this.Factory.openSession();
        Query query = s.createQuery("from Project as p where p.College_id=:College_id");
        query.setParameter("College_id",College_id);
        List<Project> ulist = query.list();
        return ulist;
    }
        public List<Project> getAllProjectByStudentId(String student_id) {
        Session s = this.Factory.openSession();
        Query query = s.createQuery("from Project as p where p.student_id=:student_id");
        query.setParameter("student_id",student_id);
        List<Project> ulist = query.list();
        return ulist;
    }
       
          public List<Project> getAllProjects(){
        Session s=this.Factory.openSession();
        Query query = s.createQuery("from Project");
        List<Project> ulist = query.list();
        return ulist;
   }
           
        public int getLastId() {
	Session s=this.Factory.openSession();
	final String sql = "SELECT coalesce(max(i.id), 0) FROM Project i";
	Integer lastId = (Integer) s.createQuery( sql ).uniqueResult();
	return lastId;
    }
             
             
   public void updateProject(int id,String reviewedBy,String status){
       Transaction tx=null;
       try(Session s=this.Factory.openSession()){
           tx=s.beginTransaction();
           Project p=(Project)s.get(Project.class, id);
           p.setReviewedBy(reviewedBy);
           p.setStatus(status);
           s.update(p);
           tx.commit();
       }catch(Exception e){
           if(tx==null){
               tx.rollback();
           e.printStackTrace();
       }
       }
   }
             
    
}
