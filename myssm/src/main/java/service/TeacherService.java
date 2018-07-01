package service;

import java.util.List;

public interface TeacherService {

    /**
     * 查找课程相关的老师
     * @param cid 课程id
     * @return 老师的名字列表
     */
    List<String> findTeacher(String cid);
}
