package com.hnhg.tr1913.programme.service.admin;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hnhg.tr1913.programme.entity.admin.Authority;

/**
 * 权限service接口
 * @author llq
 *
 */
@Service
public interface AuthorityService {
	public int add(Authority authority);
	public int deleteByRoleId(Long roleId);
	public List<Authority> findListByRoleId(Long roleId);
}
