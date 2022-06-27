package com.air.kdh;

import java.util.List;

import com.air.common.HaccDTO;
import com.air.common.PageDTO;

public interface HaccDAO {

	

	public List<HaccDTO> getHaccList();
	
	public int insertHacc(HaccDTO dto);
	
	
	
	public HaccDTO getHacc(int num);
	
	public int updateHacc(HaccDTO dto);
	
	public int deleteHacc(int num);
	
	public void updateSequence(int num);
	
	
	
}
