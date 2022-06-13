package com.air.cwc;

import java.util.List;

public interface testDAO {

	public List<testDTO> getEmpList();
	public int addWish(testDTO dto);
	public testDTO getEmp(int acc_code);
}
