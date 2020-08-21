package com.winning.api.apitoolservice.util;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.winning.api.apitoolservice.vo.generateparameter.Attr;
import com.winning.api.apitoolservice.enumpack.DataTypeCode;
import com.winning.api.apitoolservice.vo.generateparameter.GenerateApiParameter;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/7/30 14:39
 */
@Component
public class GenerateApiParamInfoUtil {

    public List<GenerateApiParameter> getApiParameter(List<GenerateApiParameter> allList){

       
        
        List<GenerateApiParameter> baseLists = Lists.newArrayList();
        // 总菜单，出一级菜单，一级菜单没有父id
        for (GenerateApiParameter e : allList) {

            if (Objects.equals(e.getParentParameterId(),0L)) {
                baseLists.add(e);
            }

        }
     

        // 遍历一级菜单
        for (GenerateApiParameter e : baseLists) {
            // 将子元素 set进一级菜单里面   getChild()方法在下方
            e.setParameterVOS(getChild(e.getApiParameterId(), allList));
        }
       

        return baseLists;
    }

    /**
     * 获取子节点
     *
     * @param pid
     * @param beanList
     * @return
     */

    private List<GenerateApiParameter> getChild(Long pid,
                                                List<GenerateApiParameter> beanList) {

        List<GenerateApiParameter> childs = Lists.newArrayList();
     
        for (GenerateApiParameter e : beanList) {

            if (!Objects.equals(e.getParentParameterId(),0L)) {
                if (e.getParentParameterId().equals(pid)) {
                    // 子菜单的下级菜单
                    childs.add(e);
                }
            }
        }
        // 把子菜单的子菜单再循环一遍
        for (GenerateApiParameter e : childs) {
            // 继续添加子元素
            e.setParameterVOS(getChild(e.getApiParameterId(), beanList));
        }

        //停下来的条件，如果 没有子元素了，则停下来
        if (childs.size() == 0) {
            return null;
        }
        return childs;
    }

    public Map<String,Map<String,Object>> getMapData(List<GenerateApiParameter> apiParameter,
                                                     String className,
                                                     String description,
                                                     String parameterType) {
        Map<String,Map<String,Object>> map=Maps.newHashMap();
        getMap(apiParameter,className,map,description,parameterType);
        return map;

    }

    private void getMap(List<GenerateApiParameter> apiParameter,
                        String className,
                        Map<String,Map<String,Object>> map,
                        String description,
                        String parameterType) {


        List<Object> list = Lists.newArrayList();
        // 第一层
        for (GenerateApiParameter generateApiParameter : apiParameter) {
            DataTypeCode instance = DataTypeCode.getInstance(generateApiParameter.getDataTypeCode());
            Attr attr=new Attr();
            attr.setField(generateApiParameter.getParameterNo());
            attr.setDataTypeCode(generateApiParameter.getDataTypeCode()+"");
            attr.setName(generateApiParameter.getParameterName());
            attr.setRequiredCode(generateApiParameter.getRequiredCode()+"");
            switch (instance){
                case DATA_LIST:
                    String parameterNo = generateApiParameter.getParameterNo();
                    String clazzName = parameterNo.substring(0, 1).toUpperCase() + parameterNo.substring(1)+"DTO";
                    attr.setType(instance.getName()+"<"+clazzName+">");
                    list.add(attr);
                    break;
                default:

                    attr.setType(instance.getName());
                    list.add(attr);
                    break;
            }
        }
        Map<String,Object> root = Maps.newHashMap();
        root.put("className", className);
        root.put("description", description);
        root.put("parameterType", parameterType);
        root.put("attrs", list);
        map.put(className,root);
        // 其他层
        for (GenerateApiParameter dto : apiParameter) {
            DataTypeCode instance = DataTypeCode.getInstance(dto.getDataTypeCode());
            switch (instance){
                case DATA_LIST:
                    List<GenerateApiParameter> parameterVOS = dto.getParameterVOS();
                    String parameterNo = dto.getParameterNo();
                    String clazzName = parameterNo.substring(0, 1).toUpperCase() + parameterNo.substring(1)+"DTO";;
                    String descriptionStr=dto.getParameterName();
                    // 添加 类名 描述
                    getMap(parameterVOS,clazzName,map,descriptionStr,"0");
                    break;
                default:
                    break;
            }

        }
    }
}
