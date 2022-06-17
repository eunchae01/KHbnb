package com.air.common;

import lombok.Data;

@Data
public class ReviewDTO {
	private int review_num;
	private int acc_code;
	private String member_id;
	private int review_cl;
	private int review_comm;
	private int review_check;
	private int review_acc;
	private int review_loc;
	private int review_sat;
	private String review_date;
	private int review_grade;
	private String review_content;

}
