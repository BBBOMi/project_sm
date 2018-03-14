package com.skhu.sm.mapper;

import java.util.ArrayList;
import java.util.List;

import com.skhu.sm.dto.Mentolist;
import org.apache.ibatis.annotations.Mapper;

import com.skhu.sm.dto.Apply;
import org.apache.ibatis.annotations.Param;

/**
 * Created by ds on 2017-11-06.
 */
@Mapper
public interface ApplyMapper {
    Apply findOne(int a_id);
    ArrayList<Apply> findById(int id);
    List<Apply> findAll();
    List<Mentolist> findList();
    List<Apply> findAllMentoring();
    List<Apply> findAllMentoringSurvey(int id);
    List<Apply> findAllMenteeSurvey(int id);
    void insert(Apply apply);
    void update(@Param("a_type") int a_type, @Param("a_id") int a_id);
    void updateContents(Apply apply);
    void delete(int a_id);
}
