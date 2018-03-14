package com.skhu.sm.mapper;

import com.skhu.sm.dto.Notice;
import com.skhu.sm.model.Option;
import com.skhu.sm.model.Pagination;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by ds on 2017-11-07.
 */
@Mapper
public interface NoticeMapper {
    List<Notice> findAll();
    List<Notice> findAll2(Pagination pagination);
    int count(Pagination pagination);
    Notice findById(int n_id);
    void insert(Notice notice);
    void update(Notice notice);
    void delete(int n_id);
}
