package com.skhu.sm.services;

import com.skhu.sm.dto.*;
import com.skhu.sm.mapper.ApplyMapper;
import com.skhu.sm.mapper.MentoringMapper;
import com.skhu.sm.mapper.SurveyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.ManagedList;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ds on 2017-12-02.
 */
@Service
public class SurveyService {

    @Autowired
    SurveyMapper surveyMapper;

    @Autowired
    ApplyMapper applyMapper;

    @Autowired
    MentoringMapper mentoringMapper;

    //멘토 설문조사 리스트
    public List<Apply> SurveyList1(int id) {
        List<Apply> applyList =  applyMapper.findAllMentoringSurvey(id);
        for(int i = 0; i < applyList.size(); i++) {
            if(surveyMapper.checkMentoSurvey(applyList.get(i).getM_id(), id) == 0) {
                applyList.get(i).setCheck(true);
            }else {
                applyList.get(i).setCheck(false);
            }
        }
        return applyList;
    }

    //멘티 설문조사 리스트
    public List<Apply> SurveyList2(int id) {
        List<Apply> applyList = applyMapper.findAllMenteeSurvey(id);
        for(int i = 0; i < applyList.size(); i++) {
            if(surveyMapper.checkMenteeSurvey(applyList.get(i).getM_id(), id) == 0) {
                applyList.get(i).setCheck(true);
            }else {
                applyList.get(i).setCheck(false);
            }
        }
        return applyList;
    }

    //멘토 설문조사
    public void mentoSurvey(List<MentoSurveyResult> mentoSurveyResults, int m_id, int id) {
        int size = mentoSurveyResults.size();
        for(int i = 0; i < size; i++) {
            mentoSurveyResults.get(i).setID(id);
            mentoSurveyResults.get(i).setM_id(m_id);
            surveyMapper.insertMentoSurvey(mentoSurveyResults.get(i));
        }
    }

    //멘티 설문조사
    public void menteeSurvey(List<MenteeSurveyResult> menteeSurveyResults, int m_id, int id) {
        int size = menteeSurveyResults.size();
        for(int i = 0; i < size; i++) {
            menteeSurveyResults.get(i).setID(id);
            menteeSurveyResults.get(i).setM_id(m_id);
            surveyMapper.insertMenteeSurvey(menteeSurveyResults.get(i));
        }
    }

    //멘토 설문조사 항목
    public List<MentoSurvey> mentoSurveyList() {
        return surveyMapper.findAllMentoSurvey();
    }

    //멘토 설문조사 항목 변경
    public void mentoSurveyListChange(List<MentoSurvey> mentoSurveys, String[] s1_title) {
        int size2 = s1_title.length;
        int size1 = mentoSurveys.size();
        int i;
        for(i = 0; i < size1; i++) {
            surveyMapper.updateMentoSurveyIndex(mentoSurveys.get(i));
        }
        for(i = 1; i < size2; i++) {
            MentoSurvey mentoSurvey = new MentoSurvey();
            mentoSurvey.setS1_id(size1+i);
            mentoSurvey.setS1_title(s1_title[i].toString());
            surveyMapper.insertMentoSurveyIndex(mentoSurvey);
        }
    }


    //멘티 설문조사 항목
    public List<MenteeSurvey> menteeSurveyList() {
        return surveyMapper.findAllMenteeSurvey();
    }

    //멘티 설문조사 항목 변경
    public void menteeSurveyListChange(List<MenteeSurvey> menteeSurveys, String[] s2_title) {
        int size2 = s2_title.length;
        int size1 = menteeSurveys.size();
        int i;
        for(i = 0; i < size1; i++) {
            surveyMapper.updateMenteeSurveyIndex(menteeSurveys.get(i));
        }
        for(i = 1; i < size2; i++) {
            MenteeSurvey menteeSurvey = new MenteeSurvey();
            menteeSurvey.setS2_id(size1+i);
            menteeSurvey.setS2_title(s2_title[i].toString());
            surveyMapper.insertMenteeSurveyIndex(menteeSurvey);
        }
    }

    //멘토 설문조사 결과
    public List<MentoSurveyResult> mentoSurveyResult() {
        List<MentoSurveyResult> mentoSurveyResult = surveyMapper.findAllMentoSurveyResult();
        return mentoSurveyResult;
    }

    //멘티 설문조사 결과
    public List<MenteeSurveyResult> menteeSurveyResult() {
        List<MenteeSurveyResult> menteeSurveyResult = surveyMapper.findAllMenteeSurveyResult();
        return menteeSurveyResult;
    }

    //멘토 설문조사 한 사람
    public double mentoSurveyPercent() {
        int count = surveyMapper.countMentoSurvey();
        double all = mentoringMapper.allCount();
        return (count/all*100);
    }
    //멘티 설문조사 한 사람
    public double menteeSurveyPercent() {
        int count = surveyMapper.countMenteeSurvey();
        double all = mentoringMapper.allCountMentee();
        return (count/all*100);
    }
}
