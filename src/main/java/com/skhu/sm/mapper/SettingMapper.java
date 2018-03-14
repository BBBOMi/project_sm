package com.skhu.sm.mapper;

import com.skhu.sm.dto.Setting;
import org.apache.ibatis.annotations.Mapper;

/**
 * Created by ds on 2017-12-04.
 */
@Mapper
public interface SettingMapper {
    Setting findAll();
    void update(Setting setting);
}
