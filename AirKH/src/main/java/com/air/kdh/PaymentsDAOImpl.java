package com.air.kdh;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.air.common.PageDTO;
import com.air.common.PaymentDTO;

@Repository
public class PaymentsDAOImpl implements PaymentsDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return this.sqlSession.selectOne("pacount");
	}

	@Override
	public List<PaymentDTO> getPaymentsList(PageDTO dto) {
		return this.sqlSession.selectList("palist", dto);
	}

	@Override
	public int insertPayments(PaymentDTO dto) {
		return this.sqlSession.insert("painsert",dto);
	}

	@Override
	public PaymentDTO paymentCont(int no) {
		return this.sqlSession.selectOne("pacont",no);
	}

	@Override
	public int updatePayments(PaymentDTO dto) {
		return this.sqlSession.update("pamodify", dto);
	}

	@Override
	public int deletePayments(int no) {
		return this.sqlSession.delete("padelete", no);
	}

	@Override
	public void updateSequence(int no) {
		this.sqlSession.update("paseq",no);
		
	}

	@Override
	public int searchPaymentsCount(String field, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PaymentDTO> searchPaymentsList(PageDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getListCount(int no) {
		return sqlSession.selectOne("ptcount", no);
	}

	@Override
	public List<PaymentDTO> getPaymentoList(PageDTO dto) {
		return this.sqlSession.selectList("patlist", dto);
	}
	
	

}
