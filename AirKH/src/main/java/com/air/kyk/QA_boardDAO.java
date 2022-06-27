package com.air.kyk;

import java.util.List;

public interface QA_boardDAO {
	
	public int QA_insert(QA_boardDTO dto);
	public int QA_delete(int no);
	public int QA_update(int no);
	public List<QA_boardDTO> getQaList();

}
