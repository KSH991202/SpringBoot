<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%!
String str1 = "Exam";
String str2 = "jsp";
%>

<!-- JSP는 변수의 선언부와 -> %!
           expression와   -> %=
           statement가    -> %
    각각 다른 특징을 가지고 있다  
-->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>EXAM</title>
    </head>
    <body>
        <h1>Exam.jsp</h1>
        <!-- %= 는 자바의 어떠한 결과값을 가지는 expression에 들어가게 된다 -->
        <h1><%= str1 %></h1>
        <h1><%= str2 %></h1>
        <h1><%= str1 + "." + str2 %></h1>

        <p>
            <%
            out.println(str1 + "." + str2 + "파일 입니다.");
            
            %>

        </p>
    </body>
</html>