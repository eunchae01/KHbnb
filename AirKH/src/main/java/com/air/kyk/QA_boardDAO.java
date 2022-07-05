package com.air.kyk;

import java.util.List;

public interface QA_boardDAO {
	
	public int QA_insert(QA_boardDTO dto);	
	public QA_boardDTO getQaCont(int qa_num);
	public int QA_delete(int qa_num);
	public int QA_update(QA_boardDTO dto);
	public List<QA_boardDTO> getQaList(String qa_id);
	

}
