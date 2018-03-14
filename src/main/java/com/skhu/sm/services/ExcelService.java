package com.skhu.sm.services;

import com.skhu.sm.dto.User;
import com.skhu.sm.mapper.UserMapper;
import com.skhu.sm.utils.ExcelRead;
import com.skhu.sm.utils.ExcelReadOption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by ds on 2017-11-12.
 */

@Service
public class ExcelService {

    @Autowired
    UserMapper userMapper;

    public List<User> excelUpload(MultipartFile excel) throws IOException {

        File file = new File(System.getProperty("user.dir") + "/" +  excel.getOriginalFilename());
        excel.transferTo(file);

        ExcelReadOption excelReadOption = new ExcelReadOption();
        excelReadOption.setFilePath(file.getAbsolutePath());
        excelReadOption.setStartRow(2);
        excelReadOption.setOutputColumns("A","B","C","D","E","F","G","H","I");

        List<Map<String, String>> excelContent = ExcelRead.read(excelReadOption, 9);
        List<User> users = new ArrayList<User>();

        for(Map<String, String> content: excelContent){
            User user = new User();
            //학번
            user.setU_id(Integer.parseInt(content.get("A")));
            //이름
            user.setU_name(content.get("B"));
            //전화번호
            user.setU_tel(content.get("C"));
            //이메일
            user.setU_email(content.get("D"));
            //전공
            user.setD_id1(department(content.get("E")));
            //복수전공
            user.setD_id2(department(content.get("F")));
            //부전공
            user.setD_id3(department(content.get("G")));
            //학년
            user.setU_grade(grade(content.get("H")));
            //권한
            user.setU_type(type(content.get("I")));
            //초기 비밀번호
            user.setU_password("s"+user.getU_id());
            //db 삽입, 유니크 에러 처리
            try {
                userMapper.insert(user);
            }catch (Exception e) {
                user = null;
            }
            if(user != null) {
                users.add(user);
            }
        }
        file.delete();
        return users;
    }

    private int department(String d_name) {
        int d_id = 0;
        switch (d_name) {
            case "신학과" : d_id = 1; break;
            case "영어학과" : d_id = 2; break;
            case "일어일본학과" : d_id = 3; break;
            case "중어중국학과" : d_id = 4; break;
            case "사회복지학과" : d_id = 5; break;
            case "사회과학부" : d_id = 6; break;
            case "신문방속학과" : d_id = 7; break;
            case "경영학부" : d_id = 8; break;
            case "디지털컨텐츠공학과" : d_id = 9; break;
            case "컴퓨터공학과" : d_id = 10; break;
            case "소프트웨어공학과" : d_id = 11; break;
            case "정보통신공학과" : d_id = 12; break;
            case "글로컬IT학과" : d_id = 13; break;
        }
        return d_id;
    }

    private int type(String type) {
        int u_type = 0;
        switch (type) {
            case "학생" : u_type = 1; break;
            case "교수" : u_type = 2; break;
            case "직원" : u_type = 3; break;
            case "관리자" : u_type = 4; break;
        }
        return u_type;
    }

    private int grade(String grade) {
        int u_grade = 0;
        switch (grade) {
            case "1학년" : u_grade = 1; break;
            case "2학년" : u_grade = 2; break;
            case "3학년" : u_grade = 3; break;
            case "4학년" : u_grade = 4; break;
        }
        return u_grade;
    }
}
