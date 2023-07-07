<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Exam04_request</title>
    </head>
    <body>
        <h1>Exam04_request.jsp</h1>

        <%
        // class ApplicationHttpRequest extends HttpServletRequestWrapper
        // class HttpServletRequestWrapper implements HttpServletRequest
        out.println(request.getClass());    
        
        // 1. 클라이언트에서 요청시 HTTP Header에 있는 거의 모든 정보를 들고 있다.
        // 2. 쿠키 정보나 TCP 세션정보도 얻어올 수 있다.
        %>

        <h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
        <a href="http://localhost:9090/exam04_request_info?eng=hello&ko=안녕">GET방식으로요청</a>
        <br>

        <form action="/exam04_request_info" method="post">
            영어 : <input type="text" name="eng" value="hi"> 
            <br>
            한글 : <input type="text" name="ko" value="반갑습니다.">
            <input type="submit" value="POST 방식으로 요청">
        </form>

        <h2>2. 클라이언트의 Request Parameter 읽기</h2>
        <form action="/exam04_request_value" method="post">
            아이디 <input type="text" name="userId"> <br>
            이메일 <input type="text" name="email"> <br>

            ---성별--- <br>
            <input type="radio" id="male" name="gender">
            <label for="male">남자</label>
            <input type="radio" id="female" name="gender">
            <label for="female">여자</label>
            <br>

            ---관심사항--- <br>
            <input type="checkbox" id="economy" name="favo" value="경제">
            <label for="economy">경제</label>

            <input type="checkbox" id="policy" name="favo" value="정치">
            <label for="policy">정치</label>

            <input type="checkbox" id="society" name="favo" value="사회">
            <label for="society">사회</label>

            <input type="checkbox" id="culture" name="favo" value="문화">
            <label for="culture">문화</label>
            <br>

            ---자기소개--- <br> 
            <textarea name="intro" id="" cols="30" rows="10"></textarea>
            <br>
            <input type="submit" value="전송">
        </form>
    </body>
</html>