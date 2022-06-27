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
	public List<WishDTO> getWishList(String member_name) {
	return this.sqlSession.selectList("allwish",member_name);
	}
	
	@Override
	public int addWish(AccDTO dto) {
		if(this.sqlSession.selectOne("wlist",dto)==null) {
		return this.sqlSession.insert("addwish", dto);
		}else
			return -1;
	}
	
	@Override
	public int deleteWish(int acc_code) {
		return this.sqlSession.delete("deletewish", acc_code);
	}
}
