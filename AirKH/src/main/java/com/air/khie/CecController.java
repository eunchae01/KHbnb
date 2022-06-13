package com.air.khie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.air.cec.HostHotelDTO;
import com.air.cec.MemberHotelDTO;
import com.air.cec.UserHotelDAO;

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
	public void hostSignUpOk(HostHotelDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		int check = this.dao.insertHost(dto);

		PrintWriter out = response.getWriter();

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

	@RequestMapping("signup-member-form.do")
	public void memberSignUpOk(MemberHotelDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		int check = this.dao.insertMember(dto);

		PrintWriter out = response.getWriter();

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
			out.println("history.back()");
			out.println("</script>");

			HttpSession session = request.getSession();

			String hostORmember = "manager";

			session.setAttribute("hostORmember", hostORmember);
		} else {
			HostHotelDTO dto = this.dao.getHost(id);

			if (pwd.equals(dto.getHost_pwd())) {
				out.println("<script>");
				out.println("alert('로그인 성공')");
				out.println("location.href='info-update.do'");
				out.println("</script>");

				HttpSession session = request.getSession();

				String hostORmember = "host";

				session.setAttribute("host_num", dto.getHost_num());
				session.setAttribute("host_id", dto.getHost_id());
				session.setAttribute("hostORmember", hostORmember);
			} else {
				out.println("<script>");
				out.println("alert('아이디나 비밀번호를 확인해주세요.')");
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
			out.println("history.back()");
			out.println("</script>");

			HttpSession session = request.getSession();

			String hostORmember = "manager";

			session.setAttribute("hostORmember", hostORmember);
		} else {
			MemberHotelDTO dto = this.dao.getMember(id);

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
				out.println("alert('아이디나 비밀번호를 확인해주세요.')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
	}

	// 아이디 & 비밀번호 찾기
	@RequestMapping("find-info.do")
	public String findInfo() {
		return "cec/findInfo";
	}

	@RequestMapping("find-info-id.do")
	public void findInfoId(@RequestParam("id") String id, @RequestParam("phone") String phone,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

	}

	@RequestMapping("find-info-pwd.do")
	public void findInfoPwd(@RequestParam("id") String id, @RequestParam("phone") String phone,
			@RequestParam("name") String name, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

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
	public void hostUpdate(HostHotelDTO hostDTO, MemberHotelDTO memberDTO, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		String hostORmember = (String) session.getAttribute("hostORmember");

		PrintWriter out = response.getWriter();
		
		if (hostORmember.equals("host")) { 
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
	public void deleteMember(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
