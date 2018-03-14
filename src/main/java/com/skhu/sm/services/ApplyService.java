package com.skhu.sm.services;

import com.skhu.sm.dto.Mentoring;
import com.skhu.sm.dto.User;
import com.skhu.sm.mapper.ApplyMapper;
import com.skhu.sm.mapper.MentoringMapper;
import com.skhu.sm.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ds on 2017-11-13.
 */
@Service
public class ApplyService {

    @Autowired
    ApplyMapper applyMapper;

    @Autowired
    MentoringMapper mentoringMapper;

    @Autowired
    UserMapper userMapper;

    //확인, 반려
    public void applyConfirm(int type, int a_id, int id) {
        applyMapper.update(type, a_id);
        if(type == 1) {
            makeMentoring(a_id, id);
        }
    }

    //멘토방 만들어주기
    private int makeMentoring(int a_id, int id) {
        Mentoring mentoring = new Mentoring();
        mentoring.setID(id);
        mentoring.setA_id(a_id);
        mentoringMapper.insert(mentoring);
        return mentoring.getM_id();
    }

    //회원 소속 멘토링 설정
    private void userSetMentoring(int m_id, int id) {
        User user = new User();
        user.setID(id);
        user.setM_id(m_id);
        userMapper.updateMentoringId(user);
    }
}
