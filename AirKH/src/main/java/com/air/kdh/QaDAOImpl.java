package com.air.kdh;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.common.PageDTO;
import com.air.common.QaDTO;

@Repository
public class QaDAOImpl implements QaDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCont() {
		return this.sqlSession.selectOne("Qacount");
	}

	@Override
	public List<QaDTO> getQaList(PageDTO dto) {
		return this.sqlSession.selectList("qalist",dto);
	}

	@Override
	public int insertQa(QaDTO dto) {
		return this.sqlSession.insert("qainsert",dto);
	}

	@Override
	public QaDTO QaCont(int no) {
		return this.sqlSession.selectOne("qaco",no);
	}
	
	@Override
	public void insertSt(QaDTO dto) {
		this.sqlSession.update("qaste",dto);
		
	}
	
	@Override
	public int insertRe(QaDTO dto) {
		return this.sqlSession.insert("reinsert",dto);
	}

	@Override
	public int updateQa(QaDTO dto) {
		return this.sqlSession.update("updateqa",dto);
	}

	@Override
	public int deleteQa(int no) {
		return this.sqlSession.delete("delqa",no);
	}

	@Override
	public void updateSequence(int no) {
		this.sqlSession.update("qaseq",no);
		
	}

	

	

	
	
	

}
