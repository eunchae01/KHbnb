package com.air.kyk;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImplm implements ReviewDAOm{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getReivewListCount(int no) {
		
		return this.sqlSession.selectOne("re_count",no);
	}

	@Override
	public List<ReviewDTOm> reviewCont(int no) {
		return this.sqlSession.selectList("re_select", no);
	}

	@Override
	public int insertReview() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReview(ReviewDTOm dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AvgDTO avgCont(int no) {
		
		return this.sqlSession.selectOne("re_avg", no);
	}

	@Override
	public List<ReviewDTOm> hostReviewCont(int no) {
		return this.sqlSession.selectList("host_re", no);
	}

	

	

}
