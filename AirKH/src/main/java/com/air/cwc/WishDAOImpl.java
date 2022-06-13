package com.air.cwc;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishDAOImpl implements WishDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<WishDTO> getWishList() {
	return this.sqlSession.selectList("allwish");
	}
	
	@Override
	public int addWish(WishDTO dto) {
		return this.sqlSession.insert("addwish", dto);
	}
	
	@Override
	public int deleteWish(int acc_code) {
		return this.sqlSession.delete("deletewish", acc_code);
	}
}
