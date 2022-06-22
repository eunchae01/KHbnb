package com.air.khie;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.air.cec.HostHotelDTO;
import com.air.cec.MemberHotelDTO;
import com.air.cec.UserHotelDAO;
import com.model.common.MemberDTO;

@Controller
public class CecController {
	@Autowired
	private UserHotelDAO dao;

	// 회원가입
	@RequestMapping("signup.do")
	public String signUp() {
		return "cec/signUp";
	}

	@RequestMapping("signup-host.do")
	public String hostSignUp() {
		return "cec/hostSignUp";
	}

	@RequestMapping("signup-member.do")
	public String memberSignUp() {
		return "cec/memberSignUp";
	}

	@RequestMapping("signup-host-form.do")
	public void hostSignUpOk(HostHotelDTO dto, HttpServletResponse response, MultipartHttpServletRequest fileRequest, HttpServletRequest request) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		String fileName = this.dao.fileUpload(fileRequest);

		dto.setHost_pic(fileName);
		
	    int check = this.dao.insertHost(dto);
		  
		if (check > 0) { out.println("<script>");
			out.println("alert('가입이 완료되었습니다!')");
		    out.println("location.href='login.do'"); 
		    out.println("</script>"); 
		} else {
		    out.println("<script>"); 
		    out.println("alert('가입중 오류가 발생했습니다.')");
		    out.println("history.back()"); 
		    out.println("</script>"); 
		}
		 
	}

	@RequestMapping("signup-member-form.do")
	public void memberSignUpOk(MemberHotelDTO dto, HttpServletResponse response, MultipartHttpServletRequest fileRequest) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		String fileName = this.dao.fileUploadMember(fileRequest);

		dto.setMember_pic(fileName);
		
		int check = this.dao.insertMember(dto);

		if (check > 0) {
			out.println("<script>");
			out.println("alert('가입이 완료되었습니다!')");
			out.println("location.href='login.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('가입중 오류가 발생했습니다.')");
			out.println("history.back()");
			out.println("</script>");
			
		}
	}

	// 로그인
	@RequestMapping("login.do")
	public String login() {
		return "cec/login";
	}

	@RequestMapping("host-login-ok.do")
	public void hostLoginOk(@RequestParam("host_id") String id, @RequestParam("host_pwd") String pwd,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (id.equals("admin") && pwd.equals("1234")) {
			out.println("<script>");
			out.println("alert('관리자 로그인')");
			out.println("location.href='admin_loginOk.do'");
			out.println("</script>");

			HttpSession session = request.getSession();

			String hostORmember = "manager";

			session.setAttribute("hostORmember", hostORmember);
		} else {
			HostHotelDTO dto = this.dao.getHost(id);

			if (dto != null) {
				if (pwd.equals(dto.getHost_pwd())) {
					out.println("<script>");
					out.println("alert('로그인 성공')");
					out.println("location.href='host_main.do'");
					out.println("</script>");

					HttpSession session = request.getSession();

					String hostORmember = "host";

					session.setAttribute("host_num", dto.getHost_num());
					session.setAttribute("host_id", dto.getHost_id());
					session.setAttribute("hostORmember", hostORmember);
					
				} else {
					out.println("<script>");
					out.println("alert(' 비밀번호를 확인해주세요.')");
					out.println("history.back()");
					out.println("</script>");
				}
			} else {
				out.println("<script>");
				out.println("alert('아이디를 확인해주세요.')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
	}

	@RequestMapping("member-login-ok.do")
	public void memberLoginOk(@RequestParam("member_id") String id, @RequestParam("member_pwd") String pwd,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (id.equals("admin") && pwd.equals("1234")) {
			out.println("<script>");
			out.println("alert('관리자 로그인')");
			out.println("location.href='admin_loginOk.do'");
			out.println("</script>");

			HttpSession session = request.getSession();

			String hostORmember = "manager";

			session.setAttribute("hostORmember", hostORmember);
		} else {
			MemberHotelDTO dto = this.dao.getMember(id);

			if (dto != null) {
				if (pwd.equals(dto.getMember_pwd())) {
					out.println("<script>");
					out.println("alert('로그인 성공')");
					out.println("location.href='info-update.do'");
					out.println("</script>");

					HttpSession session = request.getSession();

					String hostORmember = "member";

					session.setAttribute("member_num", dto.getMember_num());
					session.setAttribute("member_id", dto.getMember_id());
					session.setAttribute("hostORmember", hostORmember);
				} else {
					out.println("<script>");
					out.println("alert(' 비밀번호를 확인해주세요.')");
					out.println("history.back()");
					out.println("</script>");
				}
			} else {
				out.println("<script>");
				out.println("alert('아이디를 확인해주세요.')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
	}

	// 아이디 & 비밀번호 찾기
	@RequestMapping("find-user.do")
	public String findInfo() {
		return "cec/findUser";
	}
	
	@RequestMapping("find-host.do")
	public String findHost() {
		return "cec/findHost";
	}
	
	@RequestMapping("find-member.do")
	public String findMember() {
		return "cec/findMember";
	}

	@RequestMapping("find-host-id.do")
	public void findHostId(@RequestParam("host_name") String name, @RequestParam("host_phone") String phone, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		HostHotelDTO dto = this.dao.findHostId(phone);
		
		PrintWriter out = response.getWriter();

		 if (dto != null) { 
			 if (name.equals(dto.getHost_name())) {
				 out.println("<script>"); 
				 out.println("alert('아이디는" + dto.getHost_id() + "입니다')"); 
				 out.println("history.back()"); 
				 out.println("</script>"); 
			} else {
				out.println("<script>"); 
				out.println("alert('이름을 확인해주세요.')");
				out.println("history.back()"); 
				out.println("</script>"); 
			} 
		} else {
			out.println("<script>"); 
			out.println("alert('핸드폰번호를 확인해주세요.')");
			out.println("history.back()"); 
			out.println("</script>"); 
		}
	}

	@RequestMapping("find-host-pwd.do")
	public void findHostPwd(@RequestParam("host_id") String id, @RequestParam("host_phone") String phone,
			@RequestParam("host_name") String name, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		HostHotelDTO dto = this.dao.findHostPwd(phone);

		PrintWriter out = response.getWriter();
		
		if (dto != null) {	//핸드폰번호 맞을때
			if (id.equals(dto.getHost_id())) {	//아이디 맞을때
				if (name.equals(dto.getHost_name())) {
					out.println("<script>"); 
					out.println("alert('비밀번호는" + dto.getHost_pwd() + "입니다.')");
					out.println("history.back()"); 
					out.println("</script>"); 
				}
			} else {
				out.println("<script>"); 
				out.println("alert('아이디를 확인해주세요.')");
				out.println("history.back()"); 
				out.println("</script>"); 
			}
			
		} else {	//핸드폰 번호 틀릴때
			out.println("<script>"); 
			out.println("alert('핸드폰번호를 확인해주세요.')");
			out.println("history.back()"); 
			out.println("</script>"); 
		}
	}
	
	@RequestMapping("find-member-id.do")
	public void findMemberId(@RequestParam("member_name") String name, @RequestParam("member_phone") String phone,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		MemberHotelDTO dto = this.dao.findMemberId(phone);
		
		PrintWriter out = response.getWriter();

		 if (dto != null) { 
			 if (name.equals(dto.getMember_name())) {
				 out.println("<script>"); 
				 out.println("alert('아이디는" + dto.getMember_id() + "입니다')"); 
				 out.println("history.back()"); 
				 out.println("</script>"); 
			} else {
				out.println("<script>"); 
				out.println("alert('이름을 확인해주세요.')");
				out.println("history.back()"); 
				out.println("</script>"); 
			} 
		} else {
			out.println("<script>"); 
			out.println("alert('핸드폰번호를 확인해주세요.')");
			out.println("history.back()"); 
			out.println("</script>"); 
		}

	}

	@RequestMapping("find-member-pwd.do")
	public void findMemberPwd(@RequestParam("member_id") String id, @RequestParam("member_phone") String phone,
			@RequestParam("member_name") String name, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		MemberHotelDTO dto = this.dao.findMemberPwd(phone);

		PrintWriter out = response.getWriter();
		
		if (dto != null) {	//핸드폰번호 맞을때
			if (id.equals(dto.getMember_id())) {	//아이디 맞을때
				if (name.equals(dto.getMember_name())) {
					out.println("<script>"); 
					out.println("alert('비밀번호는" + dto.getMember_pwd() + "입니다.')");
					out.println("history.back()"); 
					out.println("</script>"); 
				}
			} else {
				out.println("<script>"); 
				out.println("alert('아이디를 확인해주세요.')");
				out.println("history.back()"); 
				out.println("</script>"); 
			}
		} else {	//핸드폰 번호 틀릴때
			out.println("<script>"); 
			out.println("alert('핸드폰번호를 확인해주세요.')");
			out.println("history.back()"); 
			out.println("</script>"); 
		}
	}

	// 내정보 수정
	@RequestMapping("info-update.do")
	public String userUpdate(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();

		String hostORmember = (String) session.getAttribute("hostORmember");

		if (hostORmember.equals("host")) {
			String host_id = (String) session.getAttribute("host_id");

			HostHotelDTO hostDTO = this.dao.getHost(host_id);

			model.addAttribute("updateHost", hostDTO);
		} else { // member
			String member_id = (String) session.getAttribute("member_id");

			MemberHotelDTO memberDTO = this.dao.getMember(member_id);

			model.addAttribute("updateMember", memberDTO);
		}

		return "cec/userUpdate";
	}

	@RequestMapping("info-update-form.do")
	public void hostUpdate(HostHotelDTO hostDTO, MemberHotelDTO memberDTO, HttpServletRequest request, MultipartHttpServletRequest fileRequest, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		String hostORmember = (String) session.getAttribute("hostORmember");

		PrintWriter out = response.getWriter();
		
		String fileName = this.dao.fileUpload(fileRequest);
		String fileNameMember = this.dao.fileUploadMember(fileRequest);

		if (hostORmember.equals("host")) { 

			hostDTO.setHost_pic(fileName);
			
			int check = this.dao.updateHost(hostDTO);

			if (check > 0) {
				out.println("<script>");
				out.println("alert('내 정보가 수정되었습니다.')");
				out.println("location.href='info-update.do'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('오류가 발생했습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
		} else { //member

			memberDTO.setMember_pic(fileNameMember);
			
			int check = this.dao.updateMember(memberDTO);

			if (check > 0) {
				out.println("<script>");
				out.println("alert('내 정보가 수정되었습니다.')");
				out.println("location.href='info-update.do'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('오류가 발생했습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
	}

	// 회원탈퇴
	@RequestMapping("delete-user.do")
	public String deleteUser() {
		return "cec/deleteUser";
	}
	
	@RequestMapping("delete-user-ok.do")
	public void deleteUserOk(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();

		String hostORmember = (String) session.getAttribute("hostORmember");

		PrintWriter out = response.getWriter();

		if (hostORmember.equals("host")) {
			int host_num = (Integer) session.getAttribute("host_num");

			int check = this.dao.deleteHost(host_num);

			if (check > 0) {
				this.dao.updatHostSequence(host_num);

				out.println("<script>");
				out.println("alert('성공적으로 탈퇴되었습니다.')");
				out.println("location.href='login.do'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('탈퇴에 실패했습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
		} else { // member
			int member_num = (Integer) session.getAttribute("member_num");

			int check = this.dao.deleteMember(member_num);

			if (check > 0) {
				this.dao.updateMemberSequence(member_num);

				out.println("<script>");
				out.println("alert('성공적으로 탈퇴되었습니다.')");
				out.println("location.href='login.do'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('탈퇴에 실패했습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
	}

	// 로그아웃
	@RequestMapping("log-out.do")
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession();

		session.invalidate();

		return "home";
	}
}
