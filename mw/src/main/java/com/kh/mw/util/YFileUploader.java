package com.kh.mw.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class YFileUploader {
	public static String uploadFile(
			String originalFilename,
			byte[] fileData) {
		
		String path = "C:/y_file";
		File Folder = new File(path);
		if(!Folder.exists()) {
			try{
				Folder.mkdir();
				System.out.println("폴더 생성 성공");
			}catch(Exception e) {
				e.getStackTrace();
			}
		}else {
			System.out.println("폴더가 이미 존재합니다.");
		}
		UUID uuid = UUID.randomUUID();
		String saveFilename = path + "/" 
				+ uuid + "_" + originalFilename; 
		System.out.println("saveFilename: " + saveFilename);
		File target = new File(saveFilename);
		try {
			FileCopyUtils.copy(fileData, target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return saveFilename;
	}
}
