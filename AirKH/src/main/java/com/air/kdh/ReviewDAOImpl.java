package com.air.kdh;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.common.PageDTO;
import com.model.common.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	
	@Autowired
	SqlSessionTemplate sqlSession;
			

	@Override
	public int getListCont() {
		return this.sqlSession.selectOne("rcount");
	}

	@Override
	public List<ReviewDTO> getReviewList(PageDTO dto) {
		return this.sqlSession.selectList("rlist",dto);
	}
	
	@Override
	public int insertReview(ReviewDTO dto) {
		return this.sqlSession.insert("rwrite",dto);
	}

	@Override
	public ReviewDTO ReviewCont(int no) {
		return this.sqlSession.selectOne("rcontent",no);
	}

	

	@Override
	public int updateReview(ReviewDTO dto) {
		return this.sqlSession.update("rupdate",dto);
	}

	@Override
	public int deleteReview(int no) {
		return this.sqlSession.delete("rdelete",no);
	}

	@Override
	public void updateSequence(int no) {
		this.sqlSession.update("rseq",no);
		
	}

	@Override
	public int searchReviewCount(String field, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewDTO> searchReviewList(PageDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
