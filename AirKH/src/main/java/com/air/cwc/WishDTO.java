package com.air.cwc;

import lombok.Data;

@Data
public class WishDTO {

	private int wish_num;
	private int acc_code;
	private String acc_thumbnail;
	private String acc_addr;
	private String acc_name;
	private int acc_price;
	private int acc_maxp;
	private int acc_bedroom;
	private int acc_bed;
	private int acc_bath;
	private int acc_star;
}
