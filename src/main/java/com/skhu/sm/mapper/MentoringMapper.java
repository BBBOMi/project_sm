package com.skhu.sm.mapper;

import com.skhu.sm.dto.Apply;
import com.skhu.sm.dto.Mentee;
import com.skhu.sm.dto.Mentolist;
import com.skhu.sm.dto.Mentoring;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ds on 2017-11-13.
 */
@Mapper
public interface MentoringMapper {
    void insert(Mentoring mentoring);
    List<Mentolist> findByName(String keyWord);
    List<Mentolist> showList();

    Mentolist showApply(@Param("a_id") int a_id);
    Mentolist showCount();

    int showCount(@Param("a_id") int a_id);
    int checkMento(@Param("id") int id, @Param("m_id") int m_id);

    int checkM_id(int a_id);

    List<Apply> findByMentoringList1(int id);
    List<Apply> findByMentoringList2(int id);

    void mentee(@Param("m_id") int m_id, @Param("ID") int ID);
    List<Mentee> checkMentee(@Param("a_id") int a_id, @Param("id") int id);
    int allCount();
    int allCountMentee();
}
