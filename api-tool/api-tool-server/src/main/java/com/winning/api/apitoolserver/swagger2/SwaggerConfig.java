package com.winning.api.apitoolserver.swagger2;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/8 9:10
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig   {


    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.winning.api.apitoolweb.controller"))
                .paths(PathSelectors.any())
                .build();
    }
        private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title(" 产品接口文档")
                .description("api-tool管理平台")
                .version("1.0")
                .build();
    }

}
