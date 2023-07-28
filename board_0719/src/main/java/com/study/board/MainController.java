package com.study.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.board.user.UserTblVO;
import com.study.board.common.GmailSender;
import com.study.board.common.SessionUtil;
import com.study.board.user.UserDAO;

@Controller
public class MainController {

    @Autowired
    UserDAO userDAO;

    @GetMapping("/index")
    public String index(Model model) throws Exception
    {

        // 1. 요청한 놈이 세션이 있냐?
        UserTblVO userTblVO = (UserTblVO) SessionUtil.getAttribute("USER");

        // 2. 만약에 세션이 있다면 model에 사용자 정보를 저장해서 index.jsp로 보내준다.
        if (userTblVO != null)
        {
            model.addAttribute("vo", userTblVO);
        }

        return "index";
    }
    
    @GetMapping("/login")
    public String login()
    {
        return "login";
    }

    // 아이디 패스워드를 넘겨서 로그인을 실제로 처리해달라는 요청.
    @PostMapping("/login")
    public void login(@ModelAttribute("UserTblVO") UserTblVO vo,
                      HttpServletRequest request, 
                      HttpServletResponse response) throws Exception
    {
        // 1. DB에 해당 계정이 있는지를 조회.
        UserTblVO resultVO = userDAO.selectOneUser(vo);

        if (resultVO == null)
        {
            response.sendRedirect("login");
        }
        else
        {
            // 세션을 저장한다.
            SessionUtil.set(request, "USER", resultVO);
            response.sendRedirect("index");            
            
        }
        
    }

    @GetMapping("/logout")
    public void logout(HttpServletRequest request, 
                       HttpServletResponse response) throws Exception
    {
        SessionUtil.remove(request, "USER");
        response.sendRedirect("index");

    }

    @GetMapping("/join")
    public String join()
    {
        return "join";
    }

    @PostMapping("/checkid")
    @ResponseBody
    public String checkId(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    {
        UserTblVO resultVO = userDAO.selectOneUser(vo);

        if (resultVO != null) {
            return "FAIL";
        }
        else {
            return "OK";
        }

    }

    @PostMapping("/join")
    @ResponseBody
    public String join(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    {
        int insertUserCount = userDAO.insertOneUser(vo);

        if (insertUserCount == 1)
        {
            return "OK";
        }
        else
        {
            return "FAIL";
        }
    
    }

    @GetMapping("/idinquiry")
    public String idInquiry()
    {

        return "idinquiry";
    }

    @PostMapping("/checkEmail")
    @ResponseBody
    public String checkEmail(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    {
        UserTblVO resultVO = userDAO.selectOneUserEmail(vo);
        System.out.println(resultVO);

        if (resultVO != null) {

            String editedId = resultVO.getUserId();
            
            editedId = editedId.substring(0, editedId.length()-2);

            return editedId + "**";
        }
        else 
        {
            return "$NOUSER";
        }

    }

    @GetMapping("/pwinquiry")
    public String pwinquiry()
    {

        return "pwinquiry";
    }

    @PostMapping("/checkPw")
    @ResponseBody
    public String checkPw(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    {
        UserTblVO resultVO = userDAO.selectOneUser(vo);

        String senderName = "sunghyun11697@gmail.com";
        String senderPasswd = "oxeyibwzqdxoejva";
        GmailSender gmailSender = null;

        if(resultVO != null)
        {
            // 비밀번호를 메일로 전송
            gmailSender = new GmailSender(senderName, senderPasswd);

            // 1번째 param : 받을 사람의 이메일주소
            // 2번째 param : 메일제목
            // 3번째 param : 메일내용
            gmailSender.sendEmail(resultVO.getEmail(), "비밀번호 입니다.", "비밀번호 : " + resultVO.getUserPw());

            return "$OK";
        }
        else
        {
            
            return "$FAIL";

        }






        // if (resultVO != null) {
            
        //     // 패스워드를 메일로 보내주는 기능

        //     String editedId = resultVO.getUserPw();
            
        //     editedId = editedId.substring(0, editedId.length()-2);

        //     return editedId + "**";
        // }
        // else 
        // {
        //     return "$NOID";
        // }

    }
}
