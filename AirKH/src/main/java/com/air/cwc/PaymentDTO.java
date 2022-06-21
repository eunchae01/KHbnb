package com.air.cwc;

import lombok.Data;

@Data
public class PaymentDTO {

	private int cart_num;
	private int acc_code;
	private String acc_name;
	private int acc_price;
	private String acc_image1;
	private String acc_addr;
	private int	acc_star;
	private String check_in;
	private String check_out;
	private int check_person;
	private String member_name;
	private String member_phone;
	private String member_addr;
	private String host_name;
	private String host_phone;
	private String payment_info;
	private String cart_date;
	
}