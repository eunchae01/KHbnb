package com.air.kyk;

import lombok.Data;

@Data
public class ReviewDTOm {

	private int acc_code;		// 숙소번호
	private int review_num;		// 리뷰번호
	private String member_id;	// 회원아이디
	private int review_cl;		// 청결도 점수
	private int review_comm;	// 의사소통 점수
	private int review_check;	// 체크인 점수
	private int review_acc;		// 정확성 점수
	private int review_loc;		// 위치 점수
	private String member_pic;		// 회원 사진
	private int review_sat;		// 가격대비 만족도
	private String review_date;	// 예약날짜
	private int review_grade;	// 별점
	private String review_content;	// 후기내용

}