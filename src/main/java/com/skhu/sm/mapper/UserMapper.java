package com.skhu.sm.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.skhu.sm.dto.User;

import java.util.List;

/**
 * Created by ds on 2017-10-27.
 */
@Mapper
public interface UserMapper {
	User findByUid(String u_id);
	User findByMentoUserId(int id);
    List<User> findAll();
    User findById(int id);
    List<User> findByName(String u_name);
    List<User> findByMentoName(String u_name);
    List<User> findByMenteeName(String u_name);
    List<User> findByMenteeId(int m_id);
    List<User> findMenteeList(int m_id);
    List<User> findByMenteeRid(int r_id);
    void insert(User user);
    void delete(int id);
    void update1(User user);
    void update2(User user);
    void updatePassword(User user);
    void updateMentoringId(User user);
}
