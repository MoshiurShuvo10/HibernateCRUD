<%-- 
    Document   : Insert
    Created on : Dec 23, 2018, 11:30:06 PM
    Author     : Shuvo
--%>

<%@page import="com.shuvo.dao.ProductDao"%>
<%@page import="com.shuvo.entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css"
    </head>
    <body>
    <center><h1>Edit Product</h1></center>
    <form action="ProductController" method="post" name="editForm">
        <table>
            <thead>
                <tr style="text-align: center">
                    <td colspan="3">
                        Edit Product
                    </td>
                </tr>
            </thead>
            <tbody>
                <%
                    Product product = ProductDao.getProduct(Integer.parseInt(request.getParameter("ProductId"))) ; 
                %>
                <tr><td><input type="hidden" name="ProductId" value="<%=product.getProductId()%>" required></td></tr>
                <tr>
                    <td>Product Name</td>
                    
                    <td><input type="text" name="ProductName" value="<%=product.getProductName()%>" required></td>
                </tr>
                <tr>
                    <td>Product Quantity</td>
                    <td><input type="text" name="ProductQuantity"  value="<%=product.getProductQuantity()%>" required></td>
                </tr>
                <tr>
                    <td>Product Price</td>
                    <td><input type="text" name="ProductPrice" value="<%=product.getProductPrice()%>" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="update"  value="update"></td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3">
                        <font color="green">
                        <c:if test="${sessionScope.sm != null}">
                        <c:out value="${sessionScope.sm}"/>
                        <c:remove scope="session" var="sm"/>
                        </c:if>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <font color="red">
                        <c:if test="${sessionScope.em != null}">
                        <c:out value="${sessionScope.em}"/>
                        <c:remove scope="session" var="em"/>
                        </c:if>
                        </font>
                    </td>
                </tr>
                
            </tfoot>
        </table>
    </form>
    </body>
</html>
