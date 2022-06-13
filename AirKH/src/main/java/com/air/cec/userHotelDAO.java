package com.air.cec;

public interface userHotelDAO {
	//회원가입
	public int insertMember(memberHotelDTO dto);
	public int insertHost(hostHotelDTO dto);
	
	//회원 정보 가져오기
	public hostHotelDTO getHost(String id);
	public memberHotelDTO getMember(String id);
	
	//내정보 수정
	public int updateMember(memberHotelDTO dto);
	public int updateHost(hostHotelDTO dto);
	
	//회원탈퇴
	public int deleteMember(int num);
	public int deleteHost(int num);
	
	public void updateMemberSequence(int no);
	public void updatHostSequence(int no);
}
