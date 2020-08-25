package com.winning.api.apitoolservice.vo.history;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * <p>api-tool</p>
 *  根据API标识查询历史版本信息
 * @author cq
 * @Description
 * @date 2020/8/25 16:58
 */
@Data
@ApiModel(value = "SearchHistoryInputVo", description = "根据API标识查询历史版本信息入参")
public class SearchHistoryInputVo {

    @NotNull(message = "API标识不为空")
    @ApiModelProperty(value = "API标识",position = 10)
    private Long ApiId;
}
