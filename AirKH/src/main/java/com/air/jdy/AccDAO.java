package com.air.jdy;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.air.cwc.WishDTO;

public interface AccDAO {
	
	List<AccDTO> getAccList();
	List<AccDTO> getAccListForHost(int no);
	int insertAcc(AccDTO dto);
	AccDTO getAccCont(int no);
	int updateAcc(AccDTO dto);
	int deleteAcc(int no);
	List<AccDTO> searchAcc(Map<String, Object> map, String id);
	List<AccDTO> searchByThemeAcc(int no);
	List<ThemeDTO> getThemeList();
	List<OfferDTO> getOfferList();
	String uploadFile(MultipartHttpServletRequest mRequest);
	WishDTO likeAcc(int no);
}
