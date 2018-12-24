
package com.shuvo.controller;

import com.shuvo.dao.ProductDao;
import com.shuvo.entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            //-----------INSERT PRODUCT--------------------------------
            if(request.getParameter("insert")!=null){
                   
           String productName = request.getParameter("ProductName") ; 
           int productQuantity = Integer.parseInt(request.getParameter("ProductQuantity")); 
           double productPrice = Double.parseDouble(request.getParameter("ProductPrice")) ; 
           
           Product product = new Product() ; 
           product.setProductName(productName);
           product.setProductPrice(productPrice);
           product.setProductQuantity(productQuantity);
           ProductDao productDao = new ProductDao() ; 
           boolean saveStatus = productDao.saveProduct(product);
          
           if(saveStatus)
               request.getSession().setAttribute("sm","Product inserted successfully") ; 
           else
               request.getSession().setAttribute("em","Failed to insert Product") ;
           request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
            
            //------------UPDATE PRODUCT--------------------------------
            else if(request.getParameter("update")!=null){
               
               int productId = Integer.parseInt(request.getParameter("ProductId")) ; 
               String productName=request.getParameter("ProductName") ; 
               int productQuantity = Integer.parseInt(request.getParameter("ProductQuantity")) ; 
               double productPrice = Double.parseDouble(request.getParameter("ProductPrice")) ; 
               
               Product product = new Product(); 
               product.setProductId(productId);
               product.setProductName(productName);
               product.setProductPrice(productPrice);
               product.setProductQuantity(productQuantity);
               
               ProductDao productDao = new ProductDao() ; 
               boolean updateStatus = productDao.updateProduct(product) ; 
               if(updateStatus)
                   request.getSession().setAttribute("sm","product updated successfully") ; 
               else
                   request.getSession().setAttribute("em","product updation failed") ; 
               request.getRequestDispatcher("/index.jsp").forward(request,response)  ;
            }
            
            //--------DELETE PRODUCT---------------
            else if(request.getParameter("for").equalsIgnoreCase("delete")){
               int pid = Integer.parseInt(request.getParameter("ProductId")) ; 
               Product product = ProductDao.getProduct(pid) ; 
                boolean deleteStatus = new ProductDao().deleteProduct(product) ;
                if(deleteStatus)
                    request.getSession().setAttribute("sm","product deleted successfully");
                else request.getSession().setAttribute("em","product deletion failed") ; 
                request.getRequestDispatcher("/index.jsp").forward(request,response)  ; 
               
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
