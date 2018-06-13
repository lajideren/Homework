package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import po.*;
import service.InstService;
import service.UserService;
import util.LevelUtil;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/inst")
public class InstController {

    @Autowired
    private InstService instService;
    @Autowired
    private UserService userService;

    @RequestMapping("plan")
    public String plan(HttpSession session,Model model){

        String eid=(String)session.getAttribute("eid");
        model.addAttribute("inst",instService.findInstByEid(eid));

        return "inst/plan";
    }

    @RequestMapping("planSubmit")
    @ResponseBody
    public Map<String,Object> planSubmit(HttpSession session, Model model, Course course,String[] teacher,String[] location ){

        String eid=(String)session.getAttribute("eid");
        model.addAttribute("inst",instService.findInstByEid(eid));

        course.setEid(eid);
        instService.addCourse(course);

        int cid=course.getCid();
        for(int i=0;i<teacher.length;i++){
            instService.addSection(new Section(-1,cid,teacher[i],location[i],0,course.getNumber(),i+1));
        }

        Map<String,Object> result=new HashMap<>();
        result.put("msg","发布成功");

        return result;


    }

    @RequestMapping("editInfo")
    public String editInfo(HttpSession session,Model model){

        String eid=(String)session.getAttribute("eid");
        model.addAttribute("inst",instService.findInstByEid(eid));

        return "inst/editInfo";
    }

    @RequestMapping("editInfoSubmit")
    @ResponseBody
    public Map<String,Object> editInfoSubmit(HttpSession session,String name,String location,String info){

        Institution inst=new Institution();
        inst.setEid((String)session.getAttribute("eid"));
        inst.setName(name);
        inst.setLocation(location);
        inst.setInfo(info);
        inst.setApproved(0);
        inst.setCreateTime(new Timestamp(System.currentTimeMillis()));


        Map<String,Object> result=new HashMap<>();

        if(instService.addInstModify(inst)){
            result.put("msg","申请成功，等待审批");
        }else {
            result.put("msg","申请失败");
        }

        return result;
    }

    @RequestMapping("orders")
    @ResponseBody
    public Map<String,Object> orders(Integer pageNum){

        Map<String,Object> data=new HashMap<>();
        data.put("pageCount",instService.findOrderCount(5));
        if(pageNum==null){
            pageNum=1;
        }else {
            System.out.println("pageNum:"+pageNum);
        }
        data.put("orders",instService.findOrder(pageNum,5));

        return data;

    }

    @RequestMapping("courses")
    public String courses(HttpSession session,Model model,Boolean started){

        String eid=(String)session.getAttribute("eid");
        model.addAttribute("inst",instService.findInstByEid(eid));
        model.addAttribute("courses",instService.findCourseByEid(eid));
        model.addAttribute("started",started);

//        System.out.println(started);

        return "inst/courses";

    }

    @RequestMapping("sections")
    public String sections(HttpSession session,Model model,int cid){

        String eid=(String)session.getAttribute("eid");
        model.addAttribute("inst",instService.findInstByEid(eid));

        List<Section> sections=userService.findSectionByCid(cid);
        Course course=userService.findCourseByCid(cid);

        if(course.getStart_time().getTime()>System.currentTimeMillis()){
            model.addAttribute("started",false);
        }else {
            model.addAttribute("started",true);
        }

        model.addAttribute("sections",sections);

        model.addAttribute("course",course);




        return "inst/sections";

    }

    @RequestMapping("checkUser")
    @ResponseBody
    public Map<String,Object> checkUser(String username){

        User user=instService.findUser(username);
        Map<String,Object> result=new HashMap<>();
        if(user==null){
            return result;
        }
        int level= LevelUtil.getLevel(user.getTotal_money());

        result.put("level",level);

        return result;


    }

    @RequestMapping("addOrder")
    public String addOrder(HttpSession session,Model model,String[] members,int cid,int sid,String username){

        String eid=(String)session.getAttribute("eid");

        instService.addOrder(members,cid,sid,username,eid);



        model.addAttribute("inst",instService.findInstByEid(eid));

        List<Section> sections=userService.findSectionByCid(cid);
        Course course=userService.findCourseByCid(cid);

        if(course.getStart_time().getTime()>System.currentTimeMillis()){
            model.addAttribute("started",false);
        }else {
            model.addAttribute("started",true);
        }

        model.addAttribute("sections",sections);

        model.addAttribute("course",course);

        model.addAttribute("msg","预订成功");


        return "inst/sections";



    }

    @RequestMapping("members")
    public String members(HttpSession session,Model model,int sid,int cid){

//        System.out.println("hhhhhhhh");
//        System.out.println(sid+" "+cid);

        String eid=(String)session.getAttribute("eid");
        model.addAttribute("inst",instService.findInstByEid(eid));


        model.addAttribute("sid",sid);
        model.addAttribute("cid",cid);

        List<Member> members=instService.findMemberBySid(sid);
        model.addAttribute("members",members);

//        for(Member member:members){
//            System.out.println(member);
//        }

        return "inst/members";
    }


    @RequestMapping("saveGrade")
    public String saveGrade(HttpSession session,Model model,int sid,int cid,int[] grade){

//        System.out.println(sid);
//        System.out.println(cid);
//        for(int temp:grade){
//            System.out.println(temp);
//        }
        List<Member> members=instService.findMemberBySid(sid);

        for(int i=0;i<members.size();i++){
            instService.setMemberGrade(cid,members.get(i).getUsername(),grade[i]);
        }


        String eid=(String)session.getAttribute("eid");
        model.addAttribute("inst",instService.findInstByEid(eid));


        model.addAttribute("sid",sid);
        model.addAttribute("cid",cid);


        return "forward:members";

    }

    @RequestMapping("stat")
    public String stat(HttpSession session,Model model){

        String eid=(String)session.getAttribute("eid");
        model.addAttribute("inst",instService.findInstByEid(eid));

        double[] num=instService.computeStat(eid);
        model.addAttribute("num",instService.computeStat(eid));

        return "inst/stat";
    }


}
