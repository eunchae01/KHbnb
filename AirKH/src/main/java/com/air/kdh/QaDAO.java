package com.air.kdh;

import java.util.List;

import com.air.common.PageDTO;
import com.air.common.QaDTO;


public interface QaDAO {
	
	public int getListCont();
	
	public List<QaDTO> getQaList(PageDTO dto);
	
	public int insertQa(QaDTO dto);
	
	public void insertSt(QaDTO dto);
	public int insertRe(QaDTO dto);
	
	public QaDTO QaCont(int no);
	
	public int updateQa(QaDTO dto);
	
	public int deleteQa(int no);
	
	public void updateSequence(int no);
	

	

}
