<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Exam02_try</title>
    </head>
    <body>
        <h1>Exam02_try.jsp</h1>

        <%

        try{
            int age = Integer.parseInt(request.getParameter("age"));
            out.println("당신의 나이는 " + age + "살 입니다.");
        }
        catch(Exception e)
        {
            out.println("age 값을 가지고 올 수 없습니다.");
        }
        %>
    </body>
</html>