package com.air.jdy;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface AccDAO {
	
	List<AccDTO> getAccList();
	List<AccDTO> getAccListForHost(int no);
	int insertAcc(AccDTO dto);
	AccDTO getAccCont(int no);
	int updateAcc(AccDTO dto);
	int deleteAcc(int no);
	void updateSeqAcc(int no);
	List<AccDTO> searchAcc(String field, String keyword);
	List<AccDTO> searchByThemeAcc(int no);
	List<ThemeDTO> getThemeList();
	List<OfferDTO> getOfferList();
	String uploadFile(MultipartHttpServletRequest mRequest);
	
}
