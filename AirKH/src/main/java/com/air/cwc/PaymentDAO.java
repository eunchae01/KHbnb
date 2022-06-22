package com.air.cwc;

import java.util.List;

public interface PaymentDAO {

	public List<PaymentDTO> getPayList();
	public int insertPay(PaymentDTO dto);
}
