import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:outland/model/teacher_model.dart';
import 'package:outland/util/constants.dart';

import '../../model/course_model.dart';


class CourseProvider with ChangeNotifier, DiagnosticableTreeMixin {

  List<TeacherModel> _listTeacherModel = [];
  List<TeacherModel> get listTeacherModel => _listTeacherModel;

  List<CourseModel> _listCourseModel = [];
  List<CourseModel> get listCourseModel => _listCourseModel;

  TeacherModel? _teacherModel;
  TeacherModel? get teacherModel => _teacherModel;

  CourseModel? _courseModel;
  CourseModel? get courseModel => _courseModel;

  int _indexTeacher = 0;
  int get indexTeacher => _indexTeacher;

  int _indexCourse = 0;
  int get indexCourse => _indexCourse;

  void setListTeacherModel(List<TeacherModel> listTeacherModel) {
    _listTeacherModel = listTeacherModel;
    notifyListeners();
  }

  void setListCourseModel(List<CourseModel> listCourseModel) {
    _listCourseModel = listCourseModel;
    notifyListeners();
  }

  void setTeacherModel(TeacherModel teacherModel) {
    _teacherModel = teacherModel;
    notifyListeners();
  }

  void setCourseModel(CourseModel courseModel) {
    _courseModel = courseModel;
    notifyListeners();
  }

  void setIndexTeacher(int indexTeacher) {
    _indexTeacher =_indexTeacher;
    notifyListeners();
  }

  void setIndexCourse(int indexCourse) {
    _indexCourse =_indexCourse;
    notifyListeners();
  }

  Future<List<TeacherModel>> getData() async {
    await Future.delayed(const Duration(seconds: 2), (){
      _listTeacherModel = [
        TeacherModel(name: Constants.andy, degree: 'Physics Lecturer', image: 'assets/t1.jpg', listCourse: [
          CourseModel(course: '力學', time: '每週一,8:00-10:00', route: '/${Constants.andy}'),  CourseModel(course: '熱學', time: '每週一,10:00-12:00', route: '/${Constants.andy}'), CourseModel(course: '電磁學', time: '每週一,13:00-15:00', route: '/${Constants.andy}'),
          CourseModel(course: '力學', time: '每週一,8:00-10:00', route: '/${Constants.andy}'),  CourseModel(course: '熱學', time: '每週一,10:00-12:00', route: '/${Constants.andy}'), CourseModel(course: '電磁學', time: '每週一,13:00-15:00', route: '/${Constants.andy}')
        ]),
        TeacherModel(name: Constants.jimmy, degree: 'Math Professor', image: 'assets/t2.jpg', listCourse: [CourseModel(course: '微積分', time: '每週二,8:00-10:00', route: '/${Constants.jimmy}'),  CourseModel(course: '分析導論', time: '每週二,10:00-12:00', route: '/${Constants.jimmy}'), CourseModel(course: '線性代數', time: '每週二,13:00-15:00', route: '/${Constants.jimmy}')]),
        TeacherModel(name: Constants.wendy, degree: 'English Lecturer', image: 'assets/t3.jpg', listCourse: [CourseModel(course: '正音發音', time: '每週三,8:00-10:00', route: '/${Constants.wendy}'),  CourseModel(course: '會話', time: '每週三,10:00-12:00', route: '/${Constants.wendy}'), CourseModel(course: '寫作技巧', time:'每週三,13:00-15:00', route: '/${Constants.wendy}')]),
        TeacherModel(name: Constants.tom, degree: 'Chinese Professor', image: 'assets/t4.jpg', listCourse: [CourseModel(course: '古典詩歌', time: '每週四,8:00-10:00', route: '/${Constants.tom}'),  CourseModel(course: '當代文學', time: '每週四,10:00-12:00', route: '/${Constants.tom}'), CourseModel(course: '儒家思想', time: '每週四,13:00-15:00', route: '/${Constants.tom}')]),
        TeacherModel(name: Constants.helen, degree: 'History Lecturer', image: 'assets/t5.jpg', listCourse: [CourseModel(course: '台灣史', time: '每週五,8:00-10:00', route: '/${Constants.helen}'),  CourseModel(course: '中國史', time: '每週五,10:00-12:00', route: '/${Constants.helen}'), CourseModel(course: '世界史', time: '每週五,13:00-15:00', route: '/${Constants.helen}')]),
      ];
    });
    return _listTeacherModel;
  }

  void secondPageTap(BuildContext context) {
    _indexTeacher = _listTeacherModel.indexOf(_teacherModel!);
    context.pop();
  }

}