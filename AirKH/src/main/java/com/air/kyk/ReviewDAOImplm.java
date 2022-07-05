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
	public int insertReview(ReviewDTOm dto) {
		return this.sqlSession.insert("re_add", dto);
	}

	

	@Override
	public AvgDTO avgCont(int no) {

		return this.sqlSession.selectOne("re_avg", no);
	}

	@Override
	public List<ReviewDTOm> hostReviewCont(int no) {
		return this.sqlSession.selectList("host_re", no);
	}

	@Override
	public int reinsert_hostnum(int no) {
		
		return this.sqlSession.selectOne("re_hostNum",no);
	}

	@Override
	public String reinsert_pic(String member_id) {
		return this.sqlSession.selectOne("re_pic", member_id);
	}

	@Override
	public int gethostCount(int host_num) {

		return this.sqlSession.selectOne("host_count", host_num);
	}

	@Override
	public int review_modify(int review_num) {
		return this.sqlSession.update("re_modify", review_num);
	}

	@Override
	public double avgSelect(int no) {
		
		return this.sqlSession.selectOne("avg_select", no);
	}

	@Override
	public int insertStar(int no) {
		return this.sqlSession.update("acc_star", no);
	}

	

	




}