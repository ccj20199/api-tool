package com.winning.api.apitoolservice.vo.history;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * <p>api-tool</p>
 *  根据API标识查询历史版本信息
 * @author cq
 * @Description
 * @date 2020/8/25 16:58
 */
@Data
@ApiModel(value = "SearchHistoryOutVo", description = "根据API标识查询历史版本信息出参")
public class SearchHistoryOutVo {

    @ApiModelProperty(value = "API变更标识",position = 10)
    private Long apiChangeId;

    @ApiModelProperty(value = "API变更缘由",position = 20)
    private String apiChangeReason;

    @ApiModelProperty(value = "API变更时间",position = 30)
    private Date apiChangeAt;

    @ApiModelProperty(value = "API变更人",position = 40)
    private String apiChangeBy;

    @ApiModelProperty(value = "API修改标识",position = 50)
    private Long apiUpdateId;
}
