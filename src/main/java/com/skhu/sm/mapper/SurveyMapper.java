package com.skhu.sm.mapper;

import com.skhu.sm.dto.MenteeSurvey;
import com.skhu.sm.dto.MenteeSurveyResult;
import com.skhu.sm.dto.MentoSurvey;
import com.skhu.sm.dto.MentoSurveyResult;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ds on 2017-12-02.
 */
@Mapper
public interface SurveyMapper {
    //멘토 설문조사 항목 조회
    List<MentoSurvey> findAllMentoSurvey();
    //멘티 설문조사 항목 조회
    List<MenteeSurvey> findAllMenteeSurvey();
    //멘토 설문조사 결과 조회
    List<MentoSurveyResult> findAllMentoSurveyResult();
    //멘티 설문조사 결과 조회
    List<MenteeSurveyResult> findAllMenteeSurveyResult();
    //멘티 설문조사 항목 추가
    void insertMenteeSurveyIndex(MenteeSurvey menteeSurvey);
    //멘토 설문조사 항목 추가
    void insertMentoSurveyIndex (MentoSurvey mentorSurvey);
    //멘토 설문조사 항목 수정
    void updateMentoSurveyIndex(MentoSurvey mentorSurvey);
    //멘티 설문조사 항목 수정
    void updateMenteeSurveyIndex(MenteeSurvey menteeSurvey);
    //멘토 설문조사 항목 삭제
    void deleteMentoSurveyIndex(int s1_id);
    //멘티 설문조사 항목 삭제
    void deleteMenteeSurveyIndex(int s2_id);
    //멘토 설문조사
    void insertMentoSurvey(MentoSurveyResult mentorSurveyResult);
    //멘티 설문조사
    void insertMenteeSurvey(MenteeSurveyResult menteeSurveyResult);
    //멘토 설문조사 여부
    int checkMentoSurvey(@Param("m_id") int m_id, @Param("id") int id);
    //멘티 설문조사 여부
    int checkMenteeSurvey(@Param("m_id") int m_id, @Param("id") int id);
    //멘토 설문조사 한 사람
    int countMentoSurvey();
    //멘티 설문조사 한 사람
    int countMenteeSurvey();
}
