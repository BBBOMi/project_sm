package com.skhu.sm.mapper;

import java.util.List;

import com.skhu.sm.model.Pagination;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.skhu.sm.dto.Report;

/**
 * Created by ds on 2017-11-27.
 */
@Mapper
public interface ReportMapper {
    List<Report> findByReport(int m_id);
    List<Report> findAll();
    List<Report> findAll2(Pagination pagination);
    List<Report> findByWeeks(int r_weeks);
    List<Report> findByMento(int m_id);
    List<Report> findByYear(@Param("start") int start, @Param("end") int end);
    List<Report> searchReport(String keyWord);
    Report findByRid(int r_id);
    void insert(Report report);
    void updateContents1(Report report);
    void updateContents2(Report report);
    void confirm(Report report);
    void delete(int r_id);
    List<Report> selectByWeeksAndKeyWord(@Param("weeks") int weeks, @Param("keyWord") String keyWord);
    List<Report> selectByYearsAndKeyWord(@Param("start") String start, @Param("end") String end);
    int count(Pagination pagination);
}
