package com.air.kdh;

import java.util.List;

import com.air.common.HostDTO;
import com.air.common.PageDTO;




public interface HostDAO {
	
	public int getListCount();
	public List<HostDTO> getHostList(PageDTO dto);
	
	public int insertHost(HostDTO dto);
	
	
	
	public HostDTO getHost(int num);
	
	public int updateHost(HostDTO dto);
	
	public int deleteHost(int num);
	
	public void updateSequence(int num);
	
	public int searchHostCount(String field, String keyword);
	
	public List<HostDTO> searchHostList(PageDTO dto);

}
