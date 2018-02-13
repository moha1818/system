package com.moha.demo.controller;

import com.moha.demo.entity.AsFunction;
import com.moha.demo.entity.AsRole;
import com.moha.demo.entity.AsSystemconfig;
import com.moha.demo.entity.AsUser;
import com.moha.demo.service.AsFunctionService;
import com.moha.demo.service.AsRolePremissionService;
import com.moha.demo.service.AsRoleService;
import com.moha.demo.service.AsSystemconfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RoleController extends BaseController{

    @Autowired
    private AsRoleService asRoleService;
    @Autowired
    private AsRolePremissionService asRolePremissionService;
    @Autowired
    private AsFunctionService asFunctionService;
    @Autowired
    private AsSystemconfigService asSystemconfigService;

    @RequestMapping(value = "/rolema")
    public String rolema(Model model) {
        List<AsRole> rolemalist = asRoleService.list();
        model.addAttribute("rolemalist",rolemalist);
        return "/role/rolema";
    }

    @RequestMapping(value = "/addRole",method = RequestMethod.POST)
    public String addRole(AsRole role,String roleName,Integer isStart) throws Exception {
        AsUser user = getCurrUser();
        try {
            role.setCreatedBy(user.getUserCode());
            role.setCreationTime(new Date());
            role.setLastUpdateTime(new Date());
            role.setIsStart(isStart);
            role.setRoleName(roleName);
            asRoleService.addRole(role);
            return "redirect;/rolema";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect;/rolema";
        }
    }

    @RequestMapping(value = "/modifyRole",method = RequestMethod.POST)
    public String modifyRole(AsRole role,String roleName,Integer id,Integer isStart){
        role.setIsStart(isStart);
        role.setRoleName(roleName);
        role.setId(id);
        asRoleService.modifyRole(role);
        return "redirect;/rolema";
    }

    //删除角色
    @RequestMapping(value = "/delRole")
    public String delRole(Integer id){
        AsRole role = new AsRole();
        role.setId(id);
        asRoleService.delRole(role.getId());
        return "redirect;/rolema";
    }

    //单个角色
    @RequestMapping(value = "/selectRole")
    @ResponseBody
    public Map<String, Object> selectRole(Model model,Integer id){
        Map<String, Object> msg = new HashMap<>();
        try {
            AsRole role=asRoleService.selectRole(id);
            msg.put("role", role);
        } catch (Exception e) {
            msg.put("info","error");
            e.printStackTrace();
        }

        return msg;
    }

    @RequestMapping(value = "/roleau")
    public String roleau(Model model){
        List<AsRole> rolemalist = asRoleService.list();
        model.addAttribute("rolemalist",rolemalist);
        return "/role/roleau";
    }

    @RequestMapping(value = "/featurelist")
    public String featurelist(Integer roleid,Model model){
        List<Integer> role_premission = asRolePremissionService.role_premissions(roleid);
        model.addAttribute("role_premission",role_premission);
        List<AsFunction> featurelist = asFunctionService.list();
        model.addAttribute("featurelist",featurelist);
        return "/role/featurelist";
    }

    @RequestMapping(value = "/permission")
    public String permission(Integer roleid,List<Integer> permission) throws Exception {
        AsUser user = getCurrUser();
        asRolePremissionService.updatePremission(roleid,permission,user);
        return "/role/jump";
    }

    @RequestMapping(value = "/financial")
    @ResponseBody
    public List<AsSystemconfig> prepare() throws Exception {
        List<AsSystemconfig> systemconfigs = asSystemconfigService.systemconfigs();
        return systemconfigs;
    }
}
