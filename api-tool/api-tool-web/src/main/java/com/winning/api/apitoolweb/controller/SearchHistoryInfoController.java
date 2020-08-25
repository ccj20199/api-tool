package com.winning.api.apitoolweb.controller;

import com.winning.api.apitoolcommon.ResponseResult;
import com.winning.api.apitoolservice.history.SearchHistoryInfoServiceImpl;
import com.winning.api.apitoolservice.vo.history.SearchHistoryInputVo;
import com.winning.api.apitoolservice.vo.history.SearchHistoryOutVo;
import com.winning.api.apitoolweb.contant.ApiPathConstant;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>api-tool</p>
 * 查看历史版本
 * @author cq
 * @Description
 * @date 2020/8/25 16:56
 */
@RestController
@Api(tags = "查看历史版本")
public class SearchHistoryInfoController {

    @Autowired
    private SearchHistoryInfoServiceImpl searchHistoryInfoService;

    @ApiOperation(nickname = "根据API标识查询历史版本信息", value = "根据API标识查询历史版本信息")
    @PostMapping(ApiPathConstant.SEARCH_HISTORY_INFO)
    public ResponseResult searchHistoryInfo(@Valid @RequestBody SearchHistoryInputVo inputVO) {

        List<SearchHistoryOutVo> outVO=searchHistoryInfoService.searchHistoryInfo(inputVO);

        return ResponseResult.success(outVO);
    }
}
