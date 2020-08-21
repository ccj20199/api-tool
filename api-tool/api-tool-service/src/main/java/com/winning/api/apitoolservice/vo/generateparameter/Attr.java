package com.winning.api.apitoolservice.vo.generateparameter;

import com.winning.api.apitoolservice.enumpack.DataTypeCode;
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
    public String name;
    public String requiredCode;
    public String dataTypeCode;


    public String getDataTypeCode() {
        DataTypeCode instance = DataTypeCode.getInstance(Long.parseLong(this.dataTypeCode));
        String result;
        switch (instance){
            case DATA_LIST:
            case DATA_STRING:
            case   DATA_LIST_LONG:
                result="1";
                break;
            default:
                result="0";
                break;
        }
        return result;
    }
}
