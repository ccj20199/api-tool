package com.winning.api.apitoolservice.vo.export;

import lombok.Data;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/7/28 15:47
 */
@Data
public class ExportGroupInfo {

    /**
     * 分组id
     */
    private Long groupId;
    /**
     * 分组名称
     */
    private String groupName;
    /**
     * 父分组id
     */
    private Long parentGroupId;
    /**
     * 标题类型
     */
    private Integer titleType;
    /**
     * 标题数字
     */
    private String titleNumber;

    /**
     * api 信息
     */
    private List<CodeRepositoryIdOutVO> codeRepositoryIdOutVOS;

    /**
     * 子级分组列表
     */
    private List<ExportGroupInfo> childGroupList;

}
