package com.toojaatte.util.file;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

public class FileUtil {

	public static File removeDuplicateFileName(final String realPath, final String fileName) throws Exception {
		int cnt = 0;
		File saveFile = new File(realPath, fileName);
		int seperatePos = fileName.lastIndexOf(".");
		String name = fileName.substring(0, seperatePos);
		String ext = fileName.substring(seperatePos);
		System.out.println("name : " + name + ", ext : " + ext);
		while(saveFile.exists()) {
			// 중복된 파일이 있는 경우 처리
			saveFile = new File(realPath, name + (++cnt) + ext);
		}
		return saveFile;
	}
	
	public static void deleteFile(String fileName) throws Exception{
		File deleteFile = new File(fileName);
		if(!deleteFile.exists())
			throw new Exception("삭제하려는 파일이 존재하지 않습니다.");
		deleteFile.delete();
		System.out.println("FileUtil.deleteFile().fileName:"+fileName);
		System.out.println("파일이 성공적으로 삭제되었습니다.");
	}
	

	public static String realPath(HttpServletRequest request, String url) 
	throws Exception{
		if(url == null) throw new Exception("삭제할 파일이 선택되지 않았습니다.");
		return request.getServletContext().getRealPath(url);
	}
	
}
