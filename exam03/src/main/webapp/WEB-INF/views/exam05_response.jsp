<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Exam05_Response</title>
    </head>
    <body>
        <h1>Exam05_Response.jsp</h1>

        <form action="/exam05_response_info" method="post">

            <fieldset>
                <legend>로그인</legend>
                
                <label for="id">ID : </label> 
                <input type="text" id="userId" name="userId"><br>
                
                <label for="pw">PW : </label> 
                <input type="text" id="userPw" name="userPw"><br>
                
                <input type="submit" value="로그인">
            </fieldset>


        </form>
    </body>
</html>