package com.air.cwc;

import lombok.Data;

@Data
public class PaymentDTO {

	private int cart_num;
	private int acc_code;
	private String acc_name;
	private int acc_price;
	private String acc_thumbnail;
	private String acc_addr;
	private String check_in;
	private String check_out;
	private int check_person;
	private String member_name;
	private String member_phone;
	private String member_addr;
	private String host_name;
	private String host_phone;
	private String reserve_info;
	private String card_num;
	private String exprie;
	private String cvv;
	private String zip_code;
	private String country;
	private String cart_date;	
}
