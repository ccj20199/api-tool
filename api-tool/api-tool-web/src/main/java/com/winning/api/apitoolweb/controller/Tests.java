package com.winning.api.apitoolweb.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.poi.word.Word07Writer;
import com.google.common.collect.Maps;
import org.apache.commons.compress.utils.Lists;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;

import java.awt.*;
import java.util.List;
import java.util.Map;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/13 17:13
 */
public class Tests {

    public static void main(String[] args) {
        /*
         * 行间距没有找到怎么设置的，用的换行？？？？
         * */
        Word07Writer writer = new Word07Writer();

        // 添加段落（标题）居中
        writer.addText(ParagraphAlignment.CENTER,new Font("方正小标宋简体", Font.PLAIN, 15), "18旅游政策法规");
        writer.addText(ParagraphAlignment.RIGHT,new Font("方正小标宋简体", Font.PLAIN, 10), "模拟");
        // 添加段落（正文）
        writer.addText(new Font("宋体", Font.PLAIN, 10), "一、单选题（共50题，每题1.00分）");

        writer.addText(new Font("宋体", Font.PLAIN, 15), "二、多选题（共30题，每题1.00分）");

        writer.addText(new Font("宋体", Font.PLAIN, 15), "三、判断题（共20题，每题1.00分）");

        List<Map<String,Object>> list= Lists.newArrayList();
        Map<String,Object> map= Maps.newHashMap();
        map.put("API地址",null);
        map.put("http://localhost/foo4",null);
        list.add(map);
        List<Map<String,Object>> list1= Lists.newArrayList();
        Map<String,Object> map1= Maps.newHashMap();
        map1.put("顺序",null);
        map1.put("2120-0005-01",null);
        map1.put("2120-0005-01",null);

        list1.add(map1);

        writer.addTable(list);
        writer.addTable(list1);
        // 写出到文件
        writer.flush(FileUtil.file("f:/wordWrite.docx"));
        // 关闭
        writer.close();
    }
}
