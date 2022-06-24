package com.air.kdh;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.common.HaccDTO;


@Repository
public class HaccDAOImpl implements HaccDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<HaccDTO> getHaccList() {
		return this.sqlSession.selectList("halist");
	}

	@Override
	public int insertHacc(HaccDTO dto) {
		return this.sqlSession.insert("hainsert",dto);
	}

	@Override
	public HaccDTO getHacc(int num) {
		return this.sqlSession.selectOne("hacontent",num);
	}

	@Override
	public int updateHacc(HaccDTO dto) {
		return this.sqlSession.update("hamodify",dto);
	}

	@Override
	public int deleteHacc(int num) {
		return this.sqlSession.delete("hadelete",num);
	}

	@Override
	public void updateSequence(int num) {
		this.sqlSession.update("haseq",num);
		
	}

	
	

}
