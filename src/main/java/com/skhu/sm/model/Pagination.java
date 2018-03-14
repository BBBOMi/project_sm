package com.skhu.sm.model;

import lombok.Data;

/**
 * Created by ds on 2017-12-17.
 */
@Data
public class Pagination {

    private int pg = 1; // 현재 페이지
    private int sz = 15; // 페이지 당 레코드 수

    private int recordCount;

    public String getQueryString() {
        String url = String.format("pg=%d&sz=%d", pg, sz);
        return url;
    }
}
