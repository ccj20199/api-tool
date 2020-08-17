package com.winning.api.apitoolservice.vo.export;

import lombok.Data;

import java.util.List;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/4 11:05
 */
@Data
public class CodeRepositoryIdOutVO {


    private Long apiId;

    private String apiNo;

    private String apiName;

    private String apiUrl;

    private Long apiStatusCode;

    private Long requestMethodCode;

    private String apiDescription;

    private String businessRule;

    private Long AllowPageCode;

    private String allowPage;

    private String requestMethodCodeName;
    private Long groupId;
    private String titleNumber;
    private Integer titleType;


    /**
     * 入参
     */
    private List<ExportApiParameter> inputParameterList;

    /**
     * 出参
     */
    private List<ExportApiParameter> outputParameterList;

}
