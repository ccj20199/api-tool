package com.winning.api.apitooldao;

import com.winning.api.apitoolentity.EmployeesPO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/19 10:17
 */
@Repository
public interface EmployeesRepository  extends JpaRepository<EmployeesPO,String> {


    @Query("select  po from EmployeesPO po where po.empid in (?1)")
    List<EmployeesPO> listByEmpids(List<String> createByIds);
}
