package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import po.Apply;
import po.Institution;
import po.User;
import service.AdminService;
import service.InstService;
import util.NumberUtil;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private InstService instService;

    @RequestMapping("admin")
    public String showManager(HttpSession session,Model model){
        if((boolean)session.getAttribute("login")) {
            model.addAttribute("regCount",adminService.getRegCount());
            model.addAttribute("modifyCount",adminService.getModifyCount());
            model.addAttribute("nums",adminService.computeSysStat());
            return "admin/admin";
        }else {
            return "redirect:/index.jsp";
        }
    }

    @RequestMapping("logout")
    public String logout(HttpSession session,Model model){
        session.invalidate();
        return "redirect:/index.jsp";
    }


    @RequestMapping("handleReg")
    public String handleReg(Model model){

        model.addAttribute("regs",adminService.findAllReg());
        return "admin/handleReg";

    }

    @RequestMapping("showReg")
    @ResponseBody
    public Map<String,Object> showReg(String time){
        Map<String,Object> result=new HashMap<>();
        Timestamp createTime=Timestamp.valueOf(time);
        Apply reg=adminService.findRegByTime(createTime);
        result.put("reg",reg);
        return result;
    }

    @RequestMapping("approveReg")
    public String approveReg(int approved,long time,Model model){


        Timestamp createTime=new Timestamp(time);
        adminService.approveReg(createTime,approved);

        String msg="操作成功";
        model.addAttribute("msg",msg);

        model.addAttribute("regs",adminService.findAllReg());
        return "admin/handleReg";
    }

    @RequestMapping("handleModify")
    public String handleModify(Model model){

        model.addAttribute("modifies",adminService.findAllModify());
        return "admin/handleModify";
    }

    @RequestMapping("showModify")
    @ResponseBody
    public Map<String,Object> showModify(String time){
        Map<String,Object> result=new HashMap<>();
        Timestamp createTime=Timestamp.valueOf(time);
        Apply modify=adminService.findModifyByTime(createTime);
        result.put("modify",modify);
        return result;
    }

    @RequestMapping("approveModify")
    public String approveModify(int approved,long time,Model model){

        Timestamp createTime=new Timestamp(time);
        Apply modify=adminService.findModifyByTime(createTime);
        adminService.approveModify(modify,approved);

        String msg="操作成功";
        model.addAttribute("msg",msg);

        model.addAttribute("modifies",adminService.findAllModify());
        return "admin/handleModify";
    }

    @RequestMapping("userStat")
    public String userStat(Model model){

        List<User> users=adminService.findAllUsers();
        for(User user:users){
            user.setBalance(NumberUtil.formatDouble2(user.getBalance()));
            user.setTotal_money(NumberUtil.formatDouble2(user.getTotal_money()));
            user.setCredit(NumberUtil.formatDouble2(user.getCredit()));
        }
        model.addAttribute("users",users);
        return "admin/userStat";
    }

    @RequestMapping("instStat")
    public String instStat(Model model){

        List<Institution> insts=adminService.findAllInsts();
        double[][] nums= new double[insts.size()][6];
        for(int i=0;i<insts.size();i++){
            double[] temp=instService.computeStat(insts.get(i).getEid());
            for(int j=0;j<6;j++){
                nums[i][j]= NumberUtil.formatDouble2(temp[j]) ;
            }
        }
        model.addAttribute("insts",insts);
        model.addAttribute("nums",nums);
        return "admin/instStat";
    }

    @RequestMapping("settleInst")
    public String settleInst(Model model,String eid,double percent){

        System.out.println(eid);
        System.out.println(percent);

        adminService.settleInst(eid,percent);

        List<Institution> insts=adminService.findAllInsts();
        double[][] nums= new double[insts.size()][6];
        for(int i=0;i<insts.size();i++){
            double[] temp=instService.computeStat(insts.get(i).getEid());
            for(int j=0;j<6;j++){
                nums[i][j]=temp[j];
            }
        }
        model.addAttribute("insts",insts);
        model.addAttribute("nums",nums);
        return "admin/instStat";


    }

}

