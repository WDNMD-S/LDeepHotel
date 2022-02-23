package com.hnhg.tr1913.programme.controller.home;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hnhg.tr1913.programme.entity.Account;
import com.hnhg.tr1913.programme.service.AccountService;
import com.hnhg.tr1913.programme.service.RoomTypeService;

/**
 * 前台首页控制器
 * 
 * @author Administrator
 *
 */
@RequestMapping("/home")
@Controller
public class HomeController {

	@Autowired
	private RoomTypeService roomTypeService;
	@Autowired
	private AccountService accountService;

	/**
	 * 前台首页
	 * 
	 * @param model
	 * @param name
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView model, @RequestParam(name = "name", defaultValue = "") String name) {
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 999);
		model.addObject("roomTypeList", roomTypeService.findList(queryMap));
		model.setViewName("home/index/index");
		model.addObject("kw", name);
		return model;
	}

	/**
	 * 登录页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView model) {
		model.setViewName("home/index/login");
		return model;
	}
	
	

	/**
	 * 注册页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/reg", method = RequestMethod.GET)
	public ModelAndView reg(ModelAndView model) {
		model.setViewName("home/index/reg");
		return model;
	}

	/**
	 * 登录信息提交
	 * 
	 * @param account
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> loginAct(Account account, String vcode, HttpServletRequest request) {
		Map<String, String> retMap = new HashMap<String, String>();
		if (account == null) {
			retMap.put("type", "error");
			retMap.put("msg", "请填写正确的用户信息！");
			return retMap;
		}
		if (StringUtils.isEmpty(account.getName())) {
			retMap.put("type", "error");
			retMap.put("msg", "用户名不能为空！");
			return retMap;
		}
		if (StringUtils.isEmpty(account.getPassword())) {
			retMap.put("type", "error");
			retMap.put("msg", "密码不能为空！");
			return retMap;
		}
		if (StringUtils.isEmpty(vcode)) {
			retMap.put("type", "error");
			retMap.put("msg", "验证码不能为空！");
			return retMap;
		}
		Object attribute = request.getSession().getAttribute("accountLoginCpacha");
		if (attribute == null) {
			retMap.put("type", "error");
			retMap.put("msg", "验证码过期，请刷新！");
			return retMap;
		}
		if (!vcode.equalsIgnoreCase(attribute.toString())) {
			retMap.put("type", "error");
			retMap.put("msg", "验证码错误！");
			return retMap;
		}
		Account findAccount = accountService.findByName(account.getName());
		if (findAccount == null) {
			retMap.put("type", "error");
			retMap.put("msg", "用户名不存在！");
			return retMap;
		}
		if (!account.getPassword().equals(findAccount.getPassword())) {
			retMap.put("type", "error");
			retMap.put("msg", "密码错误！");
			return retMap;
		}
		if (findAccount.getStatus() == -1) {
			retMap.put("type", "error");
			retMap.put("msg", "该用户已被禁用，请联系管理员！");
			return retMap;
		}
		request.getSession().setAttribute("account", findAccount);
		request.getSession().setAttribute("accountLoginCpacha", null);
		retMap.put("type", "success");
		retMap.put("msg", "登录成功！");
		return retMap;
	}

	/**
	 * 注册信息提交
	 * 
	 * @param account
	 * @return
	 */
	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> regAct(Account account) {
		Map<String, String> retMap = new HashMap<String, String>();
		if (account == null) {
			retMap.put("type", "error");
			retMap.put("msg", "请填写正确的用户信息！");
			return retMap;
		}
		if (StringUtils.isEmpty(account.getName())) {
			retMap.put("type", "error");
			retMap.put("msg", "用户名不能为空！");
			return retMap;
		}
		if (StringUtils.isEmpty(account.getPassword())) {
			retMap.put("type", "error");
			retMap.put("msg", "密码不能为空！");
			return retMap;
		}
		if (StringUtils.isEmpty(account.getMobile())) {
			retMap.put("type", "error");
			retMap.put("msg", "手机号不能为空！");
			return retMap;
		}
		if (isExist(account.getName())) {
			retMap.put("type", "error");
			retMap.put("msg", "该用户名已经存在！");
			return retMap;
		}
		if (accountService.add(account) <= 0) {
			retMap.put("type", "error");
			retMap.put("msg", "注册失败，技术问题，请联系管理员！");
			return retMap;
		}
		retMap.put("type", "success");
		retMap.put("msg", "注册成功！");
		return retMap;
	}

	/**
	 * 退出登录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().setAttribute("account", null);
		return "redirect:login";
	}

	/**
	 * 查询是否存在该用户
	 * @param name 用户名
	 * @return
	 */
	private boolean isExist(String name) {
		Account account = accountService.findByName(name);
		if (account == null) {
			return false;
		}
		return true;
	}
}
