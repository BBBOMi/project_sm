package com.skhu.sm.mapper;

import com.skhu.sm.dto.About;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by ds on 2017-12-03.
 */
@Mapper
public interface AboutMapper {
    List<About> findAll();
    void insert(About about);
    void update(About about);
}
