package com.winning.api.apitoolservice.vo.apiinfo.hangup;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * <p>api-tool</p>
 * 新建挂起api信息
 * @author cq
 * @Description
 * @date 2020/7/29 10:11
 */
@Data
@ApiModel(value = "NewHangUpOutVO", description = "新建挂起api信息出参")
public class NewHangUpOutVO {

    @ApiModelProperty(value = "API修改标识",required = true,position = 10)
    private Long apiUpdateId;

    @ApiModelProperty(value = "API编号",required = true,position = 20)
    private String apiNo;
}
