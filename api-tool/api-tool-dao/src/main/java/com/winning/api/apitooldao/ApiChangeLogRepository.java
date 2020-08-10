package com.winning.api.apitooldao;


import com.winning.api.apitoolentity.ApiChangeLogPO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/7/29 16:46
 */
@Repository
public interface ApiChangeLogRepository  extends JpaRepository<ApiChangeLogPO,Long> {
}
