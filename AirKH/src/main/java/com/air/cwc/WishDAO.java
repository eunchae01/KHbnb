package com.air.cwc;

import java.util.List;

import com.air.jdy.AccDTO;

public interface WishDAO {

	public List<WishDTO> getWishList();
	public int addWish(AccDTO dto);
	public int deleteWish(int acc_code);
	
}
