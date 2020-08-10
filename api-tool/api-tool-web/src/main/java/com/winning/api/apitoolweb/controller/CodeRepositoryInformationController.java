package com.winning.api.apitoolweb.controller;

import com.winning.api.apitoolcommon.ResponseResult;
import com.winning.api.apitoolservice.coderepository.CodeRepositoryServiceImpl;
import com.winning.api.apitoolweb.contant.ApiPathConstant;
import com.winning.api.apitoolservice.vo.coderepository.add.AddInputVO;
import com.winning.api.apitoolservice.vo.coderepository.add.AddOutVO;
import com.winning.api.apitoolservice.vo.coderepository.domain.QueryAllOutVO;
import com.winning.api.apitoolservice.vo.coderepository.edit.EditInputVO;
import com.winning.api.apitoolservice.vo.coderepository.edit.EditOutVO;
import com.winning.api.apitoolservice.vo.coderepository.getappid.AppIdByDomainIdInputVO;
import com.winning.api.apitoolservice.vo.coderepository.getappid.AppIdByDomainIdOutVO;
import com.winning.api.apitoolservice.vo.coderepository.search.SearchByIdInputVO;
import com.winning.api.apitoolservice.vo.coderepository.search.SearchByIdOutVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * <p>api-tool</p>
 * 代码仓库
 *
 * @author cq
 * @Description
 * @date 2020/7/27 11:15
 */
@RestController
@Api(tags = "代码仓库")
public class CodeRepositoryInformationController {

    @Autowired
    private CodeRepositoryServiceImpl codeRepositoryService;


    @ApiOperation(nickname = "查询业务域信息", value = "查询业务域信息")
    @PostMapping(ApiPathConstant.BUSINESS_DOMAIN_INFORMATION_SEARCH)
    public ResponseResult searchBusinessDomain() {

        QueryAllOutVO outVO=codeRepositoryService.searchBusinessDomain();

        return ResponseResult.success(outVO);
    }

    @ApiOperation(nickname = "根据业务域编码查询代码仓库信息", value = "根据业务域编码查询代码仓库信息")
    @PostMapping(ApiPathConstant.CODE_REPOSITORY_INFORMATION_SEARCH)
    public ResponseResult codeRepositoryInformationSearch(@Valid @RequestBody SearchByIdInputVO inputVO) {

        SearchByIdOutVO outVO=codeRepositoryService.search(inputVO);

        return ResponseResult.success(outVO);
    }


    @ApiOperation(nickname = "新增代码仓库信息", value = "新增代码仓库信息")
    @PostMapping(ApiPathConstant.CODE_REPOSITORY_INFORMATION_ADD)
    public ResponseResult add(@Valid @RequestBody AddInputVO inputVO) {

        AddOutVO outVO=codeRepositoryService.add(inputVO);

        return ResponseResult.success(outVO);
    }

    @ApiOperation(nickname = "代码仓库编辑", value = "代码仓库编辑")
    @PostMapping(ApiPathConstant.CODE_REPOSITORY_INFORMATION_EDIT)
    public ResponseResult edit(@Valid @RequestBody EditInputVO inputVO) {

        EditOutVO outVO=codeRepositoryService.edit(inputVO);

        return ResponseResult.success(outVO);
    }
    @ApiOperation(nickname = "根据业务域标识、架构类别代码获取当前可用的appId", value = "根据业务域标识、架构类别代码获取当前可用的appId")
    @PostMapping(ApiPathConstant.APP_ID_BY_DOMAIN_ID_REPOSITORY_ARCHITECT_TYPE_CODE)
    public ResponseResult appIdByDomainIdRepositoryArchitectTypeCode(@Valid @RequestBody AppIdByDomainIdInputVO inputVO) {

        AppIdByDomainIdOutVO outVO=codeRepositoryService.appIdByDomainIdRepositoryArchitectTypeCode(inputVO);

        return ResponseResult.success(outVO);
    }


}
