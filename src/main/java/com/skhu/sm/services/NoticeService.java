package com.skhu.sm.services;

import com.skhu.sm.dto.Notice;
import com.skhu.sm.mapper.NoticeMapper;
import com.skhu.sm.model.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ds on 2017-11-13.
 */

@Service
public class NoticeService {

    @Autowired
    NoticeMapper noticeMapper;

    public List<Notice> findAll(Pagination pagination) {
        int count = noticeMapper.count(pagination);
        pagination.setRecordCount(count);
        return noticeMapper.findAll2(pagination);
    }
}
