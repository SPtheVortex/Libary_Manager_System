package com.sp.filter;

import com.sp.utils.PathKit;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

public class UserFilter implements Filter {
    String[] excludeurls = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 读取xml中excludeUrl参数，并转化为HashSet /login.jsp,/login,/**.css
        String excludeUrl = filterConfig.getInitParameter("excludeUrl");
        String[] split = excludeUrl.split(",");
        excludeurls = split;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain
            chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        if (!PathKit.isMatchs(req.getServletPath(), excludeurls)) {//如果是需要拦截的接⼝--->则拦截
            HttpSession session = req.getSession();
            Map<String, Object> userInfo = (Map<String, Object>)
                    session.getAttribute("admin");
            if (null == userInfo) { //如果获取不到⽤户信息就跳转到登录⻚⾯
                resp.sendRedirect(req.getContextPath() + "/login.jsp");
                return;
            }
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}