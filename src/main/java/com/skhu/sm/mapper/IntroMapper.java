package com.skhu.sm.mapper;

import com.skhu.sm.dto.Intro;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by ds on 2017-12-03.
 */
@Mapper
public interface IntroMapper {
    List<Intro> findAll();
    void insert(Intro intro);
    void update(Intro intro);
}
