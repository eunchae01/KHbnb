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
		return this.sqlSession.insert("QA_insert", dto);
	}

	@Override
	public int QA_delete(int qa_num) {
		return this.sqlSession.delete("QA_delete", qa_num);
	}

	@Override
	public int QA_update(QA_boardDTO dto) {
		return this.sqlSession.update("QA_update", dto);
	}


	@Override
	public List<QA_boardDTO> getQaList(String qa_id) {
		return this.sqlSession.selectList("qa_select", qa_id);
	}

	@Override
	public QA_boardDTO getQaCont(int qa_num) {
		return this.sqlSession.selectOne("qa_cont", qa_num);
	}

	

	

}
