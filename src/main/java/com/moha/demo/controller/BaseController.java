package com.moha.demo.controller;

import com.moha.demo.entity.AsUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BaseController {
    @Autowired
    private HttpServletRequest req;

    @ModelAttribute("user")
    public AsUser getCurrUser() throws Exception {
        return (AsUser)req.getSession().getAttribute("user");
    }
}
