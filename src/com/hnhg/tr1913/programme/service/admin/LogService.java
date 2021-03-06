package com.hnhg.tr1913.programme.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hnhg.tr1913.programme.entity.admin.Log;

/**
 * 日志接口
 * @author llq
 *
 */
@Service
public interface LogService {
	public int add(Log log);
	public int add(String content);
	public List<Log> findList(Map<String, Object> queryMap);
	public int getTotal(Map<String, Object> queryMap);
	public int delete(String ids);
}
