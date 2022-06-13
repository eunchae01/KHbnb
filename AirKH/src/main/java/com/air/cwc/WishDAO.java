package com.air.cwc;

import java.util.List;

public interface WishDAO {

	public List<WishDTO> getWishList();
	public int addWish(WishDTO dto);
	public int deleteWish(int acc_code);
	
}
