package com.winning.api.apitoolweb.controller;

import com.winning.api.apitoolcommon.ResponseResult;
import com.winning.api.apitoolservice.sysdictdata.SysDictDataService;
import com.winning.api.apitoolweb.contant.ApiPathConstant;
import com.winning.api.apitoolservice.vo.sysdictdata.DictDateByIdInputVO;
import com.winning.api.apitoolservice.vo.sysdictdata.DictDateByIdOutVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/7/27 16:49
 */
@RestController
@Api(tags = "字典信息管理")
public class SysDictDataController {


    @Autowired
    private SysDictDataService sysDictDataService;

    @ApiOperation(nickname = "根据字典主键查询字典数据信息列表", value = "根据字典主键查询字典数据信息列表")
    @PostMapping(ApiPathConstant.SYS_DICT_DATA_BY_SYS_DICT_ID)
    public ResponseResult sysDictDataBySysDictId(@Valid @RequestBody DictDateByIdInputVO inputVO) {

        DictDateByIdOutVO outVO=sysDictDataService.sysDictDataBySysDictId(inputVO);

        return ResponseResult.success(outVO);
    }
}
