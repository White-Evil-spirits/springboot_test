package com.zys.sys.common;

import com.zys.sys.domain.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ActiverUser {
    private User user;
    private List<String> roles;
    private List<String> permissions;
}
