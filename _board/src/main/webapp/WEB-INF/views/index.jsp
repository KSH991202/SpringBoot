<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Main BBS</title>
    </head>
    <body>
        <h1>Main BBS</h1>
        <hr>
        <div>
            <span>홍길동님 반갑습니다.</span>
            <input type="button" id="login" value="로그인">
        </div>
        <br>
        <table border="1" id="bbsTable">
            <thead>
                <th>글번호</th>
                <th>글제목</th>
                <th>작성일</th>
                <th>구분</th>
                <th>작성자</th>
            </thead>
            <tbody id="tb">

            </tbody>
        </table>

        <form id="bbsform" name="bsbform">
            <input type="text" id="divi" name="divi">
            <input type="text" id="pageNum" name="pageNum">
        </form>

        <script src="../../JS/jquery-3.7.0.min.js"></script>

        <script>
        //로그인 버튼을 누르면 alert("login")
        //즉시호출함수 만들기 (다른 js파일과 충돌 할 수 있기 때문에)
        (()=>{
            // const $btn = document.getElementById("login");
            const $btn = document.querySelector('#login');

            $btn.addEventListener('click', ()=>{
                alert("login");
            });
            // JQuery방식
            // $('#login').click(()=>{
            //     alert('jqery-login');
            // });

            const getBbs = function(page)
            {
                // input-box DOM을 가져온다
                const $divi = document.getElementById('divi');
                const $pageNum = document.getElementById('pageNum');

                // 1. divi에다가는 C를 넣고 pageNum에다가는 1을 넣는다
                // setAttribute 로 속성을 추가해준다
                $divi.setAttribute('value', 'C');
                $pageNum.setAttribute('value', page.toString());

                // 2. "form 데이터"를 JSON형태로 만든다 
                let formData = new FormData(bbsform);

                // 3. 만들어진 "FORM JSON 데이터를" AJAX 통신방식으로 서버에게 전달한다
                // - 보낼데이터 : forData
                // - 전송 URL : /bbs/list
                // - method type : post
                // - 결과를 받는 함수
                $.ajax({
                    data : formData,
                    type : 'POST',
                    url : '/bbs/list',
                    cache : false,
                    processData : false,
                    contentType : false,
                    success : function(data){

                        let bstr = '';
                        // 1. tBody를 가지고 오고 초기화를 한다.
                        const tBody = document.querySelector('#bbsTable > tbody');
                        tBody.innerHTML = '';

                        // 2. tbody를 만들어준다.
                        for(let i = 0; i < data.bbsList.length; i++)
                        {
                            bstr = '';
                            bstr += '<tr>';
                                bstr += '<td>' + (i + 1) + '</td>';
                                bstr += '<td><a href=/bbs/content?userId=' + data.bbsList[i].userId + '&seq=' + data.bbsList[i].seq + '>' + data.bbsList[i].title + '</a></td>';
                                bstr += '<td>' + data.bbsList[i].regdate + '</td>';
                                bstr += '<td>' + data.bbsList[i].divi + '</td>';
                                bstr += '<td>' + data.bbsList[i].userId + '</td>';
                            bstr += '</tr>';

                            tBody.innerHTML += bstr;
                        }


                        // 노가다 방법 //
                        // const $tbody = document.getElementById('tb');
                        // let count = 1;

                        // for(let i = 0; i < data.bbsList.length; i++)
                        // {
                        //     const $tr = document.createElement('tr');
                            
                        //     const $seq = document.createElement('td');
                        //     const $title = document.createElement('td');
                        //     const $content = document.createElement('td');
                        //     const $regdate = document.createElement('td');
                        //     const $divi = document.createElement('td');
                        //     const $userId = document.createElement('td');

                        //     const $a = document.createElement('a');
                            
                        //     $title.appendChild($a);
                            
                        //     $tr.appendChild($seq);
                        //     $tr.appendChild($title);
                        //     $tr.appendChild($content);
                        //     $tr.appendChild($regdate);
                        //     $tr.appendChild($divi);
                        //     $tr.appendChild($userId);
                            
                        //     $seq.innerText=data.bbsList[i].seq;
                        //     $a.innerText=data.bbsList[i].title;
                        //     $content.innerText=data.bbsList[i].content;
                        //     $regdate.innerText=data.bbsList[i].regdate;
                        //     $divi.innerText=data.bbsList[i].divi;
                        //     $userId.innerText=data.bbsList[i].userId;
                            
                        //     $a.setAttribute('href', 'http://localhost:9090/title' + count);

                        //     count++;

                        //     $tbody.appendChild($tr);
                        // }
            }});
            }

            getBbs(3);

            // 4. 서버에게 전달된 게시판 데이터를 수신한다
            // 5. 수신된 데이터를 가지고 tbody를 만든다

        })();
        </script>
    </body>
</html>
