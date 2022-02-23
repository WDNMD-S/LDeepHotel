package com.hnhg.tr1913.programme.service;
/**
 * 房型service
 */
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hnhg.tr1913.programme.entity.RoomType;

@Service
public interface RoomTypeService {
	public int add(RoomType roomType);
	public int edit(RoomType roomType);
	public int delete(Long id);
	public List<RoomType> findList(Map<String, Object> queryMap);
	public List<RoomType> findAll();
	public Integer getTotal(Map<String, Object> queryMap);
	public RoomType find(Long id);
	public int updateNum(RoomType roomType);
}