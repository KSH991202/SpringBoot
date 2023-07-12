package com.study._board.bbs;

import java.util.List;

import lombok.Data;

@Data
public class BbsMstVo {
    private int rowCount;
    private List<BbsTblVO> bbsList;
}
