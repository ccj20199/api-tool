package com.winning.api.apitoolcommon;

import lombok.Data;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/20 10:22
 */
@Data
public class Attr {
    public String field;
    public String type;
    public Attr(String field,  String type){
        this.field = field;
        this.type = type;
    }
}
