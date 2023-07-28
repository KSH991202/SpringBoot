package com.study.board.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public UserTblVO selectOneUser(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneUser", vo);

    }
    
    public UserTblVO selectOneUserExist(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneUserExist", vo);

    }

    public UserTblVO selectOneUserEmail(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneUserEmail", vo);

    }
    public int insertOneUser(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("insertOneUser", vo);
    }

}
