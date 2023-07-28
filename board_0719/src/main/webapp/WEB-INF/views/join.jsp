<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <h1>Member Join</h1>
    <table>
        <tr>
            <td><label for="txtUserId">아이디</label></td>
            <td><input type="text" name="userId" id="txtUserId"> <button type="button" id="btnCheckId">중복확인</button></td>
        </tr>
        <tr>
            <td><label for="txtUserPw">비밀번호</label></td>
            <td><input type="password" name="userPw" id="txtUserPw"></td>
        </tr>
        <tr>
            <td><label for="txtCheckPw">비밀번호 확인</label></td>
            <td><input type="password" id="txtCheckPw"></td>
        </tr>
        <tr>
            <td><label for="txtName">이름</label></td>
            <td><input type="text" name="name" id="txtName"></td>
        </tr>
        <tr>
            <td><label for="txtEmail">이메일</label></td>
            <td><input type="email" name="email" id="txtEmail"></td>
        </tr>
    </table>
    <br>
    <button type="button" id="btnJoin" style="width: 310px;">회원가입</button>


<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{
    const txtUserId = document.querySelector('#txtUserId');
    const txtUserPw = document.querySelector('#txtUserPw');
    const txtCheckPw = document.querySelector('#txtCheckPw');
    const txtName = document.querySelector('#txtName');
    const txtEmail = document.querySelector('#txtEmail');
    const btnJoin = document.querySelector('#btnJoin');
    const btnCheckId = document.querySelector('#btnCheckId');

    let idChecking = false;         // 중복확인을 통과하면 true로 변경.
    let checkedId = '';             // 체크가 완료된 아이디

    //////////////////////////////////////////////////////////////////////
    // 함수
    const checkJoinData = function()
    {
        if ((idChecking === false) || (checkedId != txtUserId.value))
        {
            alert('아이디 중복확인을 해주세요.');
            txtUserId.value = '';
            txtUserId.focus();

            return false;
        }

        if (txtUserPw.value.length === 0)
        {
            alert('비밀번호를 넣어주세요');
            txtUserPw.value = '';
            txtCheckPw.value = '';
            txtUserPw.focus();

            return false;

        }

        if (txtUserPw.value != txtCheckPw.value)
        {
            alert('비밀번호와 비밀번호 확인이 서로 다릅니다.');
            txtCheckPw.value = '';
            txtCheckPw.focus();

            return false;

        }

        if (txtName.value.length === 0)
        {
            alert('이름을 넣어주세요');
            txtName.focus();
            return false;
        }

        if (txtEmail.value.length === 0)
        {
            alert('이메일을 넣어주세요');
            txtEmail.focus();
            return false;
        }

        return true;
    }


    //////////////////////////////////////////////////////////////////////
    // 이벤트 핸들러.
    
    btnJoin.addEventListener('click', ()=>{
        // 데이터를 검사한다.
        if (false === checkJoinData()){
            return;

        }

        // 가입을 위한 요청데이터를 만든다.
        let requestData = {
            userId : txtUserId.value,
            userPw : txtUserPw.value,
            name : txtName.value,
            email : txtEmail.value 
        };

        $.ajax({
            url : '/join',
            type : 'POST',
            data : requestData,
            success : function(data)
            {
                if (data === "OK")
                {
                    alert("회원가입이 완료되었습니다. 로그인 후 이용해주세요.");
                    location.href = '/login';
                }
                else
                {
                    alert("회원가입에 실패하였습니다.")
                }
            }

        });


        
    });

    // 중복확인
    btnCheckId.addEventListener('click', ()=>{
        //1. 아이디를 가지고 온다.
        if(txtUserId.value.length === 0)
        {
            alert('아이디를 입력하세요');
            return;
        }

        let requestData = {
            userId : txtUserId.value
        };
        console.log(requestData);

        $.ajax({
            url: '/checkid',
            type : 'POST',
            data : requestData,
            success : function(data)
            {
                if (data === "OK") {
                    alert('가입할 수 있는 아이디입니다');
                    idChecking = true;
                    checkedId = txtUserId.value;     // 체크가 된 아이디를 저장한다.
                    txtUserPw.focus();
                }
                else{
                    alert('이미 가입된 아이디가 있습니다.');
                    idChecking = false;
                    txtUserId.value = '';
                    txtUserId.focus();

                }

            }
        })

        
    });


})(); 
</script>
        
</body>