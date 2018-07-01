package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/client")
public class ClientController {


    @RequestMapping("login")
    public String login(HttpSession session,String username,String password,String requestUrl){

        System.out.println(username+" "+password);

        session.setAttribute("username",username);

        if(requestUrl!=null)
            return "redirect:"+requestUrl;
        else
            return "redirect:http://localhost:8080/";

    }

    @RequestMapping("logout")
    public String logout(HttpSession session){

        session.invalidate();
        return "redirect:http://localhost:8080/";
    }

    @RequestMapping("register")
    public String register(String username,String password,String email,String requestUrl){

        System.out.println(username+" "+password+" "+email);

        if(requestUrl!=null)
            return "redirect:"+requestUrl;
        else
            return "redirect:http://localhost:8080/";
    }
}
