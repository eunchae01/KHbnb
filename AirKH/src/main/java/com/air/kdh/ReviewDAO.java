package com.air.kdh;

import java.util.List;

import com.air.common.PageDTO;
import com.air.common.ReviewDTO;

public interface ReviewDAO {
	
	public int getListCont();
	
	public List<ReviewDTO> getReviewList(PageDTO dto);
	
	public int insertReview(ReviewDTO dto);
	
	public ReviewDTO ReviewCont(int no);
	
	public int updateReview(ReviewDTO dto);
	
	public int deleteReview(int no);
	
	public void updateSequence(int no);
	
	public int searchReviewCount(String field, String keyword);
	
	public List<ReviewDTO> searchReviewList(PageDTO dto);
	

}
