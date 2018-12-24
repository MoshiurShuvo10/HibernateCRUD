<%-- 
    Document   : Insert
    Created on : Dec 23, 2018, 11:30:06 PM
    Author     : Shuvo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>insert Page</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css"
    </head>
    <body>
    <center><h1>Save Product</h1></center>
    <form action="ProductController" method="post" name="insertForm">
        <table>
            <thead>
                <tr text-align="center">
                    <td colspan="3">
                        Insert Product
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Product Name</td>
                    <td><input type="text" name="ProductName" required></td>
                </tr>
                <tr>
                    <td>Product Quantity</td>
                    <td><input type="text" name="ProductQuantity" required></td>
                </tr>
                <tr>
                    <td>Product Price</td>
                    <td><input type="text" name="ProductPrice" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="insert"  value="insert"></td>
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
