package com.skhu.sm.services;

import com.skhu.sm.dto.Report;
import com.skhu.sm.dto.User;
import com.skhu.sm.mapper.ReportMapper;
import com.skhu.sm.mapper.UserMapper;
import com.skhu.sm.model.Pagination;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by ds on 2017-11-27.
 */
@Service
public class ReportService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    ReportMapper reportMapper;

    public User findMentoUser(int id) {
        return userMapper.findByMentoUserId(id);
    }

    public List<User> findMenteeUserList(int m_id) {
        return userMapper.findByMenteeId(m_id);
    }

    public List<User> findMenteeList(int m_id) {
        return userMapper.findMenteeList(m_id);
    }

    public List<User> findMenteeListRid(int r_id) {
        return userMapper.findByMenteeRid(r_id);
    }

    public List<Report> findAll() {
        return reportMapper.findAll();
    }

    public List<Report> findAll2(Pagination pagination) {
        int count = reportMapper.count(pagination);
        pagination.setRecordCount(count);
        return reportMapper.findAll2(pagination);
    }

    public List<Report> findByWeeks(int r_weeks) {
        return reportMapper.findByWeeks(r_weeks);
    }

    public List<Report> finByMento(int m_id) {
        return reportMapper.findByMento(m_id);
    }

    public List<Report> findByYear(Date year) {
        System.out.println(year);
        //return reportMapper.findByYear(year, );
        return null;
    }

    public boolean reportConfirm(String button, Report report, int r_id) {
        if(button.equals("ok")) {
            report.setR_type(1);
            reportMapper.confirm(report);
            return true;
        }else if(button.equals("no")){
            report.setR_type(2);
            reportMapper.confirm(report);
            return true;
        }else {
            return false;
        }
    }

    public String endDay(String start) {
        String end = null;
        switch (start) {
            case "2018-07-01" :
            {
                end = "2019-01-01";
                break;
            }
            case "2018-01-01" :
            {
                end = "2018-07-01";
                break;
            }
            case "2017-07-01" :
            {
                end = "2018-01-01";
                break;
            }
        }
        return end;
    }
}
