package com.air.jdy;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
@Repository
public class AccDAOImpl implements AccDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<AccDTO> getAccList() {
		return this.sqlSession.selectList("allAcc");
	}

	@Override
	public int insertAcc(AccDTO dto) {
		return this.sqlSession.insert("addAcc", dto);
	}

	@Override
	public AccDTO getAccCont(int no) {
		return this.sqlSession.selectOne("contAcc", no);
	}

	@Override
	public int updateAcc(AccDTO dto) {
		return this.sqlSession.update("ahup", dto);
	}

	@Override
	public int deleteAcc(int no) {
		return this.sqlSession.delete("ahdel", no);
	}

	@Override
	public List<AccDTO> searchAcc(Map<String, Object> map, String id) {
		
		return this.sqlSession.selectList(id, map);
		
	}

	@Override
	public List<ThemeDTO> getThemeList() {
		return this.sqlSession.selectList("tlist");
	}

	@Override
	public String uploadFile(MultipartHttpServletRequest mRequest) {
		boolean isUpload = false;
		String saveFileName = null;
		String uploadPath = "C:\\Users\\coolb\\OneDrive\\바탕 화면\\t\\AirKH\\src\\main\\webapp\\resources\\upload\\";
		
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String date1 = format1.format(date);
		
		// 업로드 된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originalFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// .......\\resources\\upload\\2022-05-30
			String homedir = uploadPath + date1;
			File path1 = new File(homedir);
			
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			// 실제 파일을 만들어보자.
			saveFileName = originalFileName;
			if(saveFileName != null) {
				saveFileName = System.currentTimeMillis() + "_" + saveFileName;
				
				try {
					// .......\\resources\\upload\\2022-05-30\\실제 파일
					File origin = new File(homedir + "/" + saveFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드. 
					mFile.transferTo(origin);
					
					isUpload = true;
				} catch (Exception e) {
					
				}
			}
			
		} // while문 end
		if(isUpload) {
			return saveFileName;
		}else {
		return null;
		}
		
	}

	@Override
	public List<OfferDTO> getOfferList() {
		return this.sqlSession.selectList("olist");
	}

	@Override
	public List<AccDTO> searchByThemeAcc(int no) {
		return this.sqlSession.selectList("stlist", no);
	}

	@Override
	public List<AccDTO> getAccListForHost(int no) {
		return this.sqlSession.selectList("ahlist", no);
	}
	
}
