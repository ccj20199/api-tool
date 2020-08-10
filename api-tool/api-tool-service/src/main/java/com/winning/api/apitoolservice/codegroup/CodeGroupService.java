package com.winning.api.apitoolservice.codegroup;

import com.winning.api.apitoolservice.vo.coderepositorygroup.add.AddGroupInputVO;
import com.winning.api.apitoolservice.vo.coderepositorygroup.add.AddGroupOutVO;
import com.winning.api.apitoolservice.vo.coderepositorygroup.delete.DeleteGroupInputVO;
import com.winning.api.apitoolservice.vo.coderepositorygroup.edit.EditGroupInputVO;
import com.winning.api.apitoolservice.vo.coderepositorygroup.edit.EditGroupOutVO;
import com.winning.api.apitoolservice.vo.coderepositorygroup.search.SearchGroupInputVO;
import com.winning.api.apitoolservice.vo.coderepositorygroup.search.SearchGroupOutVO;

/**
 * <p>api-tool</p>
 *  仓库包含的分组信息
 * @author cq
 * @Description
 * @date 2020/7/28 13:49
 */
public interface CodeGroupService {
    /**
     * 分组信息
     * @param inputVO 分组信息
     * @return 分组信息
     */
    AddGroupOutVO add(AddGroupInputVO inputVO);
    /**
     * 分组信息
     * @param inputVO 分组信息
     * @return 分组信息
     */
    EditGroupOutVO edit(EditGroupInputVO inputVO);

    /**
     * 删除分组信息
     * @param inputVO 入参 分组id
     */
    void delete(DeleteGroupInputVO inputVO);

    /***
     * 树形结构的分组信息
     * @param inputVO 查询入参
     * @return 树形结构的分组信息
     */
    SearchGroupOutVO search(SearchGroupInputVO inputVO);
}
