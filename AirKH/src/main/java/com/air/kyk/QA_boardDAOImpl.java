package com.air.kyk;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class QA_boardDAOImpl implements QA_boardDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int QA_insert(QA_boardDTO dto) {
		return this.sqlSession.selectOne("QA_insert", dto);
	}

	@Override
	public int QA_delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int QA_update(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<QA_boardDTO> getQaList() {
		// TODO Auto-generated method stub
		return null;
	}

}
