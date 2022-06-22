package com.air.kdh;

import java.util.List;

import com.air.common.MemberDTO;
import com.air.common.PageDTO;

public interface MemberDAO {
	
	public int getListCount();
	
	public List<MemberDTO> getMemberList(PageDTO dto);
	
	public int insertMember(MemberDTO dto);
	
	
	public MemberDTO memberCont(int no);
	
	public int updateMember(MemberDTO dto);
	
	public int deleteMember(int no);
	
	public void updateSequence(int no);
	
	public int searchMemberCount(String field, String keyword);
	
	public List<MemberDTO> searchMemberList(PageDTO dto);
	
	

}
