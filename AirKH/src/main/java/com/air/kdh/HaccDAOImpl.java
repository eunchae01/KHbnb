package com.air.kdh;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.air.common.HaccDTO;


@Repository
public class HaccDAOImpl implements HaccDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<HaccDTO> getHaccList() {
		return this.sqlSession.selectList("halist");
	}

	@Override
	public int insertHacc(HaccDTO dto) {
		return this.sqlSession.insert("hainsert",dto);
	}

	@Override
	public HaccDTO getHacc(int num) {
		return this.sqlSession.selectOne("hacontent",num);
	}

	@Override
	public int updateHacc(HaccDTO dto) {
		return this.sqlSession.update("hamodify",dto);
	}

	@Override
	public int deleteHacc(int num) {
		return this.sqlSession.delete("hadelete",num);
	}

	@Override
	public void updateSequence(int num) {
		this.sqlSession.update("haseq",num);
		
	}

	@Override
	public String uploadFile(MultipartHttpServletRequest mRequest) {
		boolean isUpload = false;
		String saveFileName = null;
		String dbFileName = "";
		String uploadPath = "C:\\workspace(spring)\\kdh\\AirKH\\src\\main\\webapp\\resources\\upload\\";
		
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
		
		if(dbFileName.length() < 15) {
			isUpload = false;
			System.out.println(isUpload);
		}
		
		if(isUpload) { return dbFileName; }else { return null; }
	}

	@Override
	public void updateAccDate(int no) {
		this.sqlSession.update("date_update", no);
		
	}

	
	

}
