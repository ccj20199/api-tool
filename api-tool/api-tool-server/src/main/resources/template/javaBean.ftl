
import java.util.List;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(value = "${className}",description = "")
public class ${className}DTO {
<#list attrs as attr>
    @ApiModelProperty(value = "",required = true,position = ${(attr_index+1)*10})
    private ${attr.type} ${attr.field};
</#list>

}
