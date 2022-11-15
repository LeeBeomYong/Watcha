package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.UserDAO;

public class AdminRecovery implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String id = request.getParameter("id");

        UserDAO dao = UserDAO.getInstance();
        dao.updateAdmin(id);
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("admin_member_list.do");
        return forward;
    }

}