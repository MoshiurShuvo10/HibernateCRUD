<%-- 
    Document   : index
    Created on : Dec 24, 2018, 12:45:32 AM
    Author     : Hp
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.shuvo.entity.Product"%>
<%@page import="com.shuvo.dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
         <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css"
    </head>
    <body>
        <h2 align="center" text-decoration="none" color="green"><a href="Insert.jsp">Add Product</a></h2>
        
        <table border="1" width="80%" style="border-collapse: collapse">
            <thead>
                <tr>
                    <td colspan="6" style="text-align: center">Product List</td>
                </tr>
                <tr style="text-align: center;">
                    <td>Id</td>
                    <td>Name</td>
                    <td>Quantity</td>
                    <td>Price</td>
                    <td colspan="2">Action</td>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Product> plist = ProductDao.getAllProducts() ; 
                    for(Product p:plist){
                %>
                <tr style="text-align: center;">
                    <td><%=p.getProductId()%></td>
                    <td><%=p.getProductName()%></td>
                    <td><%=p.getProductQuantity()%></td>
                    <td><%=p.getProductPrice()%></td>
                    <td><a href="edit.jsp?ProductId=<%=p.getProductId()%>"><button>Edit</button></a></td>
                    <td><a href="ProductController?ProductId=<%=p.getProductId()%>&&for=delete" onclick="return confirm('are you sure?')"><button>Delete</button></a></td>
                </tr>
                
                <%}%>
            </tbody>
            <tfoot>
                <tr style="text-align: center">
                    <td colspan="6">
                        <font color="green">
                        <c:if test="${sessionScope.sm!=null}">
                            <c:out value="${sessionScope.sm}" />
                            <c:remove scope="session" var="sm" />
                        </font>
                        </c:if>
                        <c:if test="${sessionScope.em!=null}">
                            <font color="red">
                            <c:out value="sessionScope.em"/>
                            <c:remove scope="session" var="em" />
                            </font>
                        </c:if>
                    </td>
                </tr>
                    
            </tfoot>
        </table>
    </body>
</html>
