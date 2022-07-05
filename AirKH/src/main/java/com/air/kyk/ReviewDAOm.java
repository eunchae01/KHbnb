package com.air.kyk;

import java.util.List;

public interface ReviewDAOm {



	public int getReivewListCount(int no);		// 숙소 번호에 따른 리뷰 갯수 조회
	
	public int gethostCount(int host_num);		// 호스트 번호에 따른 리뷰 갯수 조회

	public List<ReviewDTOm> reviewCont(int no);		// 숙소번호에 따른 리뷰 조회

	public int reinsert_hostnum(int no);			 // 숙소번호에 따른 호스트번호 조회
	
	public int review_modify(int review_num);
	
	public String reinsert_pic(String member_id);	//  멤버 아이디에 따른 멤버 사진
	
	public AvgDTO avgCont(int no);					// 뷰테이블 조회
	
	public double avgSelect(int no);				// 숙소 번호에 따른 평균 grade 조회
	
	public int insertStar(int no);					// acc_star 인서트

	public List<ReviewDTOm> hostReviewCont(int no);		// 호스트번호에 따른 리뷰 조회


	public int insertReview(ReviewDTOm dto);					// 리뷰 생성
	

	
}