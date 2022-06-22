package com.air.kyk;

import java.util.List;

public interface ReviewDAOm {
	
	
	
	public int getReivewListCount(int no);		// 숙소 번호에 따른 리뷰 갯수 조회
	
	public List<ReviewDTOm> reviewCont(int no);		// 숙소번호에 따른 리뷰 조회
	
	public AvgDTO avgCont(int no);
	
	public List<ReviewDTOm> hostReviewCont(int no);
	
	
	public int insertReview();					// 리뷰 생성
	
	public int updateReview(ReviewDTOm dto);		// 리뷰 수정
	
	public int deleteReview(int no);			// 리뷰 삭제
	
}
