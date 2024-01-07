import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outland/model/teacher_model.dart';
import 'package:provider/provider.dart';

import '../../../state/provider/course_provider.dart';

class ImageView extends StatelessWidget {
  final bool isItemChild;
  final TeacherModel? teacherModel;
  const ImageView({Key? key, required this.isItemChild, required this.teacherModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isItemChild
        ? Icon(
      Icons.date_range,
      size: 30.w,
      color: Colors.grey,
    )
        : Selector<CourseProvider, CourseProvider>(
        selector: (_, provider) => provider,
        builder: (context, provider, child) {
          return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100.w)),
            child: Image.asset(teacherModel!.image, width: 40.w, height: 40.w, fit: BoxFit.fill),
          );
        }
    );
  }
}