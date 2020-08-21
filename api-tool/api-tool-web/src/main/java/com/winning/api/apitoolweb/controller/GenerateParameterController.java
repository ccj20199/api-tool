package com.winning.api.apitoolweb.controller;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.winning.api.apitoolcommon.Attr;
import com.winning.api.apitoolcommon.BusinessException;
import com.winning.api.apitoolcommon.ResponseResult;
import com.winning.api.apitoolservice.enumpack.DataTypeCode;
import com.winning.api.apitoolservice.generateparameter.GenerateParameterServiceImpl;
import com.winning.api.apitoolservice.vo.generateparameter.GenerateApiParameter;
import com.winning.api.apitoolservice.vo.generateparameter.GenerateParameterInputVO;
import com.winning.api.apitoolweb.contant.ApiPathConstant;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/20 16:24
 */
@RestController
@Api(tags = "生成DTO")
@AllArgsConstructor
public class GenerateParameterController {

    private final GenerateParameterServiceImpl generateParameterService;

    @ApiOperation(nickname = "入参和出参生成 DTO", value = "入参和出参生成 DTO")
    @PostMapping(ApiPathConstant.GENERATE_PARAMETER_DTO)
    public ResponseResult generateParameterDto(@Valid @RequestBody GenerateParameterInputVO inputVO) {
        Map<String, Map<String, Object>> mapMap = generateParameterService.generateParameterDto(inputVO);
        Map<String,Object> resultMap=Maps.newHashMap();
        String path = GenerateParameterController.class.getResource("/").getPath()+"template";
        Configuration cfg = new Configuration();
        try {
            cfg.setDirectoryForTemplateLoading(new File(path));
            Template template = cfg.getTemplate("/javaBean.ftl");
            mapMap.forEach((key, root) -> {

                StringWriter out = new StringWriter();
                try {
                    template.process(root, out);
                } catch (TemplateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                resultMap.put(key+".java",out.toString());
            });
        } catch (Exception e) {
            e.printStackTrace();
        }


        return ResponseResult.success(resultMap);
    }

}
