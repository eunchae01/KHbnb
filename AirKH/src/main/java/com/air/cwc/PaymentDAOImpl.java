package com.air.cwc;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<PaymentDTO> getPayList() {
		return this.sqlSession.selectList("paylist");
	}
	
	@Override
	public int insertPay(PaymentDTO dto) {
		return this.sqlSession.insert("addpayment", dto);
	}
}
