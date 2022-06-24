package com.air.jdy;

import java.io.File;
import java.io.IOException;
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

import com.air.cwc.WishDTO;

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
		String dbFileName = "";
		String uploadPath = "C:\\Users\\coolb\\OneDrive\\바탕 화면\\t\\AirKH\\src\\main\\webapp\\resources\\upload\\";
		
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String date1 = format1.format(date);
		
		// 업로드 된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			
			// 파일 리스트
			List<MultipartFile> fileList = mRequest.getFiles(uploadFileName);
	        
	        for (MultipartFile mFile : fileList) {
	           
	        	// 업로드한 파일의 이름을 구하는 메서드
	            String originFileName = mFile.getOriginalFilename(); // 원본 파일 명
	                  
	            // 저장할 폴더 만들기
	            String homedir = uploadPath + date1;
	            File path1 = new File(homedir);
	            if(!path1.exists()) { 
	            	path1.mkdirs();
	            }
	            
	            saveFileName = System.currentTimeMillis() + originFileName;
	            System.out.println(saveFileName);
	            
	            
	            dbFileName += saveFileName + ",";
	            System.out.println(dbFileName);
	            
	            try {
	               
	               mFile.transferTo(new File(homedir + "/" +saveFileName));
	               isUpload = true;
	               
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
            }
	        
		}
		if(isUpload) { return dbFileName; }else { return null; }
	}
		
		
		//============================================================
		 
		
		/*
		 * boolean isUpload = false; String saveFileName = null; String uploadPath =
		 * "C:\\Users\\coolb\\OneDrive\\諛뷀깢 �솕硫�\\t\\AirKH\\src\\main\\webapp\\resources\\upload\\"
		 * ;
		 * 
		 * Calendar cal = Calendar.getInstance(); Date date = cal.getTime();
		 * SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd"); String date1 =
		 * format1.format(date);
		 * 
		 * // �뾽濡쒕뱶 �맂 �뙆�씪�뱾�쓽 �씠由� 紐⑸줉�쓣 �젣怨듯븯�뒗 硫붿꽌�뱶. Iterator<String> iterator =
		 * mRequest.getFileNames();
		 * 
		 * while(iterator.hasNext()) { String uploadFileName = iterator.next();
		 * 
		 * MultipartFile mFile = mRequest.getFile(uploadFileName);
		 * 
		 * // �뾽濡쒕뱶�븳 �뙆�씪�쓽 �씠由꾩쓣 援ы븯�뒗 硫붿꽌�뱶. String originalFileName =
		 * mFile.getOriginalFilename();
		 * 
		 * // �떎�젣 �뤃�뜑瑜� 留뚮뱾�뼱 蹂댁옄. // .......\\resources\\upload\\2022-05-30 String
		 * homedir = uploadPath + date1; File path1 = new File(homedir);
		 * 
		 * if(!path1.exists()) { path1.mkdirs(); }
		 * 
		 * // �떎�젣 �뙆�씪�쓣 留뚮뱾�뼱蹂댁옄. saveFileName = originalFileName; if(saveFileName !=
		 * null) { saveFileName = System.currentTimeMillis() + "_" + saveFileName;
		 * 
		 * try { // .......\\resources\\upload\\2022-05-30\\�떎�젣 �뙆�씪 File origin = new
		 * File(homedir + "/" + saveFileName);
		 * 
		 * // transferTo() : �뙆�씪 �뜲�씠�꽣瑜� 吏��젙�븳 �뤃�뜑濡� �떎�젣 ���옣�떆�궎�뒗 硫붿꽌�뱶.
		 * mFile.transferTo(origin);
		 * 
		 * isUpload = true; } catch (Exception e) {
		 * 
		 * } }
		 * 
		 * } // while臾� end if(isUpload) { return saveFileName; }else { return null; }
		 */

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
	@Override
	public WishDTO likeAcc(int no) {
		return this.sqlSession.selectOne("like", no);
	}
	
}
