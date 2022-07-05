package com.air.cwc;

import java.util.List;

import com.air.cec.HostHotelDTO;

public interface PaymentDAO {

	public List<PaymentDTO> getPayList(String member_id);
	public List<PaymentDTO> getPayList_H(String host_name);
	public List<PaymentDTO> getPayList_out(String host_name);
	public List<PaymentDTO> getPayList_in(String host_name);
	public List<PaymentDTO> getPayList_pre(String host_name);
	public List<PaymentDTO> getPayList_approve(String host_name);
	public int insertPay(PaymentDTO dto);
	public HostHotelDTO getHost(int acc_host);
	public int del_cart(int cart_num);
	public PaymentDTO cartCont(int cart_num);
	public int update_cart(PaymentDTO dto);
	public int approve_guest(int cart_num);
}
