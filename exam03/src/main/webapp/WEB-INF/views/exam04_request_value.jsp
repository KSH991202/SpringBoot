<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>exam04_request_value</title>
    </head>
    <body>
        <h1>exam04_request_value.jsp</h1>
        <%
        String userId = request.getParameter("userId");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String[] favo = request.getParameterValues("favo");
        String intro = request.getParameter("intro");

        String strFavo = "";

        if(favo != null)
        {
            for(int i = 0; i < favo.length; i++)
            {
                strFavo = strFavo + favo[i] + " ";
            }
        }
        %>
        <ul>
            <li>아이디 : <%= userId %></li>
            <li>이메일 : <%= email %></li>
            <li>성별 : <%= gender %></li>
            <li>관심사항 : <%= strFavo %></li>
            <li>자기소개 : <%= intro %></li>
        </ul>
    </body>
</html>