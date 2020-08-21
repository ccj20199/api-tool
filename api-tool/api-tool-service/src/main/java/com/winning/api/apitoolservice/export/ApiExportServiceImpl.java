package com.winning.api.apitoolservice.export;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import com.google.common.collect.Lists;
import com.winning.api.apitoolcommon.BusinessException;
import com.winning.api.apitoolcommon.contant.Constant;
import com.winning.api.apitooldao.ApiInformationDetailRepository;
import com.winning.api.apitooldao.ApiParameterInformationRepository;
import com.winning.api.apitooldao.CodeRepositoryGroupRepository;
import com.winning.api.apitooldao.CodeRepositoryInformationRepository;
import com.winning.api.apitoolentity.ApiInformationDetailPO;
import com.winning.api.apitoolentity.ApiParameterInformationPO;
import com.winning.api.apitoolentity.CodeRepositoryGroupPO;
import com.winning.api.apitoolentity.CodeRepositoryInformationPO;
import com.winning.api.apitoolservice.enumpack.DataTypeCode;
import com.winning.api.apitoolservice.enumpack.ParameterType;
import com.winning.api.apitoolservice.enumpack.RequestMethodCode;
import com.winning.api.apitoolservice.util.ExportApiParamInfoUtil;
import com.winning.api.apitoolservice.vo.coderepositorygroup.search.GroupInfo;
import com.winning.api.apitoolservice.vo.export.CodeRepositoryIdOutVO;
import com.winning.api.apitoolservice.vo.export.ExportApiParameter;
import com.winning.api.apitoolservice.vo.export.ExportGroupInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/4 10:43
 */
@Service
public class ApiExportServiceImpl {

    @Autowired
    private CodeRepositoryGroupRepository codeRepositoryGroupRepository;
    @Autowired
    private ApiInformationDetailRepository apiInformationDetailRepository;

    @Autowired
    private ApiParameterInformationRepository apiParameterInformationRepository;

    @Autowired
    private ExportApiParamInfoUtil exportApiParamInfoUtil;
    @Autowired
    private CodeRepositoryInformationRepository codeRepositoryInformationRepository;
    @Autowired
    private ExportGroupInfoUtil exportGroupInfoUtil;

    public List<CodeRepositoryIdOutVO> exportByCodeRepositoryId(Long codeRepositoryId) {

        // 通过代码仓库标识 查询分组信息
        List<CodeRepositoryGroupPO> list=codeRepositoryGroupRepository.listByCodeRepositoryId(codeRepositoryId, Constant.IS_DEL_YES);
        if(CollectionUtil.isEmpty(list)){
            throw  new BusinessException("该代码仓库【"+codeRepositoryId+"下未建分组信息");
        }
        //通过分组信息查询 并组装api信息
        List<Long> groupIds=list.stream().map(e->e.getGroupId()).collect(Collectors.toList());

        //api信息
        List<ApiInformationDetailPO> apiInformationDetailPOS= apiInformationDetailRepository.listByGroupId(groupIds,Constant.IS_DEL_YES);
        if(CollectionUtil.isEmpty(apiInformationDetailPOS)){
            throw  new BusinessException("该代码仓库【"+codeRepositoryId+"下没有api信息");
        }
        List<Long> apiIds=apiInformationDetailPOS.stream().map(e->e.getApiId()).collect(Collectors.toList());
        //api 入参和出参
        //查询参数
        List<ApiParameterInformationPO> parameterLists= apiParameterInformationRepository.listByApiIds(apiIds);
        //通过apiId分组 参数列表
        Map<Long,List<ApiParameterInformationPO>> map=parameterLists.stream().collect(Collectors.groupingBy(ApiParameterInformationPO::getApiId));

        List<CodeRepositoryIdOutVO> CodeRepositoryIdOutVOs=Lists.newArrayList();
        for (ApiInformationDetailPO apiInformationDetailPO : apiInformationDetailPOS) {
            CodeRepositoryIdOutVO outVO=new CodeRepositoryIdOutVO();
            BeanUtil.copyProperties(apiInformationDetailPO, outVO);
            if(Objects.equals(22L,outVO.getAllowPageCode())){
                outVO.setAllowPage( "是");
            }else{
                outVO.setAllowPage( "否");
            }
            RequestMethodCode requestMethodCode= RequestMethodCode.getInstance(outVO.getRequestMethodCode());
            outVO.setRequestMethodCodeName(requestMethodCode.getName());
            //添加参数
            List<ApiParameterInformationPO> apiParameterInformationPOS=  map.get(apiInformationDetailPO.getApiId());
            //区分 入参和出参

            if(CollectionUtil.isNotEmpty(apiParameterInformationPOS)){
                //入参
                List<ExportApiParameter> inputParameters=Lists.newArrayList();
                //出参
                List<ExportApiParameter> outParameters=Lists.newArrayList();

                for (ApiParameterInformationPO apiParameterInformationPO : apiParameterInformationPOS) {
                    ExportApiParameter exportApiParameter=new ExportApiParameter();
                    BeanUtil.copyProperties(apiParameterInformationPO, exportApiParameter);
                    if(Objects.equals(41L,exportApiParameter.getRequiredCode())){
                        exportApiParameter.setRequiredCodeName("Y");
                    }else{
                        exportApiParameter.setRequiredCodeName("N");
                    }
                    DataTypeCode dataTypeCode= DataTypeCode.getInstance(exportApiParameter.getDataTypeCode());
                    exportApiParameter.setDataTypeCodeName(dataTypeCode.getName());
                    if(Objects.equals(apiParameterInformationPO.getParameterTypeCode(), ParameterType.INPUT_PARAMETER.getCode())){
                        //入参
                        inputParameters.add(exportApiParameter);
                    }else{
                        //出参
                        outParameters.add(exportApiParameter);
                    }
                }

                List<ExportApiParameter> parameterList=  exportApiParamInfoUtil.getApiParameter(inputParameters);

                List<ExportApiParameter> result= exportApiParamInfoUtil.getData(parameterList,Lists.newArrayList());


                List<ExportApiParameter> outParameterList=  exportApiParamInfoUtil.getApiParameter(outParameters);

                List<ExportApiParameter> outResult= exportApiParamInfoUtil.getData(outParameterList,Lists.newArrayList());
                outVO.setInputParameterList(result);
                outVO.setOutputParameterList(outResult);
            }

            CodeRepositoryIdOutVOs.add(outVO);

        }

        return  CodeRepositoryIdOutVOs;

    }

    public String repositoryNameById(Long codeRepositoryId) {

       Optional<CodeRepositoryInformationPO> optional= codeRepositoryInformationRepository.findById(codeRepositoryId);
       if (!optional.isPresent()){
           throw  new BusinessException("未查到代码标识【"+codeRepositoryId+"】：代码仓库");
       }
       return optional.get().getRepositoryName();
    }


    public List<ExportGroupInfo> getData(Long codeRepositoryId) {


        List<CodeRepositoryIdOutVO> codeRepositoryIdOutVOS=exportByCodeRepositoryId(codeRepositoryId);
        List<CodeRepositoryGroupPO> list=codeRepositoryGroupRepository.listByCodeRepositoryId(codeRepositoryId,Constant.IS_DEL_YES);

            List<ExportGroupInfo> groupInfos = Lists.newArrayList();
            list.forEach(e->{
                ExportGroupInfo info=new ExportGroupInfo();
                info.setGroupId(e.getGroupId());
                info.setGroupName(e.getGroupName());
                info.setParentGroupId(e.getParentGroupId());
                groupInfos.add(info);
            });
         List<ExportGroupInfo> allList=  exportGroupInfoUtil.getExportGroupInfo(groupInfos,codeRepositoryIdOutVOS,4);
        // 组装数据

        return allList;
    }
}
