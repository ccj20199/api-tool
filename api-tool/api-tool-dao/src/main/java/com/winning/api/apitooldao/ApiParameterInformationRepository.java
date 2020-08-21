package com.winning.api.apitooldao;


import com.winning.api.apitoolentity.ApiParameterInformationPO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/7/29 10:51
 */
@Repository
public interface ApiParameterInformationRepository extends JpaRepository<ApiParameterInformationPO,Long> {


    /**
     * API的参数信息
     * @param apiId apiId
     * @return API的参数信息
     */
    @Query("select  po from ApiParameterInformationPO po where po.apiId = ?1")
    List<ApiParameterInformationPO> listByApiId(Long apiId);
    /**
     * API的参数信息
     * @param apiIds apiIds
     * @return API的参数信息
     */
    @Query("select  po from ApiParameterInformationPO po where po.apiId in (?1) ")
    List<ApiParameterInformationPO> listByApiIds(List<Long> apiIds);
    /**
     *API修改标识
     * @param apiId
     */
    @Modifying
    @Transactional(rollbackOn = Exception.class)
    @Query(" delete  from ApiParameterInformationPO where apiId=?1")
    void deleteByApiId(Long apiId);

    /**
     * API的参数信息
     * @param apiId API标识
     * @param parameterTypeCode 参数类型代码
     * @return API的参数信息
     */
    @Query("select  po from ApiParameterInformationPO po where po.apiId = ?1 and po.parameterTypeCode=?2 ")
    List<ApiParameterInformationPO> listByApiId(Long apiId,
                                                Long parameterTypeCode);
}
