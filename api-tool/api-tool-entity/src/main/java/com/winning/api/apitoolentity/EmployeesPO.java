package com.winning.api.apitoolentity;

import lombok.Data;

import javax.persistence.*;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/19 10:11
 */
@Entity
@Data
@Table(name="Employees")
public class EmployeesPO {

    /**
     * empid
     */
    @Id
    @Column(name = "empid")
    private String empid;

    /**
     * empname
     */
    @Basic
    @Column(name = "empname")
    private String empname;

    /**
     * emppwd
     */
    @Basic
    @Column(name = "emppwd")
    private String emppwd;

    /**
     * sex
     */
    @Basic
    @Column(name = "sex")
    private String sex;

    /**
     * birthday
     */
    @Basic
    @Column(name = "birthday")
    private String birthday;

    /**
     * yddh
     */
    @Basic
    @Column(name = "yddh")
    private String yddh;



}
