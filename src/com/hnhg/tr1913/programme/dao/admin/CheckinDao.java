package com.hnhg.tr1913.programme.dao.admin;
import java.util.List;
import java.util.Map;

/**
 * 入住dao
 */
import org.springframework.stereotype.Repository;

import com.hnhg.tr1913.programme.entity.admin.Checkin;

@Repository
public interface CheckinDao {
	public int add(Checkin checkin);
	public int edit(Checkin checkin);
	public int delete(Long id);
	public List<Checkin> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public Checkin find(Long id);
	public List<Map> getStatsByMonth();
	public List<Map> getStatsByDay();
}
