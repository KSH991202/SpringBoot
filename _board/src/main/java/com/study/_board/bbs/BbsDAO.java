package com.study._board.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository // 데이터를 저장하는데 쓰이는 것 저장소
public class BbsDAO {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    // 쿼리를 집어넣었을때 여러개의 결과값을 가지는 패턴
    public List<BbsTblVO> selectBbsList(BbsTblVO vo) throws Exception
    {

        return sqlSessionTemplate.selectList("selectBbsList", vo);
        
    }

    public BbsTblVO selectOneContent(BbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneContent", vo);
    }
}
