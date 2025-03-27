/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mavenproject1.dao;

/**
 *
 * @author Swastik Computer
 */

import com.mavenproject1.entity.Admin;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class AdminDao {
    
    private final SessionFactory Factory;

    public AdminDao(SessionFactory Factory) {
        this.Factory = Factory;  
    }
      public boolean saveAdmin(Admin a) {
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
      
       public Admin getAdminByIdandPassword(String email, String password){
       Admin admin=null;
        try{
            String query="from Admin as a where a.email=:email and a.password=:password";
            Session session =this.Factory.openSession();
            Query q= session.createQuery(query);
            q.setParameter("email", email);
            q.setParameter("password", password);
            admin=(Admin)q.uniqueResult();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return admin;
    }
       
         public int getLastId() {
	Session s=this.Factory.openSession();
	
	// be sure to check for null lastId in case you have no items.
	final String sql = "SELECT coalesce(max(i.id), 0) FROM Admin i";
	Integer lastId = (Integer) s.createQuery( sql ).uniqueResult();

	return lastId;
}    
}
