package com.air.cwc;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.cec.HostHotelDTO;
@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<PaymentDTO> getPayList(String member_id) {
		return this.sqlSession.selectList("paylist",member_id);
	}
	
	@Override
	public List<PaymentDTO> getPayList_H(String host_name) {
		return this.sqlSession.selectList("Hpaylist",host_name);
	}
	
	@Override
	public List<PaymentDTO> getPayList_out(String host_name) {
		return this.sqlSession.selectList("out_list",host_name);
	}
	
	@Override
	public List<PaymentDTO> getPayList_in(String host_name) {
		return this.sqlSession.selectList("in_list",host_name);
	}
	
	@Override
	public List<PaymentDTO> getPayList_pre(String host_name) {
		return this.sqlSession.selectList("pre_list",host_name);
	}
	
	@Override
	public List<PaymentDTO> getPayList_approve(String host_name) {
		return this.sqlSession.selectList("approve_list",host_name);
	}
	
	@Override
	public int insertPay(PaymentDTO dto) {
		return this.sqlSession.insert("addpayment", dto);
	}
	
	@Override
	public HostHotelDTO getHost(int acc_host) {
		return this.sqlSession.selectOne("acc_host",acc_host);
	}
	@Override
	public int del_cart(int cart_num) {
		return this.sqlSession.delete("del_cart",cart_num);
	}
	
	@Override
	public PaymentDTO cartCont(int cart_num) {
		return this.sqlSession.selectOne("cart_cont", cart_num);
	}
	
	@Override
	public int update_cart(PaymentDTO dto) {
		return this.sqlSession.update("modify", dto);
}
	@Override
	public int approve_guest(int cart_num) {
		return this.sqlSession.update("approve",cart_num);
	}
}
