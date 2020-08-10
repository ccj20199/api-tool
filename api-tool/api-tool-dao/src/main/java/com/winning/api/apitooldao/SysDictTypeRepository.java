package com.winning.api.apitooldao;


import com.winning.api.apitoolentity.SysDictTypePO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/7/27 16:40
 */
@Repository
public interface SysDictTypeRepository  extends JpaRepository<SysDictTypePO,Long> {
}
