package com.skhu.sm.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by ds on 2017-11-12.
 */
@Service
public class FileUploadService {

    @Autowired
    S3Service s3Service;

    public String upload(MultipartFile uploadFile) throws IOException {
        String origName = uploadFile.getOriginalFilename();
        String url;
        try {
            //확장자
            String ext = origName.substring(origName.lastIndexOf('.'));
            //파일이름 암호화
            String saveFileName = getUuid() + ext;
            //파일 객체 생성
            File file = new File(System.getProperty("user.dir") + saveFileName);
            //파일 변환
            uploadFile.transferTo(file);
            //S3 파일 업로드
            s3Service.uploadOnS3(saveFileName, file);
            url = "https://s3.ap-northeast-2.amazonaws.com/project-sm/" + saveFileName;
            //파일 삭제
            file.delete();
        }catch (StringIndexOutOfBoundsException e) {
            //파일이 없을 경우 예외 처리
            url = null;
        }
        return url;
    }

    public File upload2(MultipartFile uploadFile) throws IOException {
        String origName = uploadFile.getOriginalFilename();
        String url;
        try {
            File file = new File(System.getProperty("user.dir") + origName);
            //파일 변환
            uploadFile.transferTo(file);
            return file;
            //파일 삭제
        }catch (StringIndexOutOfBoundsException e) {
            //파일이 없을 경우 예외 처리
            return null;
        }
    }

    public static String getUuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

}
