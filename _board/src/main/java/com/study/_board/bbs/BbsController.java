package com.study._board.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BbsController {
 
    @Autowired
    BbsDAO bbsDao;

    @PostMapping("/bbs/list")
    @ResponseBody  // "OK"이라는 문자열을 jsp파일을 호출하는것이 아니라 응답을 하는것이다
    public BbsMstVo dataBbslist(@ModelAttribute("BbsTblVO") BbsTblVO vo) throws Exception
    {
        BbsMstVo mstvo = new BbsMstVo();

        // 쿼리를 전송하여 결과를 가지고 온다
        List<BbsTblVO> list = bbsDao.selectBbsList(vo);

        mstvo.setBbsList(list);

        return mstvo;
    }

    @GetMapping("/bbs/content")
    public String viewContent(/* 1. param 추가 */ @ModelAttribute("BbsTblVO") BbsTblVO vo, Model model) throws Exception
    {
        // 2. 쿼리를 DB에 던져서 결과를 가지고 온다
        //SELECT * FROM BBS_TBL WHERE userid='ksh' AND seq=1;
        BbsTblVO resultVO = bbsDao.selectOneContent(vo);


        // 3. 결과를 가지고 JSP를 만들어서 보내준다
        model.addAttribute("vo", resultVO);
       

        return "bbs/content";
    }

}
