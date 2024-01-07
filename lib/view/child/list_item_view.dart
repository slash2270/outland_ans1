import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outland/model/course_model.dart';
import 'package:outland/model/teacher_model.dart';
import 'package:outland/view/child/child/image_view..dart';
import 'package:outland/view/child/child/text_view.dart';
import 'package:provider/provider.dart';

import '../../state/provider/course_provider.dart';
import 'child/button_view.dart';
import 'child/list_child_view.dart';

class ListItemView extends StatelessWidget {
  final int? indexTeacher, indexCourse;
  final bool isItemChild;
  final List<TeacherModel>? listTeacherModel;
  final List<CourseModel>? listCourseModel;
  final List<bool>? listClick;
  final Function() tap;
  const ListItemView({Key? key, this.indexTeacher, this.indexCourse, required this.isItemChild, this.listClick, this.listTeacherModel, this.listCourseModel, required this.tap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => (!isItemChild && listTeacherModel != null) || isItemChild ? tap() : (){},
      child: Container(
        padding: isItemChild ? EdgeInsets.zero : EdgeInsets.all(12.w),
        decoration: isItemChild ? const BoxDecoration() : BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.w),
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
        ),
        child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Selector<CourseProvider, CourseProvider>(
                      selector: (_, provider) => provider,
                      builder: (context, provider, child) {
                        return ImageView(
                            isItemChild: isItemChild,
                            teacherModel: isItemChild
                                ? null
                                : listTeacherModel == null
                                ? provider.teacherModel
                                : listTeacherModel![indexTeacher!]
                        );
                      }
                  ),
                  SizedBox(width: 8.w),
                  Selector<CourseProvider, CourseProvider>(
                      selector: (_, provider) => provider,
                      builder: (context, provider, child) {
                        return TextView(
                            isItemChild: isItemChild,
                            courseModel: isItemChild
                                ? listCourseModel == null
                                ? provider.courseModel
                                : listCourseModel![indexCourse!]
                                : null,
                            teacherModel: isItemChild
                                ? null
                                : listTeacherModel == null
                                ? provider.teacherModel
                                : listTeacherModel![indexTeacher!]);
                      }
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  listClick == null && !isItemChild
                      ? const SizedBox.shrink()
                      : ButtonView(isItemChild: isItemChild, isClick: isItemChild ? null : listClick![indexTeacher!]),
                ],
              ),
              Visibility(
                visible: !isItemChild,
                  child: Selector<CourseProvider, CourseProvider>(
                      selector: (_, provider) => provider,
                      builder: (context, provider, child) {
                        final length = listCourseModel?.length ?? provider.listCourseModel.length;
                        return listTeacherModel == null
                            ? ListChildView(provider: provider,
                            teacherModel: listTeacherModel == null
                                ? provider.teacherModel!
                                : listTeacherModel![indexTeacher!],
                            listCourseModel: listCourseModel ?? provider.listCourseModel)
                            : AnimatedContainer(
                          height: listClick![indexTeacher!]
                              ? (33 + ((indexTeacher! == 0 ? 3 : length) * 52)).w
                              : 1.w,
                          color: listClick![indexTeacher!] ? Colors.white70 : Colors.white,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                          child: ListChildView(listClick: listClick, provider: provider, teacherModel: listTeacherModel![indexTeacher!], listCourseModel: listCourseModel ?? provider.listCourseModel),
                       );
                     }
                  ),
              ),
           ]),
      ),
    );
  }
}