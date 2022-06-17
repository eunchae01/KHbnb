package com.air.kdh;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.common.MemberDTO;
import com.air.common.PageDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return this.sqlSession.selectOne("mcount");
	}

	@Override
	public List<MemberDTO> getMemberList(PageDTO dto) {
		return this.sqlSession.selectList("mlist", dto);
	}

	@Override
	public int insertMember(MemberDTO dto) {
		return this.sqlSession.insert("madd",dto);
	}

	

	@Override
	public MemberDTO memberCont(int no) {
		return this.sqlSession.selectOne("mcontent", no);
	}

	@Override
	public int updateMember(MemberDTO dto) {
		return this.sqlSession.update("mupdate", dto);
	}

	@Override
	public int deleteMember(int no) {
		return this.sqlSession.delete("mdelete", no);
	}

	@Override
	public void updateSequence(int no) {
		this.sqlSession.update("mseq",no);
		
	}

	@Override
	public int searchMemberCount(String field, String keyword) {
		return this.sqlSession.selectOne(field, keyword);
	}

	@Override
	public List<MemberDTO> searchMemberList(PageDTO dto) {
		return this.sqlSession.selectList(dto.getField()+"1",dto);
	}
	
	

}
