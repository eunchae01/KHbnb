package com.air.kdh;

import java.util.List;

import com.air.common.PaymentDTO;
import com.air.common.PageDTO;

public interface PaymentsDAO {
	
	public int getListCount();
	public int getListCount(int no);
	
	public List<PaymentDTO> getPaymentsList(PageDTO dto);
	
	public List<PaymentDTO> getPaymentoList(PageDTO dto);
	
	
	public int insertPayments(PaymentDTO dto);
	
	
	public PaymentDTO paymentCont(int no);
	
	public int updatePayments(PaymentDTO dto);
	
	public int deletePayments(int no);
	
	public void updateSequence(int no);
	
	public int searchPaymentsCount(String field, String keyword);
	
	public List<PaymentDTO> searchPaymentsList(PageDTO dto);

}
