package com.hnhg.tr1913.programme.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hnhg.tr1913.programme.entity.admin.Role;

/**
 * 角色role service
 * @author llq
 *
 */
@Service
public interface RoleService {
	public int add(Role role);
	public int edit(Role role);
	public int delete(Long id);
	public List<Role> findList(Map<String, Object> queryMap);
	public int getTotal(Map<String, Object> queryMap);
	public Role find(Long id);
}
