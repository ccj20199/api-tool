package com.winning.api.apitoolentity;

import lombok.Data;

import javax.persistence.*;

/**
 * <p>api-tool</p>
 *业务域信息
 * @author cq
 * @Description
 * @date 2020/7/27 14:48
 */
@Entity
@Data
@Table(name="BUSINESS_DOMAIN_INFORMATION")
public class BusinessDomainInformationPO {

    /**
     * 代码仓库标识
     */
    @Id
    @Column(name = "BUSINESS_DOMAIN_ID")
    private Long businessDomainId;

    /**
     * 业务域编码
     */
    @Basic
    @Column(name = "BUSINESS_DOMAIN_REPOSITORY_NO")
    private String businessDomainRepositoryNo;

    /**
     * 业务域名称
     */
    @Basic
    @Column(name = "BUSINESS_DOMAIN_NAME")
    private String businessDomainName;

    @Basic
    @Column(name = "BUSINESS_DOMAIN_KEY_WORD")
    private String businessDomainKeyWord;

    @Basic
    @Column(name = "BUSINESS_DOMAIN_GROUP_NAME")
    private String businessDomainGroupName;
}
