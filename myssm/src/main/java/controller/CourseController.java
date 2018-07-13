package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pobject.Course;
import service.CourseService;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService courseService;


    @RequestMapping("/showInfo")
    public String showInfo(HttpSession session,String cid,Model model){

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

        System.out.println(cid);

        Course course=new Course();
        course.setSort("大学考试");
        course.setGrade("英语考级");
        course.setSubject("英语");
        course.setCname("四级基础强化全程班（精品）");
        course.setTime("每天08:00-10:00,10:30-12:30（7月26日，8月1日休息，7月24日，7月25日上课时间08:00-10:00,10:30-12:30；13:30-15:30，8月4日上课时间08:00-10:00,10:30-12:30；13:30-15:30，16:00-18:00））");
        course.setLocation("天马301教室");
        course.setSummary("以高一上学期的英语重点、难点知识为载体，利用优能独特的教学法，通过深入浅出的讲解帮助学员在高中开始阶段继续保持并养成好的学习习惯。享受独到的优能中学生服务体系。拔高的课后训练体系，名师全程关注学员进步程度。更多的增值服务等待学员家长来亲身体验。");
        course.setCrowd("1、英语成绩优秀的的新高一学员 2、想学习高一上学期重点难点的知识学生 3、想冲击顶尖名校");
        course.setGoal("全程辅导计划，一次报名就可以针对四级学习的不同阶段，大幅提高学习的效率并最终取得考试的好成绩。");
        course.setContent("该课程分四大板块： 1. 词汇：精选新概念二册和三册的高分词汇80个，用轻松诙谐的串联记忆法，结合科学严谨的构词法实现学生词汇量的积累和突破，增强理解和构词能力。如第一课一文词汇：considerable; punctually; astond均可替换常见的big; on time; surprise。 2. 句型：学习亮点高分句型20句，背诵并运用在高一月考、期中期末考常见写作真题中，综合提升写作能力。 3. 课文：学习并剖析新概念三和册新概念二册的经典课文（新概念二册:L49/52/54/58/73/75/77/78/85 新概念三册:L16/19），拓展写作高分模板，如 课文的写作思路：开头段立论，交代作者观点；其次，进一步举例解释观点；最后详细阐述论证观点，原汁原味还原符合西方人的写作思维和习惯。 4. 语法：主要学习定从和时态语态，融汇新高考新题型和四大名校入学测试题，帮助学生在考试中把握考点，快速提分。 学员学完该课程后，暑假可续报读高一英语秋季尖子班");
        try {
            course.setStartTime(sdf.parse("2017-08-09"));
            course.setEndTime(sdf.parse("2017-09-09"));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        model.addAttribute("course",course);
        model.addAttribute("requestUrl","http://localhost:8080/course/showInfo?cid="+cid);

        return "course";

    }

    @RequestMapping("findByName")
    @ResponseBody
    public List<String> findByName(String cname){

        List<Course> courses=courseService.findCourseByName(cname);

        List<String> strs=new ArrayList<>();
        for(Course course:courses){
            strs.add(course.getCname());
        }

        return strs;

    }


    @RequestMapping("showInfoByName")
    public String showInfoByName(HttpSession session,String cname,Model model){

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

        System.out.println(cname);
        Course course=courseService.findCourseByName(cname).get(0);

        model.addAttribute("course",course);
        model.addAttribute("requestUrl","http://localhost:8080/course/showInfoByName?cname="+cname);

        return "course";

    }
}
