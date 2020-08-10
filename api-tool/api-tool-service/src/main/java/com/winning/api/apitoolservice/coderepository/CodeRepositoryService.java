package com.winning.api.apitoolservice.coderepository;

import com.winning.api.apitoolservice.vo.coderepository.add.AddInputVO;
import com.winning.api.apitoolservice.vo.coderepository.add.AddOutVO;
import com.winning.api.apitoolservice.vo.coderepository.domain.QueryAllOutVO;
import com.winning.api.apitoolservice.vo.coderepository.edit.EditInputVO;
import com.winning.api.apitoolservice.vo.coderepository.edit.EditOutVO;
import com.winning.api.apitoolservice.vo.coderepository.getappid.AppIdByDomainIdInputVO;
import com.winning.api.apitoolservice.vo.coderepository.getappid.AppIdByDomainIdOutVO;
import com.winning.api.apitoolservice.vo.coderepository.search.SearchByIdInputVO;
import com.winning.api.apitoolservice.vo.coderepository.search.SearchByIdOutVO;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/7/27 13:20
 */
public interface CodeRepositoryService {
    /**
     * 新增数据
     * @param inputVO 仓库代码入参
     * @return 新增数据
     */
    AddOutVO add(AddInputVO inputVO);

    /**
     * 查询所有的业务域信息
     * @return
     */
    QueryAllOutVO searchBusinessDomain();

    /**
     * 修改代码仓库信息
     * @param inputVO 修改代码仓库信息
     * @return 代码仓库id
     */
    EditOutVO edit(EditInputVO inputVO);

    /**
     * 根据业务域编码查询代码仓库信息
     * @param inputVO 根据业务域编码查询代码仓库信息
     * @return 根据业务域编码查询代码仓库信息
     */
    SearchByIdOutVO search(SearchByIdInputVO inputVO);

    /**
     * 根据业务域标识、架构类别代码获取当前可用的appId
     * @param inputVO 入参
     * @return 根据业务域标识、架构类别代码获取当前可用的appId
     */
    AppIdByDomainIdOutVO appIdByDomainIdRepositoryArchitectTypeCode(AppIdByDomainIdInputVO inputVO);
}
