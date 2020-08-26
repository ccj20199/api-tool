package com.winning.api.apitoolservice.vo.generateparameter;

import lombok.Data;

import java.util.Map;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/26 13:36
 */
@Data
public class GenerateDTO {

    private String className;

    private Map<String, Object> map;
}
