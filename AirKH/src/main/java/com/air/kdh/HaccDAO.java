package com.air.kdh;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.air.common.HaccDTO;
import com.air.common.PageDTO;

public interface HaccDAO {

	

	public List<HaccDTO> getHaccList();
	
	public int insertHacc(HaccDTO dto);
	
	String uploadFile(MultipartHttpServletRequest mRequest);
	
	public HaccDTO getHacc(int num);
	
	public int updateHacc(HaccDTO dto);
	
	public int deleteHacc(int num);
	
	public void updateSequence(int num);
	
	void updateAccDate(int no);
	
	
	
}
