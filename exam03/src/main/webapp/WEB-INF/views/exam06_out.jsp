<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Exam06_out</title>
    </head>
    <body>
        <h1>Exam06_out.jsp</h1>

        <% 
        out.println(out.getClass());

        out.println("<h1>out object</h1>");

        out.print("출력버퍼크기 : " + out.getBufferSize() + "<br>");
        out.print("남은버퍼크기 : " + out.getRemaining() + "<br>");

        out.flush(); // 버퍼를 비운다
        out.print("남은버퍼크기 : " + out.getRemaining() + "<br>");


        %>

    </body>
</html>