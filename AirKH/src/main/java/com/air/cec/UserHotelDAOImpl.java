package com.air.cec;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.air.cwc.PaymentDTO;

@Repository
public class UserHotelDAOImpl implements UserHotelDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	//회원가입
	@Override
	public int insertMember(MemberHotelDTO dto) {
		return this.sqlSession.insert("memberSignUp", dto);
	}

	@Override
	public int insertHost(HostHotelDTO dto) {
		return this.sqlSession.insert("hostSignUp", dto);
	}

	@Override
	public String fileUpload(MultipartHttpServletRequest fileRequest) {
		boolean isUpload = false;
	
		String uploadPath = "C:\\Users\\Eunchae\\Desktop\\test5\\AirKH\\src\\main\\webapp\\resources\\host\\";
		
		//업로드된 파일들의 이름 목록을 제공하는 메소드
		Iterator<String> iterator = fileRequest.getFileNames();
		
		String saveFileName = null;
		
		while (iterator.hasNext()) {
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = fileRequest.getFile(uploadFileName);
		
			// 업로드한 파일의 이름을 구현하는 메소드
			String originalFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 생성
			// .....\\resources\\upload\\
			File path1 = new File(uploadPath);
			
			if (!path1.exists()) {
				path1.mkdirs();
			}
			//실제 파일 만들기
			saveFileName = originalFileName;
			
			if (saveFileName != null) {
				saveFileName = System.currentTimeMillis() + "_" + saveFileName;
			
				try {
					// .....\\resources\\upload\\2022-05-30\\실제파일
					File origin = new File(uploadPath + "/" + saveFileName);
					
					// transferTo() : 파일데이터를 지정한 폴더로 실제 저장시키는 메소드
					mFile.transferTo(origin);
					
					isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
				}
			}
		}	// while문 end
		if(isUpload) {
			return saveFileName;
		}else {
			return null;
		}
	}	//fileUpload() end
	
	@Override
	public String fileUploadMember(MultipartHttpServletRequest fileRequest) {
		boolean isUpload = false;
	
		String uploadPath = "C:\\Users\\Eunchae\\Desktop\\test5\\AirKH\\src\\main\\webapp\\resources\\member\\";
		
		//업로드된 파일들의 이름 목록을 제공하는 메소드
		Iterator<String> iterator = fileRequest.getFileNames();
		
		String saveFileName = null;
		
		while (iterator.hasNext()) {
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = fileRequest.getFile(uploadFileName);
		
			// 업로드한 파일의 이름을 구현하는 메소드
			String originalFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 생성
			// .....\\resources\\upload\\
			File path1 = new File(uploadPath);
			
			if (!path1.exists()) {
				path1.mkdirs();
			}
			//실제 파일 만들기
			saveFileName = originalFileName;
			
			if (saveFileName != null) {
				saveFileName = System.currentTimeMillis() + "_" + saveFileName;
			
				try {
					// .....\\resources\\upload\\2022-05-30\\실제파일
					File origin = new File(uploadPath + "/" + saveFileName);
					
					// transferTo() : 파일데이터를 지정한 폴더로 실제 저장시키는 메소드
					mFile.transferTo(origin);
					
					isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
				}
			}
		}	// while문 end
		if(isUpload) {
			return saveFileName;
		}else {
			return null;
		}
	}	//fileUpload() end
	
	// 아이디/비밀번호 찾기 (phone으로)
	@Override
	public MemberHotelDTO findMemberId(String phone) {
		return this.sqlSession.selectOne("findMemberId", phone);
	}

	@Override
	public HostHotelDTO findHostId(String phone) {
		return this.sqlSession.selectOne("findHostId", phone);
	}

	@Override
	public MemberHotelDTO findMemberPwd(String phone) {
		return this.sqlSession.selectOne("findMemberPwd", phone);
	}

	@Override
	public HostHotelDTO findHostPwd(String phone) {
		return this.sqlSession.selectOne("findMemberPwd", phone);
	}
	
	//회원 정보 가져오기 (id로)
	@Override
	public HostHotelDTO getHost(String id) {
		return this.sqlSession.selectOne("hostInfo", id);
	}
	
	@Override
	public MemberHotelDTO getMember(String id) {
		return this.sqlSession.selectOne("memberInfo", id);
	}
	
	//회원 정보 가져오기 (name으로)
	@Override
	public HostHotelDTO getHostName(String name) {
		return this.sqlSession.selectOne("hostInfoName", name);
	}
	
	@Override
	public MemberHotelDTO getMemberName(String name) {
		return this.sqlSession.selectOne("memberInfoName", name);
	}

	//내정보 수정
	@Override
	public int updateMember(MemberHotelDTO dto) {
		return this.sqlSession.update("updateMember", dto);
	}

	@Override
	public int updateHost(HostHotelDTO dto) {
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

	@Override
	public HostHotelDTO getHostByNum(int hostno) {
		return this.sqlSession.selectOne("hostByNum", hostno);
	}

	//메세지(왼쪽 바)
	public List<PaymentDTO> memReserve(String member_name) {
		return this.sqlSession.selectList("memMsg", member_name);
	}
	
	public List<PaymentDTO> hostReserve(String host_name) {
		return this.sqlSession.selectList("hostMsg", host_name);
	}

	@Override
	public List<MsgHotelDTO> msgInfo() {
		return this.sqlSession.selectList("infoMsg");
	}

	@Override
	public List<MsgHotelDTO> msgList(MsgHotelDTO dto) {
		return this.sqlSession.selectList("getMsg", dto);
	}
	
	@Override
	public int insertMsg(MsgHotelDTO dto) {
		return this.sqlSession.insert("insertMsg", dto);
	}
	
	@Override
	public int insertMsgH(MsgHotelDTO dto) {
		return this.sqlSession.insert("insertMsgH", dto);
	}

}
