
import java.util.List;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
@Data
@ApiModel(value = "${className}",description = "")
public class ${className}DTO {

<#list attrs as attr>
    <#if attr.requiredCode=='1'>
        <#if attr.dataTypeCode=='1'>
    @NotEmpty(message ="${attr.name}不为空" )
        <#else >
    @NotNull(message = "${attr.name}不为空")
        </#if>
    </#if>
    @ApiModelProperty(value = "${attr.name}",required = true,position = ${(attr_index+1)*10})
    private ${attr.type} ${attr.field};

</#list>

}
