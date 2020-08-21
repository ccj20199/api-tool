package com.winning.api.apitoolservice.generateparameter;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.winning.api.apitooldao.ApiParameterInformationRepository;
import com.winning.api.apitoolentity.ApiParameterInformationPO;
import com.winning.api.apitoolservice.util.GenerateApiParamInfoUtil;
import com.winning.api.apitoolservice.vo.generateparameter.GenerateApiParameter;
import com.winning.api.apitoolservice.vo.generateparameter.GenerateParameterInputVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/20 16:35
 */
@Service
public class GenerateParameterServiceImpl {

    @Autowired
    private ApiParameterInformationRepository apiParameterInformationRepository;
    @Autowired
    private GenerateApiParamInfoUtil apiParamInfoUtil;
    public Map<String, Map<String, Object>> generateParameterDto(GenerateParameterInputVO inputVO) {

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

        Map<String, Map<String, Object>> mapData = apiParamInfoUtil.getMapData(apiParameter, "UserDTO");
        return  mapData;
    }
}
