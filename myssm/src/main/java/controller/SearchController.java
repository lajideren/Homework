package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pobject.Course;
import service.CourseService;
import util.SubjectUtil;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/getCourseList")
    public String getCourseList(Model model, String sort, String grade, String subject){

        String s = SubjectUtil.getSort(sort);
        String g = SubjectUtil.getGrade(sort, grade);
        String sub = SubjectUtil.getSubject(sort, grade, subject);

        List<Course> courses = courseService.findCourse(s, g, sub, 1, 9);

        int maxPage = courseService.findCoursePageCount(s, g, sub, 9);

        model.addAttribute("courses", courses);
        model.addAttribute("sort", sort);
        model.addAttribute("grade", grade);
        model.addAttribute("subject", subject);
        model.addAttribute("page", 1);
        model.addAttribute("max", maxPage);
        return "search";
    }

    @RequestMapping("/changePage")
    public String changePage(Model model, String sort, String grade, String subject, int page){
        String s = SubjectUtil.getSort(sort);
        String g = SubjectUtil.getGrade(sort, grade);
        String sub = SubjectUtil.getSubject(sort, grade, subject);

        List<Course> courses = courseService.findCourse(s, g, sub, page, 9);
        int maxPage = courseService.findCoursePageCount(s, g, sub, 9);

        model.addAttribute("courses", courses);
        model.addAttribute("sort", sort);
        model.addAttribute("grade", grade);
        model.addAttribute("subject", subject);
        model.addAttribute("page", page);
        model.addAttribute("max", maxPage);
        return "search";
    }
}
