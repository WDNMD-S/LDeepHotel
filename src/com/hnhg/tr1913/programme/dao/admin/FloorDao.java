package com.hnhg.tr1913.programme.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hnhg.tr1913.programme.entity.admin.Floor;

/**
 * 楼层dao
 * @author Administrator
 *
 */
@Repository
public interface FloorDao {
	public int add(Floor floor);
	public int edit(Floor floor);
	public int delete(Long id);
	public List<Floor> findList(Map<String, Object> queryMap);
	public List<Floor> findAll();
	public Integer getTotal(Map<String, Object> queryMap);
}
