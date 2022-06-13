package com.air.cec;

public interface UserHotelDAO {
	//회원가입
	public int insertMember(MemberHotelDTO dto);
	public int insertHost(HostHotelDTO dto);
	
	//회원 정보 가져오기
	public HostHotelDTO getHost(String id);
	public MemberHotelDTO getMember(String id);
	
	//내정보 수정
	public int updateMember(MemberHotelDTO dto);
	public int updateHost(HostHotelDTO dto);
	
	//회원탈퇴
	public int deleteMember(int num);
	public int deleteHost(int num);
	
	public void updateMemberSequence(int no);
	public void updatHostSequence(int no);
}
