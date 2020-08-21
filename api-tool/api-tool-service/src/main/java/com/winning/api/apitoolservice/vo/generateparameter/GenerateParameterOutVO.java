package com.winning.api.apitoolservice.vo.generateparameter;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description 自动生成入参和出参的dto
 * @date 2020/8/20 16:29
 */
@Data
@ApiModel(value = "GenerateParameterOutVO",description = "自动生成入参和出参的dto")
public class GenerateParameterOutVO {

    @ApiModelProperty(value = "className",position = 10)
    private String className;


    @ApiModelProperty(value = "参数类型代码",position = 10)
    private String content;
}
