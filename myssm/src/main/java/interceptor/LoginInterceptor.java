//package interceptor;
//
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//public class LoginInterceptor implements HandlerInterceptor {
//
//
//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
//
//        String url=request.getRequestURI();
//        //判断是否是公开地址
//        //世纪开发中需要将公开地址配置在配置文件中
//
//        if (url.contains("login.action"))
//        {
//            //如果是公开地址则放行
//            return true;
//        }
//
//        //判断用户身份在session中是否存在
//        HttpSession session=request.getSession();
//        String username= (String) session.getAttribute("username");
//
//        if(username!=null){
//            return true;
//        }
//
//        //执行到这里就拦截，跳转到登陆页面，用户进行登陆
//        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
//
//        return false;
//
//    }
//
//    @Override
//    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
//
//    }
//
//    @Override
//    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
//
//    }
//}
