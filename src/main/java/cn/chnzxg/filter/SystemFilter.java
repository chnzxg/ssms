package cn.chnzxg.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by Administrator on 2018/5/2.
 */
@WebFilter(filterName = "SystemFilter")
public class SystemFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
