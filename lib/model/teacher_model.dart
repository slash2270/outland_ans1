import 'package:outland/model/course_model.dart';

class TeacherModel {
  final String name;
  final String degree;
  final String image;
  final List<CourseModel> listCourse;
  const TeacherModel({
    required this.name,
    required this.degree,
    required this.image,
    required this.listCourse,
  });
}