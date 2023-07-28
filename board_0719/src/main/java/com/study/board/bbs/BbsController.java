package com.study.board.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.board.common.SessionUtil;
import com.study.board.user.UserTblVO;

@Controller
public class BbsController {

    @Autowired
    BbsDAO bbsDAO;

    @PostMapping("/bbs/list")
    @ResponseBody       //divi, page, rowsPerPage
    public BbsMstVO bbsList(@ModelAttribute("BbsTblVO") BbsTblVO vo) throws Exception
    {
        BbsMstVO bbsMstVO = new BbsMstVO();

        //1. 전체 row의 개수를 가지고온다.
        int rowCount = bbsDAO.selectBbsRowCount();

        //2. page에 해당하는 BBS데이터를 가지고 온다.
        List<BbsTblVO> list = bbsDAO.selectBbsList(vo);

        //3. BbsMstVO에 저장하고 전송한다.
        bbsMstVO.setRowCount(rowCount);
        bbsMstVO.setBbsList(list);

        return bbsMstVO;
        
    }
    
    @GetMapping("/bbs/content")             // UserId, seq
    public String content(@ModelAttribute("BbsTblVO") BbsTblVO vo, 
                          Model model) throws Exception
    {        
        // userId, seq에 맞는 게시물을 가지고 온다.
        BbsTblVO resultVO = bbsDAO.selectBbsContent(vo);

        // 세션정보를 가지고온다.
        UserTblVO userTblVO = (UserTblVO) SessionUtil.getAttribute("USER");

        // 게시물 정보와 세션정보를 모델에 저장한다.
        // 즉 content.jsp에서 이 두 정보를 다 이용한다. (myContent??)
        model.addAttribute("vo", resultVO);
        model.addAttribute("session", userTblVO);

        return "bbs/content";
    }

    @PostMapping("/bbs/content")
    @ResponseBody         // UserId, seq, title, content ===> vo
    public String content(@ModelAttribute("BbsTblVO") BbsTblVO vo) throws Exception
    {
        int updateCount = bbsDAO.updateBbsContent(vo);

        if (updateCount == 1) {
            return "OK";
        }
        else {
            return "FAIL";
        }
    }
    
    @GetMapping("/bbs/newcontent")
    public String newContent(Model model) throws Exception
    {
        UserTblVO userTblVO = (UserTblVO) SessionUtil.getAttribute("USER");
        model.addAttribute("session", userTblVO);

        return "bbs/newcontent";
    }

    @PostMapping("/bbs/newcontent")
    @ResponseBody            //userId, title, content, divi
    public String newContent(@ModelAttribute("BbsTblVO") BbsTblVO vo) throws Exception    
    {
        int count = bbsDAO.insertBbsContent(vo);

        if (count == 1) {
            return "OK";
        }
        else {
            return "FAIL";
        }
        
    }



}
