
package com.shuvo.dao;

import com.shuvo.entity.Product;
import com.shuvo.util.HibernateUtil;
import java.util.ArrayList;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ProductDao {
    
    public boolean saveProduct(Product product){         
        try{
           SessionFactory factory = HibernateUtil.getSessionFactory() ;
           Session session = factory.openSession() ; 
           session.beginTransaction() ; 
           session.save(product) ;
           session.getTransaction().commit() ;
           session.close();
           return true ; 
        }
        catch(Exception exception){
            return false ; 
        }
    }
    
    public static ArrayList getAllProducts(){
        SessionFactory factory = HibernateUtil.getSessionFactory() ; 
        Session session = factory.openSession() ; 
        ArrayList<Product> productList = (ArrayList<Product>) session.createQuery("FROM Product").list();
        productList.toString() ; 
        return productList ; 
    }
    
    public static Product getProduct(int productId){
        SessionFactory factory = HibernateUtil.getSessionFactory() ; 
        Session session = factory.openSession() ; 
        Product product = (Product)session.get(Product.class,productId) ; 
        return product ;
    }
    
    public boolean updateProduct(Product product){
        try{
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.openSession() ; 
        session.beginTransaction() ; 
        session.update(product);
        session.getTransaction().commit();
        session.close();
        return true ;
        }
        catch(Exception exception){
            return false ; 
        }
    }
    
    public boolean deleteProduct(Product product){
        try{
        SessionFactory factory = HibernateUtil.getSessionFactory() ; 
        Session session = factory.openSession() ; 
        session.beginTransaction() ; 
        session.delete(product);
        session.getTransaction().commit() ; 
        session.close() ; 
        return true ;
        }
        catch(Exception exception)
        {
            return false ; 
        }
    }
    
}
