package com.skhu.sm.domain;

import com.skhu.sm.dto.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;
import org.springframework.data.redis.core.index.Indexed;

import java.io.Serializable;

/**
 * Created by ds on 2018-03-13.
 */

@Data
@RedisHash("smLogin")
@AllArgsConstructor
@NoArgsConstructor
public class Login implements Serializable{

    @Id
    private @Indexed int ID;

    private int u_id;
    private String name;
    private String type;

    public Login(final User user) {
        this.ID = user.getID();
        this.u_id = user.getU_id();
        this.name = user.getU_name();
    }
}
