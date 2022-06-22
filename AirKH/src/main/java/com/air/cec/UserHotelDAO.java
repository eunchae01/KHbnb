package com.air.cec;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface UserHotelDAO {
	//회원가입
	public int insertMember(MemberHotelDTO dto);
	public int insertHost(HostHotelDTO dto);
	
	public String fileUpload(MultipartHttpServletRequest fileRequest);
	public String fileUploadMember(MultipartHttpServletRequest fileRequest);
	
	// 아이디 / 비밀번호 찾기
	public MemberHotelDTO findMemberId(String phone);
	public HostHotelDTO findHostId(String phone);
	public MemberHotelDTO findMemberPwd(String phone);
	public HostHotelDTO findHostPwd(String phone);
	
	//회원 정보 가져오기
	public HostHotelDTO getHost(String id);
	public MemberHotelDTO getMember(String id);
	public HostHotelDTO getHostByNum(int no);
	
	//내정보 수정
	public int updateMember(MemberHotelDTO dto);
	public int updateHost(HostHotelDTO dto);
	
	//회원탈퇴
	public int deleteMember(int num);
	public int deleteHost(int num);
	
	public void updateMemberSequence(int no);
	public void updatHostSequence(int no);
}
