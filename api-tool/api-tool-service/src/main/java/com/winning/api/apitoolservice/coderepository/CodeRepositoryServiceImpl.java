package com.winning.api.apitoolservice.coderepository;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.winning.api.apitoolcommon.BusinessException;
import com.winning.api.apitoolcommon.contant.Constant;
import com.winning.api.apitooldao.BusinessDomainInformationRepository;
import com.winning.api.apitooldao.CodeRepositoryGroupRepository;
import com.winning.api.apitooldao.CodeRepositoryInformationRepository;
import com.winning.api.apitoolentity.BusinessDomainInformationPO;
import com.winning.api.apitoolentity.CodeRepositoryGroupPO;
import com.winning.api.apitoolentity.CodeRepositoryInformationPO;
import com.winning.api.apitoolservice.vo.coderepository.add.AddInputVO;
import com.winning.api.apitoolservice.vo.coderepository.add.AddOutVO;
import com.winning.api.apitoolservice.vo.coderepository.domain.DoMainInfoVO;
import com.winning.api.apitoolservice.vo.coderepository.domain.QueryAllOutVO;
import com.winning.api.apitoolservice.vo.coderepository.edit.EditInputVO;
import com.winning.api.apitoolservice.vo.coderepository.edit.EditOutVO;
import com.winning.api.apitoolservice.vo.coderepository.getappid.AppIdByDomainIdInputVO;
import com.winning.api.apitoolservice.vo.coderepository.getappid.AppIdByDomainIdOutVO;
import com.winning.api.apitoolservice.vo.coderepository.search.CodeRepositoryVO;
import com.winning.api.apitoolservice.vo.coderepository.search.SearchByIdInputVO;
import com.winning.api.apitoolservice.vo.coderepository.search.SearchByIdOutVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.*;
import java.util.stream.Collectors;

import static com.winning.api.apitoolcommon.IdWorker.getSnowflakeId;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/7/27 13:20
 */
@Service
public class CodeRepositoryServiceImpl implements CodeRepositoryService {

    @Autowired
    private CodeRepositoryInformationRepository codeRepository;

    @Autowired
    private BusinessDomainInformationRepository domainInformationRepository;

    @Autowired
    @PersistenceContext
    private EntityManager entityManager;
    @Autowired
    private CodeRepositoryGroupRepository codeRepositoryGroupRepository;

    @Override
    public AddOutVO add(AddInputVO inputVO) {
        // 校验数据
        checkDate(inputVO);
        AddOutVO outVO =new AddOutVO();
        //生成主键id
        long id = getSnowflakeId();
        CodeRepositoryInformationPO po=new CodeRepositoryInformationPO();
        BeanUtil.copyProperties(inputVO, po);
        po.setCodeRepositoryId(id);
        outVO.setCodeRepositoryId(id);
        Date date=DateTime.now();
        po.setCreateAt(date);
        po.setModifiedAt(date);
        po.setCurrApiNo("0001");
        codeRepository.save(po);
        return outVO;
    }

    private void checkDate(AddInputVO inputVO){

        int count=codeRepository.countByRepositoryName(inputVO.getRepositoryName(),inputVO.getAppId(),inputVO.getAppName());
        if(count>0){
            throw  new BusinessException("已存在【仓库名称】或【服务appId】或【APP名称】相同的代码仓库");
        }

        // 判断 服务appId 四位
        if(inputVO.getAppId().toString().length()!=4){
            throw new BusinessException("服务appId为四位数");
        }

        Long businessDomainId=inputVO.getBusinessDomainId();
        //通过业务域 查询当前的业务域编码
        BusinessDomainInformationPO po=domainInformationRepository.getByDomainId(businessDomainId);
        if(Objects.isNull(po)){
            throw new BusinessException("当前业务域标识【"+businessDomainId+"】未查询到业务域信息");
        }
        if( !NumberUtil.isNumber(po.getBusinessDomainRepositoryNo())){
            throw  new BusinessException("当前的业务域编码不是数字类型！！");

        }
        //获取当前最大的appId
        String appIdString=inputVO.getRepositoryArchitectTypeCode()+po.getBusinessDomainRepositoryNo();
        List<BigInteger> list= getCodeRepositoryInformationPOs(appIdString);
        if(CollectionUtil.isEmpty(list)){

            if(!(appIdString+ Constant.STRING_ZERO).equals(inputVO.getAppId().toString())){
                throw  new BusinessException("appId应为："+appIdString+Constant.STRING_ZERO);
            }
        }else{
            int appId=list.get(0).intValue()+1;
            if(appId!=inputVO.getAppId().intValue()){
                throw new BusinessException("appId应为："+appId);
            }

        }
       //校验
        if(!inputVO.getExceptionClassNo().toString().equals(inputVO.getAppId().toString())){
            throw new BusinessException("异常类别编码和服务appId一致");
        }
        if(!inputVO.getDefaultPort().toString().equals(inputVO.getAppId()+Constant.STRING_ZERO)){
            throw new BusinessException("默认端口号应为："+inputVO.getAppId()+Constant.STRING_ZERO);
        }


    }


    @Override
    public QueryAllOutVO searchBusinessDomain() {

        List<BusinessDomainInformationPO> list=domainInformationRepository.findAll();
        if(CollectionUtil.isNotEmpty(list)){
            final List<DoMainInfoVO> data= Lists.newArrayListWithCapacity(list.size());
            list.forEach(e->{
                DoMainInfoVO doMainInfoVO=new DoMainInfoVO();
                BeanUtil.copyProperties(e, doMainInfoVO);
                data.add(doMainInfoVO);
            });
            QueryAllOutVO queryAllOutVO=new QueryAllOutVO();
            queryAllOutVO.setData(data);
            return  queryAllOutVO;
        }
        return null;
    }

    @Override
    public EditOutVO edit(EditInputVO inputVO) {
        EditOutVO editOutVO=new EditOutVO();
        editOutVO.setCodeRepositoryId(inputVO.getCodeRepositoryId());
        //当api编号存在时 抛出错误信息
        checkApiNo(inputVO);
        // 修改
        CodeRepositoryInformationPO oldPO=  getPO(inputVO);
        CodeRepositoryInformationPO po=new CodeRepositoryInformationPO();
        BeanUtil.copyProperties(inputVO, po);
        Date date=DateTime.now();
        po.setModifiedAt(date);
        po.setCreateAt(oldPO.getCreateAt());
        po.setCreateBy(oldPO.getCreateBy());
        po.setCurrApiNo(oldPO.getCurrApiNo());
        if(StrUtil.isBlank(inputVO.getInterfaceBasePath())){
            po.setInterfaceBasePath(oldPO.getInterfaceBasePath());
        }
        if(StrUtil.isBlank(inputVO.getMemo())){
            po.setMemo(oldPO.getMemo());
        }
        codeRepository.save(po);
        return editOutVO;
    }

    private CodeRepositoryInformationPO getPO(EditInputVO inputVO) {
        Optional<CodeRepositoryInformationPO> optional= codeRepository.findById(inputVO.getCodeRepositoryId());
        if(optional.isPresent()){
            return optional.get();
        }else{
            throw  new BusinessException("没有【代码仓库标识】："+inputVO.getCodeRepositoryId());
        }
    }

    private void checkApiNo(EditInputVO inputVO){


        // 判断 服务appId 四位
        if(inputVO.getAppId().toString().length()!=4){
            throw new BusinessException("服务appId为四位数");
        }

        Long businessDomainId=inputVO.getBusinessDomainId();
        //通过业务域 查询当前的业务域编码
        BusinessDomainInformationPO po=domainInformationRepository.getByDomainId(businessDomainId);
        if(Objects.isNull(po)){
            throw new BusinessException("当前业务域标识【"+businessDomainId+"】未查询到业务域信息");
        }
        if( !NumberUtil.isNumber(po.getBusinessDomainRepositoryNo())){
            throw  new BusinessException("当前的业务域编码不是数字类型！！");

        }
        //校验
        if(!inputVO.getExceptionClassNo().toString().equals(inputVO.getAppId().toString())){
            throw new BusinessException("异常类别编码和服务appId一致");
        }
        if(!inputVO.getDefaultPort().toString().equals(inputVO.getAppId()+Constant.STRING_ZERO)){
            throw new BusinessException("默认端口号应为："+inputVO.getAppId()+Constant.STRING_ZERO);
        }


    }

    @Override
    public SearchByIdOutVO search(SearchByIdInputVO inputVO) {

        Long repositoryStatusCode = inputVO.getRepositoryStatusCode();
        List<CodeRepositoryInformationPO> list;
        if(Objects.isNull(repositoryStatusCode)){
            list= codeRepository.listByBusinessDomainId(inputVO.getBusinessDomainId());
        }else{
            list= codeRepository.listByBusinessDomainIdAndStatusCode(inputVO.getBusinessDomainId(),repositoryStatusCode);
        }

        if(CollectionUtil.isNotEmpty(list)){
            final List<CodeRepositoryVO> data= Lists.newArrayListWithCapacity(list.size());
            List<Long> codeRepositoryIds = list.stream().map(e -> e.getCodeRepositoryId()).collect(Collectors.toList());
            // 通过代码仓库标识 查询分组信息
            List<CodeRepositoryGroupPO> codeRepositoryGroupPOS=codeRepositoryGroupRepository.listByCodeRepositoryIds(codeRepositoryIds, Constant.IS_DEL_YES);
            Map<Long, List<CodeRepositoryGroupPO>> map= Maps.newHashMap();
            if(CollectionUtil.isNotEmpty(codeRepositoryGroupPOS)){
                map = codeRepositoryGroupPOS.stream()
                        .collect(Collectors.groupingBy(CodeRepositoryGroupPO::getCodeRepositoryId));
            }
            Map<Long, List<CodeRepositoryGroupPO>> finalMap = map;
            list.forEach(e->{
                CodeRepositoryVO codeRepositoryVO=new CodeRepositoryVO();
                BeanUtil.copyProperties(e, codeRepositoryVO);
                List<CodeRepositoryGroupPO> codeRepositoryGroupPOList=finalMap.get(e.getCodeRepositoryId());
                if(CollectionUtil.isNotEmpty(codeRepositoryGroupPOList)){
                    codeRepositoryVO.setApiCount(codeRepositoryGroupPOList.size());
                }
                data.add(codeRepositoryVO);
            });




            SearchByIdOutVO queryAllOutVO=new SearchByIdOutVO();
            queryAllOutVO.setData(data);
            return  queryAllOutVO;
        }
        return null;
    }


    @Override
    public AppIdByDomainIdOutVO appIdByDomainIdRepositoryArchitectTypeCode(AppIdByDomainIdInputVO inputVO) {

        Long architectTypeCode=inputVO.getRepositoryArchitectTypeCode();
        if(architectTypeCode.intValue()>4 || architectTypeCode.intValue()<1){

            throw new BusinessException("仓库架构类别代码在区间[1,4]之间");
        }

        AppIdByDomainIdOutVO outVO=new  AppIdByDomainIdOutVO();
        //通过业务域 查询当前的业务域编码
        BusinessDomainInformationPO po=domainInformationRepository.getByDomainId(inputVO.getBusinessDomainId());
        if(Objects.isNull(po)){
            throw new BusinessException("当前业务域标识【"+inputVO.getBusinessDomainId()+"】未查询到业务域信息");
        }
        if( !NumberUtil.isNumber(po.getBusinessDomainRepositoryNo())){
            throw  new BusinessException("当前的业务域编码不是数字类型！！");
        }
        //查询 代码仓库中的 最大值是？ 通过当前仓库架构类别代码+业务域编码查询
        String appIdString=inputVO.getRepositoryArchitectTypeCode()+po.getBusinessDomainRepositoryNo();
        List<BigInteger> list= getCodeRepositoryInformationPOs(appIdString);
        Integer appId= 0;
        if(CollectionUtil.isEmpty(list)){
            appId= Integer.parseInt(appIdString+ Constant.STRING_ZERO);

        }else{
            appId=list.get(0).intValue()+1;
        }
        outVO.setAppId(appId);
        outVO.setExceptionClassNo(appId);
        outVO.setDefaultPort(Integer.parseInt(appId+"0"));
        return outVO;
    }

    private List<BigInteger> getCodeRepositoryInformationPOs(String appId){

        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("select u.APP_ID appId from CODE_REPOSITORY_INFORMATION u");

        stringBuilder.append(" where u.APP_ID Like ('%"+appId+"%')");
        stringBuilder.append(" order by u.APP_ID desc");


        Query query = entityManager.createNativeQuery(stringBuilder.toString());
        List<BigInteger> list= (List<BigInteger>)query.getResultList();

        return list;
    }
}
