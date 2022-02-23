package com.hnhg.tr1913.programme.dao;
import java.util.List;
import java.util.Map;

/**
 * 预定订单dao
 */
import org.springframework.stereotype.Repository;

import com.hnhg.tr1913.programme.entity.BookOrder;

@Repository
public interface BookOrderDao {
	public int add(BookOrder bookOrder);
	public int edit(BookOrder bookOrder);
	public int delete(Long id);
	public List<BookOrder> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public BookOrder find(Long id);
	public int cancel(Long id);
}
