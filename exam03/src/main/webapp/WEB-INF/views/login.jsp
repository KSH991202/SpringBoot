<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
    </head>
    <body>

        <form action="/login" method="post">
            <fieldset>
                <legend>Login</legend>

                <label for="userID">아이디 : </label>
                <input type="text" id="userID" name="userID">
                <br>
                <label for="userPW">비밀번호 : </label>
                <input type="password" id="userPW" name="userPW">
                <input type="submit" value="로그인">
            </fieldset>
        </form>
    </body>
</html>