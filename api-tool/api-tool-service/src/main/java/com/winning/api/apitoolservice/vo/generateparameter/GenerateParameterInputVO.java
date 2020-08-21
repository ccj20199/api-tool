package com.winning.api.apitoolservice.vo.generateparameter;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/20 16:29
 */
@Data
@ApiModel(value = "GenerateParameterInputVO",description = "自动生成入参和出参的dto")
public class GenerateParameterInputVO {

    @NotNull(message = "apiId不为空")
    @ApiModelProperty(value = "API标识",position = 10)
    private Long apiId;

    @NotNull(message = "参数类型代码不为空")
    @ApiModelProperty(value = "参数类型代码",position = 10)
    private Long parameterTypeCode;
}
