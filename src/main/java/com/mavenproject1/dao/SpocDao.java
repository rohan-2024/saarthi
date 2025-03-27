/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mavenproject1.dao;

import com.mavenproject1.entity.Spoc;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Atifa
 */
public class SpocDao {
    
    private final SessionFactory Factory;
     
      public SpocDao(SessionFactory Factory) {
        this.Factory = Factory;
      } 
      
       public boolean saveSpoc(Spoc a) {
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
       
     public Spoc getSpocUIDandPassword(String UID, String password){
        Spoc spoc=null;
        try{
            String query="from Spoc as a where a.UID =:UID and a.password=:password";
            Session session =this.Factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("UID", UID);
            q.setParameter("password", password);
            spoc=(Spoc)q.uniqueResult();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return spoc;
    }
     
     public Spoc checkCollegeSpoc(String college){
        Spoc spoc=null;
        try{
            String query="from Spoc as a where a.college =:college";
            Session session =this.Factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("college", college);
            spoc=(Spoc)q.uniqueResult();
           
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return spoc;
    }   
     
      public void updateSpoc(int id,boolean status){
         Transaction transaction=null;
         try(Session session=this.Factory.openSession()){
             transaction=session.beginTransaction();
             Spoc s=session.get(Spoc.class, id);
             s.setStatus(status);
             session.update(s);
             transaction.commit();
         }catch(Exception e){
             if(transaction!=null){
                 transaction.rollback();
                 e.printStackTrace();
             }
         }
     }
   
      public List<Spoc> getAllSpoc() {
        Session s = this.Factory.openSession();
        Query query = s.createQuery("from Spoc");
        List<Spoc> ulist = query.list();
        return ulist;
  }
      
     public int getLastId() {
	Session s=this.Factory.openSession();
	final String sql = "SELECT coalesce(max(i.id), 0) FROM Spoc i";
	Integer lastId = (Integer) s.createQuery( sql ).uniqueResult();
	return lastId;
    }  

    
}
