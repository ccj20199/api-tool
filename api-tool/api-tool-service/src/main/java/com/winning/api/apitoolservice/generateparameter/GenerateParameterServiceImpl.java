package com.winning.api.apitoolservice.generateparameter;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.winning.api.apitoolcommon.BusinessException;
import com.winning.api.apitooldao.ApiInformationDetailRepository;
import com.winning.api.apitooldao.ApiParameterInformationRepository;
import com.winning.api.apitoolentity.ApiInformationDetailPO;
import com.winning.api.apitoolentity.ApiParameterInformationPO;
import com.winning.api.apitoolservice.enumpack.ParameterType;
import com.winning.api.apitoolservice.util.GenerateApiParamInfoUtil;
import com.winning.api.apitoolservice.vo.generateparameter.GenerateApiParameter;
import com.winning.api.apitoolservice.vo.generateparameter.GenerateParameterInputVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.text.CaseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/20 16:35
 */
@Service
@Slf4j
public class GenerateParameterServiceImpl {

    @Autowired
    private ApiParameterInformationRepository apiParameterInformationRepository;
    @Autowired
    private GenerateApiParamInfoUtil apiParamInfoUtil;
    @Autowired
    private ApiInformationDetailRepository apiInformationDetailRepository;
    public Map<String, Map<String, Object>> generateParameterDto(GenerateParameterInputVO inputVO) {
        Optional<ApiInformationDetailPO> optional = apiInformationDetailRepository.findById(inputVO.getApiId());
        if(!optional.isPresent()){
            throw  new BusinessException("当前api没有查询到对应的api信息");
        }
        String apiUrl = optional.get().getApiUrl();
        List<ApiParameterInformationPO> apiParameterInformationPOS = apiParameterInformationRepository.listByApiId(inputVO.getApiId(), inputVO.getParameterTypeCode());
        if(CollectionUtil.isEmpty(apiParameterInformationPOS)){
            return Maps.newHashMap();
        }
        List<GenerateApiParameter> list= Lists.newArrayList();
        apiParameterInformationPOS.forEach(e->{
            GenerateApiParameter generateApiParameter=new GenerateApiParameter();
            BeanUtil.copyProperties(e,generateApiParameter);
            list.add(generateApiParameter);
        });
        List<GenerateApiParameter> apiParameter = apiParamInfoUtil.getApiParameter(list);

        String s;
        try {
            String[] split = apiUrl.split("/");
            int length = split.length;
            String s1 = split[length - 1];
            String s2 = split[length - 2];
            String s3 = split[length - 3];
            s = CaseUtils.toCamelCase(s2, true, new char[]{'_'})+
                    CaseUtils.toCamelCase(s3, true, new char[]{'_'})+
                    CaseUtils.toCamelCase(s1, true, new char[]{'_'});
        } catch (Exception e) {
            throw new BusinessException("url地址不符合规范：【"+apiUrl+"】");
        }
        String apiName = optional.get().getApiName();
        String parameterType="0";
        if(Objects.equals(ParameterType.INPUT_PARAMETER.getCode(),inputVO.getParameterTypeCode())){
            parameterType="1";
            s+="InputDTO";
            apiName+="入参";
        }else{
            s+="OutDTO";
            apiName+="出参";
        }
        Map<String, Map<String, Object>> mapData = apiParamInfoUtil.getMapData(apiParameter, s,apiName,parameterType);

        return  mapData;
    }
}
