package com.air.cwc;

import java.util.List;

import com.air.jdy.AccDTO;

public interface WishDAO {

	public List<WishDTO> getWishList(WishDTO dto);
	public List<WishDTO> getcateList(String member_name);
	public int addWish(WishDTO dto);
	public int deleteWish(int acc_code);
	public int addCategory(WishCategoryDTO dto);
}
