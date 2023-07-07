<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Exam01_date</title>
    </head>
    <body>
        <h1>Exam01_date.jsp</h1>

        <%
        Date today = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String todayStr = dateFormat.format(today);
        out.println("<h1>오늘날짜 : " + todayStr + "</h1>");
        
        %>
    </body>
</html>