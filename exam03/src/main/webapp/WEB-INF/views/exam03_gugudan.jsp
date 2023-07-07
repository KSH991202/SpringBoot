<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Exam03_gugudan</title>
    </head>
    <body>
        <h1>Exam03_gugudan.jsp</h1>


        <%

        try{
            int dan = Integer.parseInt(request.getParameter("dan"));
            if(dan > 1 && dan < 10)
            {
                for(int i = 1; i < 10; i++)
                {
                    out.println(dan + " X " + i + " = " + (dan * i) + "<br>");
                }
            }
            else{
                throw new Exception("잘못된 파라미터 입니다.");
                // out.println("잘못된 파라미터 입니다."); 
                // return;
            }
        }
        catch(Exception e)
        {
            out.println("잘못된 파라미터 입니다.");
        }

        %>


    </body>
</html>