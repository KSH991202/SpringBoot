<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Content</title>
        <style>
            
            .btn{
                margin-left: 80%;
            }
            #title{
                margin-left: 20%;
            }
            textarea{
                margin-left: 20%;
            }
            h1{
                margin-left: 20%;
            }

            

        </style>
    </head>
    <body>
        <form action="" method="post">
            <h1>${vo.title}</h1>
            <hr><br>
            <input type="text" id="title" value="${vo.title}"><br><br>
            <textarea readonly cols="100" rows="10" id="content">${vo.content}</textarea> <br>
        </form>
            <div>
                <button id="bbsList" class="btn">목록으로</button>
                <button id="modify" class="btn">수정</button>
            </div>
            
        <script>
            (()=>{

                const $bbsList = document.querySelector('#bbsList');
                const $modify = document.querySelector('#modify');
                
                $bbsList.addEventListener('click', ()=>{
                    history.back();
                    // location.href ='/index';
                })
                $modify.addEventListener('click', ()=>{
                    if(confirm('수정하시겠습니까?'))
                    {
                        // 수정 해달라는 요청
                        alert("수정되었습니다");
                    }
                    history.back();
                })
            })();
        </script>
    </body>
</html>
