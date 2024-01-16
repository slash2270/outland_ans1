import 'package:flutter/material.dart';
import 'package:outland/model/course_model.dart';
import 'package:outland/model/teacher_model.dart';
import 'package:provider/provider.dart';

import '../../../state/provider/course_provider.dart';
import '../../../util/constants.dart';

class TextView extends StatelessWidget {
  final bool isItemChild;
  final CourseModel? courseModel;
  final TeacherModel? teacherModel;
  const TextView({Key? key, required this.isItemChild, required this.courseModel, required this.teacherModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(isItemChild ? courseModel?.course ?? '' : teacherModel?.degree ?? '',
            style: !isItemChild ? Constants.textTop : Constants.textDown),
        Text(isItemChild ? courseModel?.time ?? '' : teacherModel?.name ?? '',
            style: Constants.textDown),
      ],
    );
  }
}