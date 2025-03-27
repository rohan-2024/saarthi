/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mavenproject1.dao;

import com.mavenproject1.entity.College;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Atifa
 */
public class CollegeDao {
    
    
     private final SessionFactory Factory;
     
      public CollegeDao(SessionFactory Factory) {
        this.Factory = Factory;
      } 
        
         public boolean saveCollegeRegistration(College a) {
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
         
         
          public College getCollegeById(int id){
       College  college=null;
        try{
            String query="from College as c where c.id=:id";
            Session session =this.Factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("id", id);
            college=(College)q.uniqueResult();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return college;
    }
          
          public List<College> getAllCollegeByAISHE(String AISHE){
              Session s = this.Factory.openSession();
        Query query = s.createQuery("from College as c where c.AISHE=:AISHE");
        query.setParameter("AISHE", AISHE);
        List<College> ulist = query.list();
        return ulist;
          }
          
          public int getLastId() {
	Session s=this.Factory.openSession();
	final String sql = "SELECT coalesce(max(i.id), 0) FROM College i";
	Integer lastId = (Integer) s.createQuery( sql ).uniqueResult();
	return lastId;
    }
}
