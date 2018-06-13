package controller;

import mail.MySendMailThread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import po.Institution;
import po.User;
import resultmsg.Result_Inst;
import resultmsg.Result_User;
import service.InstService;
import service.UserService;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;

@Controller
public class LoginAndSignupController {

    @Autowired
    private UserService userService;
    @Autowired
    private InstService instService;


    @RequestMapping("loginUser")
    public String loginUser(Model model){
        model.addAttribute("action","loginUser");
        return "redirect:index.jsp";
    }

    @RequestMapping("loginUserSubmit")
    public String loginUserSubmit(Model model,HttpSession session, String username, String password){

        Result_User res=userService.login(username, password);

        if(res==Result_User.Success) {
            session.setAttribute("username", username);
            return "redirect:user/courses";
        }else if(res==Result_User.NotActived){
            model.addAttribute("msg","您的账号尚未通过邮箱激活，请登录注册邮箱进行激活");
            model.addAttribute("action","loginUser");
        }else if(res==Result_User.Fail){
            model.addAttribute("msg","用户名不存在或密码错误");
            model.addAttribute("action","loginUser");
        }
        return "redirect:index.jsp";
    }

    @RequestMapping("logoutUser")
    public String logoutUser(HttpSession session){
        session.invalidate();
        return "redirect:index.jsp";
    }

    @RequestMapping("signupUser")
    public String signupUser(Model model){
        model.addAttribute("action","signupUser");
        return "redirect:index.jsp";
    }

    @RequestMapping("signupUserSubmit")
    public String signupUserSubmit(Model model,User user){
        if(userService.signup(user)){
            new MySendMailThread(user).start();
        }
        return "redirect:index.jsp";
    }

    @RequestMapping("active")
    public String active(String code){

        userService.active(code);
        return "active";

    }

    @RequestMapping("signupInst")
    public String signupInst(Model model){
        model.addAttribute("action","signupInst");
        return "redirect:index.jsp";
    }

    @RequestMapping("signupInstSubmit")
    public String signupInstSubmit(Model model,String name,String password,String location,String info){


        Institution inst=new Institution();
        String eid=instService.genEid();
        inst.setEid(eid);
        inst.setName(name);
        inst.setPassword(password);
        inst.setLocation(location);
        inst.setInfo(info);
        inst.setApproved(0);
        inst.setSales(0);
        inst.setIncome(0);
        inst.setCreateTime(new Timestamp(System.currentTimeMillis()));

        String msg=null;
        if(instService.addInst(inst)){
            msg="申请成功";
            model.addAttribute("eid",eid);
        }else {
            msg="申请失败";
        }
        model.addAttribute("msg",msg);
        model.addAttribute("action","signupInst");
        return "redirect:index.jsp";
    }


    @RequestMapping("loginInst")
    public String loginInst(Model model){
        model.addAttribute("action","loginInst");
        return "redirect:index.jsp";
    }


    @RequestMapping("loginInstSubmit")
    public String loginInstSubmit(HttpSession session,Model model,String eid,String password){

        Result_Inst result=instService.login(eid,password);

        String msg=null;
        if(result==Result_Inst.Fail){
            msg="编号不存在或密码错误";
        }else if(result==Result_Inst.NotApproved){
            msg="机构申请未通过审批";
        }else if(result==Result_Inst.Unsolved){
            msg="机构申请在审批中，请耐心等待";
        }else {
            session.setAttribute("eid",eid);
            return "redirect:inst/courses";
        }

        model.addAttribute("action","loginInst");
        model.addAttribute("msg",msg);
        return "redirect:index.jsp";
    }

    @RequestMapping("loginManager")
    public String loginManager(Model model){
        model.addAttribute("action","loginManager");
        return "redirect:index.jsp";
    }

    @RequestMapping("loginManagerSubmit")
    public String loginManager(HttpSession session,Model model,String username,String password){

        if(username.equals("admin")&&password.equals("123")){
            session.setAttribute("login",true);
            return "redirect:admin/admin";
        }else {
            String msg="账号或密码错误";
            model.addAttribute("msg",msg);
            model.addAttribute("action","loginManager");
            return "redirect:index.jsp";
        }
    }



//    @RequestMapping("editUserSubmit")
//    public String editUserSubmit(Model model,@ModelAttribute User user,MultipartFile pictureFile){
//
//        model.addAttribute("id",user.getId());
//
//
//
//
//        //进行图片的上传
//        if (pictureFile!=null&&pictureFile.getName()!=null&&pictureFile.getName().length()>0)
//        {
//            //图片上传成功后，将图片的地址写到数据库
//            String filePath="/Users/wsy/pic/";//它的值要同你设置虚拟目录时涉及的目录路径一致，
//            String originalFilename=pictureFile.getOriginalFilename();
//            System.out.println(originalFilename);
//
//            String newFileName= UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
//
//            //新文件
//            File file=new File(filePath+newFileName);
//
//            //将内存中的文件写入磁盘
//            try {
//                pictureFile.transferTo(file);
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//
//            //图片上传成功
//            user.setPic(newFileName);
//            userService.updateUser(user);
//            System.out.println(user);
//        }
//
//
//        return "redirect:findUserList.action";
//    }




}
