package com.winning.api.apitoolweb.controller;

import com.google.common.collect.Lists;
import com.winning.api.apitoolcommon.BusinessException;
import com.winning.api.apitoolcommon.ResponseResult;
import com.winning.api.apitoolservice.generateparameter.GenerateParameterServiceImpl;
import com.winning.api.apitoolservice.vo.generateparameter.GenerateDTO;
import com.winning.api.apitoolservice.vo.generateparameter.GenerateParameterInputVO;
import com.winning.api.apitoolservice.vo.generateparameter.GenerateParameterOutVO;
import com.winning.api.apitoolweb.contant.ApiPathConstant;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

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
@Slf4j
public class GenerateParameterController {

    private final GenerateParameterServiceImpl generateParameterService;

    @ApiOperation(nickname = "入参和出参生成 DTO", value = "入参和出参生成 DTO")
    @PostMapping(ApiPathConstant.GENERATE_PARAMETER_DTO)
    public ResponseResult generateParameterDto(@Valid @RequestBody GenerateParameterInputVO inputVO) {
        List<GenerateDTO> generateDTOS = generateParameterService.generateParameterDto(inputVO);
        List<GenerateParameterOutVO> result= Lists.newArrayList();
        try {
            // 创建配置实例
            Configuration configuration = new Configuration();

            // 设置编码
            configuration.setDefaultEncoding("UTF-8");
            // 设置处理空值
            configuration.setClassicCompatible(true);
            configuration.setClassForTemplateLoading(GenerateParameterController.class,"/template");
            // 获取模板
            Template template = configuration.getTemplate("javaBean.ftl");
            generateDTOS.forEach(dto -> {

                StringWriter out = new StringWriter();
                try {
                    template.process(dto.getMap(), out);
                } catch (TemplateException e) {
                    throw new BusinessException("异常信息："+e.getMessage());
                } catch (IOException e) {
                    throw new BusinessException("异常信息："+e.getMessage());
                }
                GenerateParameterOutVO outVO=new GenerateParameterOutVO();
                outVO.setClassName(dto.getClassName()+".java");
                outVO.setContent(out.toString());
                result.add(outVO);
            });
        } catch (Exception e) {
            throw new BusinessException("异常信息："+e.getMessage());
        }


        return ResponseResult.success(result);
    }

}
