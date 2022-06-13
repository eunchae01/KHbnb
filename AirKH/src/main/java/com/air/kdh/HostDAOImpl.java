package com.air.kdh;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.common.HostDTO;
import com.model.common.PageDTO;

@Repository
public class HostDAOImpl implements HostDAO{
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int getListCount() {
		return this.sqlSession.selectOne("coun");
	}
	
	@Override
	public List<HostDTO> getHostList(PageDTO dto) {
		return this.sqlSession.selectList("all", dto);
	}

	@Override
	public int insertHost(HostDTO dto) {
		return this.sqlSession.insert("add",dto);
	}

	
	
	@Override
	public HostDTO getHost(int host_num) {
		return this.sqlSession.selectOne("content", host_num);
	}

	@Override
	public int updateHost(HostDTO dto) {
		return this.sqlSession.update("update", dto);
	}

	@Override
	public int deleteHost(int num) {
		return this.sqlSession.delete("del",num);
	}

	@Override
	public void updateSequence(int num) {
		this.sqlSession.update("seq",num);
		
	}

	

	@Override
	public int searchHostCount(String field, String keyword) {
		return this.sqlSession.selectOne(field, keyword);
	}

	@Override
	public List<HostDTO> searchHostList(PageDTO dto) {
		return this.sqlSession.selectList(dto.getField()+"1",dto);
	}

	

	
	

}
