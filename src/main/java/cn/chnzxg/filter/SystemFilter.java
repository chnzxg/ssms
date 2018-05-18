package cn.chnzxg.filter;

import cn.chnzxg.entity.Admin;
import cn.chnzxg.entity.Power;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

/**
 * Created by Administrator on 2018/5/2.
 */
@WebFilter(filterName = "SystemFilter")
public class SystemFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession();

        String purl = request.getParameter("purl");
        if (purl == null || Objects.equals("", purl)) {
            chain.doFilter(request, response);
            return ;
        }

        Admin admin = (Admin) session.getAttribute("user");
        if (admin == null) {
            request.getRequestDispatcher(request.getContextPath() + "/view/login.jsp").forward(request, response);
            return;
        }

        List<Power> powers = admin.getPower();

        boolean flag = false;
        for (Power power : powers) {
            if (power.getPurl().equals(purl)) {
                flag = true;
                break;
            }
        }

        if (!flag) {
            request.getRequestDispatcher(request.getContextPath() + "/view/forbidden.jsp").forward(request, response);
        }

        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
