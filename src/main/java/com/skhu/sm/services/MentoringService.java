package com.skhu.sm.services;

import com.skhu.sm.dto.Apply;
import com.skhu.sm.dto.Board;
import com.skhu.sm.dto.Mentoring;
import com.skhu.sm.dto.Report;
import com.skhu.sm.mapper.ApplyMapper;
import com.skhu.sm.mapper.BoardMapper;
import com.skhu.sm.mapper.MentoringMapper;
import com.skhu.sm.mapper.ReportMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ds on 2017-11-27.
 */
@Service
public class MentoringService {
    @Autowired
    MentoringMapper mentoringMapper;

    @Autowired
    BoardMapper boardMapper;

    @Autowired
    ReportMapper reportMapper;

    @Autowired
    ApplyMapper applyMapper;

    //내 멘토링 목록 확인
    public List<Apply> mentoringList(int id) {
        List<Apply> list = mentoringMapper.findByMentoringList1(id);
        list.addAll(mentoringMapper.findByMentoringList2(id));
        return list;
    }

    //사용자가 그 방의 멘토인지 확인
    public boolean checkMento(int id, int m_id) {
        if(mentoringMapper.checkMento(id, m_id) == 1) {
            return true;
        }
        return false;
    }

    //사용자가 그 글의 작성자인지 확인
    public boolean isMine(int id, int b_id) {
        if(boardMapper.checkWriter(id, b_id) == 1) {
            return true;
        }
        return false;
    }

    //멘토방 접속
    //게시판 리턴
    public List<Board> boardList(int m_id) {
        return boardMapper.findByMid(m_id);
    }

    //보고서 리턴
    public List<Report> reportsList(int m_id) {
        return reportMapper.findByReport(m_id);
    }

    public List<Apply> MentoringList() {
        return applyMapper.findAllMentoring();
    }

    //멘토링 신청했는지 확인
    public boolean check(int a_id, int id) {
        boolean result = true;

        //그 방의 주인이면 false
        if(applyMapper.findById(id).size() == 1) {
            result = false;
        }
        //그방을 이미 신청했으면 false
        if(mentoringMapper.checkMentee(a_id, id).size() == 1 ) {
            result = false;
        }
        return result;
    }

}
