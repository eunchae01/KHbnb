package com.air.cec;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class userHotelDAOImpl implements userHotelDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	//회원가입
	@Override
	public int insertMember(memberHotelDTO dto) {
		return this.sqlSession.insert("memberSignUp", dto);
	}

	@Override
	public int insertHost(hostHotelDTO dto) {
		return this.sqlSession.insert("hostSignUp", dto);
	}

	//회원 정보 가져오기
	@Override
	public hostHotelDTO getHost(String id) {
		return this.sqlSession.selectOne("hostInfo", id);
	}
	
	@Override
	public memberHotelDTO getMember(String id) {
		return this.sqlSession.selectOne("memberInfo", id);
	}

	//내정보 수정
	@Override
	public int updateMember(memberHotelDTO dto) {
		return this.sqlSession.update("updateMember", dto);
	}

	@Override
	public int updateHost(hostHotelDTO dto) {
		return this.sqlSession.update("updateHost", dto);
	}

	//회원탈퇴
	@Override
	public int deleteMember(int num) {
		return this.sqlSession.delete("deleteMember", num);
	}

	@Override
	public int deleteHost(int num) {
		return this.sqlSession.delete("deleteHost", num);
	}

	@Override
	public void updateMemberSequence(int no) {
		this.sqlSession.update("seqMember", no);
	}

	@Override
	public void updatHostSequence(int no) {
		this.sqlSession.update("seqHost", no);
	}
}
