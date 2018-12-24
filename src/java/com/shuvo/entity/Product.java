package com.shuvo.entity;
// Generated Dec 23, 2018 11:23:11 PM by Hibernate Tools 4.3.1

public class Product  implements java.io.Serializable {


     private Integer productId;
     private String productName;
     private int productQuantity;
     private double productPrice;

    public Product() {
    }

    public Product(String productName, int productQuantity, double productPrice) {
       this.productName = productName;
       this.productQuantity = productQuantity;
       this.productPrice = productPrice;
    }
   
    public Integer getProductId() {
        return this.productId;
    }
    
    public void setProductId(Integer productId) {
        this.productId = productId;
    }
    public String getProductName() {
        return this.productName;
    }
    
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public int getProductQuantity() {
        return this.productQuantity;
    }
    
    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }
    public double getProductPrice() {
        return this.productPrice;
    }
    
    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }




}


