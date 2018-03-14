package com.skhu.sm.mapper;

import com.skhu.sm.dto.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ds on 2017-11-22.
 */
@Mapper
public interface BoardMapper {
    List<Board> findByMid(int m_id);
    Board findByBid(int b_id);
    int checkWriter(@Param("id") int id, @Param("b_id") int b_id);
    void insert(Board board);
    void updateContents(Board board);
    void updateContents1(Board board);
    void delete(int b_id);
}
