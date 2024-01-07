import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:outland/model/teacher_model.dart';

import '../../../model/course_model.dart';
import '../../../state/provider/course_provider.dart';
import '../list_item_view.dart';

class ListChildView extends StatelessWidget {
  final List<bool>? listClick;
  final CourseProvider provider;
  final TeacherModel teacherModel;
  final List<CourseModel>? listCourseModel;
  const ListChildView({Key? key, this.listClick, required this.provider, required this.teacherModel, required this.listCourseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      cacheExtent: 52.w,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 16.w),
              Divider(height: 1.w, color: Colors.black38),
              SizedBox(height: 16.w),
            ],
          ),
        ),
        SliverList.builder(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          itemCount: listCourseModel!.length,
          itemBuilder: (context, index) {
            return ListItemView(indexCourse: index, isItemChild: true, listCourseModel: listCourseModel,
                tap: () async {
                    if (listClick == null) {
                      context.pop();
                    } else {
                      provider.setTeacherModel(teacherModel);
                      provider.setCourseModel(listCourseModel![index]);
                      provider.setListCourseModel(listCourseModel!);
                      provider.setIndexCourse(index);
                      context.push(listCourseModel![index].route);
                    }
                });
          }
        ),
      ],
    );
  }
}