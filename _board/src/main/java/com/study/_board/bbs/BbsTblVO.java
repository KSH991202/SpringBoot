package com.study._board.bbs;

import lombok.Data;

@Data
public class BbsTblVO {

    // 파생속성 
    private String pageNum;     // 몇번째 페이지인가?
    private String rowPerPage;  // 페이지당 Row의 개수 
    
    // 기본속성
    private String seq;
    private String title;
    private String content;
    private String regdate;
    private String divi;
    private String userId;
    
}
