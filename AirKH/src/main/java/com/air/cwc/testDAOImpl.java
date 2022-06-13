package com.air.cwc;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class testDAOImpl implements testDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<testDTO> getEmpList() {
		return this.sqlSession.selectList("all");
	}
	
	@Override
	public int addWish(testDTO dto) {
		return this.sqlSession.insert("wish", dto);
	}
	
	@Override
	public testDTO getEmp(int acc_code) {
		return this.sqlSession.selectOne("paycont", acc_code);
	}
}
