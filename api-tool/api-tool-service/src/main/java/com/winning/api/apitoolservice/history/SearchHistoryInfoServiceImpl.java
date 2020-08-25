package com.winning.api.apitoolservice.history;

import cn.hutool.core.bean.BeanUtil;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.winning.api.apitooldao.ApiInformationDetailUpdateRepository;
import com.winning.api.apitooldao.EmployeesRepository;
import com.winning.api.apitoolentity.EmployeesPO;
import com.winning.api.apitoolservice.vo.history.SearchHistoryInputVo;
import com.winning.api.apitoolservice.vo.history.SearchHistoryOutVo;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/25 17:00
 */
@Service
public class SearchHistoryInfoServiceImpl {


    @Autowired
    private ApiInformationDetailUpdateRepository apiInformationDetailUpdateRepository;
    @Autowired
    private EmployeesRepository employeesRepository;

    public List<SearchHistoryOutVo> searchHistoryInfo(SearchHistoryInputVo inputVO) {

        List<SearchHistoryOutVo> result= Lists.newArrayList();

        List<Map<String, Object>> list = apiInformationDetailUpdateRepository.listByApiId(inputVO.getApiId());
        List<String> createByIds = list.stream().map(e -> e.get("apiChangeBy")+"").distinct().collect(Collectors.toList());
        Map<String, EmployeesPO> empIdMap= Maps.newHashMap();
        if(CollectionUtils.isNotEmpty(createByIds)){
            List<EmployeesPO> employeesPOS=employeesRepository.listByEmpids(createByIds);
            empIdMap=employeesPOS.stream()
                    .collect(Collectors.toMap(EmployeesPO::getEmpid,o->o,(k1,k2)->k2));
        }
        Map<String, EmployeesPO> finalEmpIdMap = empIdMap;
        list.forEach(e->{

            SearchHistoryOutVo outVo = BeanUtil.fillBeanWithMap(e, new SearchHistoryOutVo(), false);
            EmployeesPO employeesPO = finalEmpIdMap.get(outVo.getApiChangeBy());
            if(Objects.nonNull(employeesPO)){
                outVo.setApiChangeBy(employeesPO.getEmpname());
            }
            result.add(outVo);
        });


        return result;
    }
}
