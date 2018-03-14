package com.skhu.sm.services;

import com.skhu.sm.dto.Setting;
import com.skhu.sm.mapper.SettingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by ds on 2017-12-04.
 */
@Service
public class SettingService {

    @Autowired
    SettingMapper settingMapper;

    //기한 선택
    public Setting selectTerm() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Setting setting = settingMapper.findAll();
        setting.setMento_start_string(sdf.format(setting.getMento_start()));
        setting.setMento_end_string(sdf.format(setting.getMento_end()));
        setting.setMentee_start_string(sdf.format(setting.getMentee_start()));
        setting.setMentee_end_string(sdf.format(setting.getMentee_end()));
        setting.setSurvey_start_string(sdf.format(setting.getSurvey_start()));
        setting.setSurvey_end_string(sdf.format(setting.getSurvey_end()));
        return setting;
    }

    //기한 변경
    public void updateTerm(Setting setting) {
        settingMapper.update(setting);
    }

    //멘토 신청 기간 검사
    public boolean checkMentoRegister() {
        boolean result = true;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Setting setting = settingMapper.findAll();
        setting.setMento_start_string(sdf.format(setting.getMento_start()));
        setting.setMento_end_string(sdf.format(setting.getMento_end()));

        Date day = new Date();
        String today = sdf.format(day);

        //시작 날짜 비교
        int compare1 = setting.getMento_start_string().compareTo(today);
        //끝 날짜 비교
        int compate2 = setting.getMento_end_string().compareTo(today);

        if(compare1 <= 0 && compate2 >= 0 && setting.getMento_type() == 1) {
            result = true;
        }else {
            result = false;
        }

        return  result;
    }
    //멘티 신청 기간 검사
    public boolean checkMenteeRegister() {
        boolean result = true;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Setting setting = settingMapper.findAll();
        setting.setMentee_start_string(sdf.format(setting.getMentee_start()));
        setting.setMentee_end_string(sdf.format(setting.getMentee_end()));

        Date day = new Date();
        String today = sdf.format(day);

        //시작 날짜 비교
        int compare1 = setting.getMentee_start_string().compareTo(today);
        //끝 날짜 비교
        int compate2 = setting.getMentee_end_string().compareTo(today);

        if(compare1 <= 0 && compate2 >= 0 && setting.getMentee_type() == 1) {
            result = true;
        }else {
            result = false;
        }

        return result;
    }
    //설문조사 신청 기간 검사
    public boolean checkSurveyRegister() {
        boolean result = true;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Setting setting = settingMapper.findAll();
        setting.setSurvey_start_string(sdf.format(setting.getSurvey_start()));
        setting.setSurvey_end_string(sdf.format(setting.getSurvey_end()));

        Date day = new Date();
        String today = sdf.format(day);

        //시작 날짜 비교
        int compare1 = setting.getSurvey_start_string().compareTo(today);
        //끝 날짜 비교
        int compate2 = setting.getSurvey_end_string().compareTo(today);

        if(compare1 <= 0 && compate2 >= 0 && setting.getSurvey_type() == 1) {
            result = true;
        }else {
            result = false;
        }

        return result;
    }
}
