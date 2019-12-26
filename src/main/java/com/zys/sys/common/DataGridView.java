package com.zys.sys.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/*
json实体返回

 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DataGridView {
    private Integer code = 0;
    private String msg = "";
    private Long count = 0L;
    private Object data;

    public DataGridView(Integer code, Object data) {
        this.code = code;
        this.data = data;
    }

    public DataGridView(Object data) {
        this.data = data;
    }
}
