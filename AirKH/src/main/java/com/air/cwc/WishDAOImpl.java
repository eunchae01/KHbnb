package com.air.cwc;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.jdy.AccDTO;

@Repository
public class WishDAOImpl implements WishDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<WishDTO> getWishList(WishDTO dto) {
	return this.sqlSession.selectList("allwish",dto);
	}
	
	@Override
	public List<WishDTO> getcateList(String member_name) {
		return this.sqlSession.selectList("allcate",member_name);
	}
	
	
	@Override
	public int addWish(WishDTO dto) {
		return this.sqlSession.insert("addwish", dto);
		
	}
	
	@Override
	public int deleteWish(int acc_code) {
		return this.sqlSession.delete("deletewish", acc_code);
	}
	
	@Override
	public int addCategory(WishCategoryDTO dto) {
		return this.sqlSession.insert("addCate",dto);
	}

}
