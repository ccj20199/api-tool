package com.winning.api.apitoolservice.export;

import com.google.common.collect.Lists;
import com.winning.api.apitoolservice.vo.export.CodeRepositoryIdOutVO;
import com.winning.api.apitoolservice.vo.export.ExportGroupInfo;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * <p>api-tool</p>
 * 处理树形结构
 * @author cq
 * @Description
 * @date 2020/7/28 15:53
 */
@Component
public class ExportGroupInfoUtil {

    public  List<ExportGroupInfo> getExportGroupInfo(List<ExportGroupInfo> allList,
                                                     List<CodeRepositoryIdOutVO> codeRepositoryIdOutVOS,
                                                     int type){
        List<ExportGroupInfo> baseLists = Lists.newArrayList();
        String number="3.";
        int count =0;
        allList.forEach(e->e.setTitleNumber("3.1"));
        // 总菜单，出一级菜单，一级菜单没有父id
        for (ExportGroupInfo e : allList) {

            if (Objects.equals(e.getParentGroupId(),0L)) {
                count++;
                Long groupId=e.getGroupId();
                List<CodeRepositoryIdOutVO> filter=  codeRepositoryIdOutVOS.stream().filter(i->Objects.equals(i.getGroupId(),groupId)).collect(Collectors.toList());
                String titleNumber=number+count;
                Integer finalType=type;
                filter.forEach(o->{
                    o.setTitleNumber(titleNumber);

                    o.setTitleType(finalType);
                });
                e.setCodeRepositoryIdOutVOS(filter);
                e.setTitleType(3);
                e.setTitleNumber(titleNumber);
                baseLists.add(e);
            }
        }
        // 遍历一级菜单
        for (ExportGroupInfo e : baseLists) {
            // 将子元素 set进一级菜单里面   getChild()方法在下方
            e.setChildGroupList(getChild(e.getGroupId(), allList,type, codeRepositoryIdOutVOS));
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

    private List<ExportGroupInfo> getChild(Long pid, List<ExportGroupInfo> beanList,
                                           int type,
                                           List<CodeRepositoryIdOutVO> codeRepositoryIdOutVOS) {

        List<ExportGroupInfo> childs = Lists.newArrayList();

        for (ExportGroupInfo e : beanList) {

            String number=e.getTitleNumber()+".";
            int count=0;
            if (!Objects.equals(e.getParentGroupId(),0L)) {
                if (e.getParentGroupId().equals(pid)) {
                    type++;
                    count++;
                    // 子菜单的下级菜单
                    Long groupId=e.getGroupId();
                    String titleNumber=number+count;
                    List<CodeRepositoryIdOutVO> filter=  codeRepositoryIdOutVOS.stream().filter(i->Objects.equals(i.getGroupId(),groupId)).collect(Collectors.toList());
                    Integer finalType = type;
                    filter.forEach(o->{
                        o.setTitleNumber(titleNumber);
                        o.setTitleType(finalType);
                    });
                    e.setCodeRepositoryIdOutVOS(filter);
                    e.setTitleType(type);
                    e.setTitleNumber(titleNumber);
                    childs.add(e);
                }
            }
        }
        // 把子菜单的子菜单再循环一遍
        for (ExportGroupInfo e : childs) {
            // 继续添加子元素
            e.setChildGroupList(getChild(e.getGroupId(), beanList,type,codeRepositoryIdOutVOS));
        }

        //停下来的条件，如果 没有子元素了，则停下来
        if (childs.size() == 0) {
            return null;
        }
        return childs;
    }
}
