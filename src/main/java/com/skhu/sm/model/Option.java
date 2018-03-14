package com.skhu.sm.model;

import lombok.Data;

/**
 * Created by ds on 2017-12-17.
 */
@Data
public class Option {
    private int value;
    private String label;

    public Option(int value, String label) {
        this.value = value;
        this.label = label;
    }
}
