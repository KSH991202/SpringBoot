package com.study.board.user;

import lombok.Data;

@Data
public class UserTblVO {
    private String userId;
    private String userPw;
    private String email;
    private String name;
}
