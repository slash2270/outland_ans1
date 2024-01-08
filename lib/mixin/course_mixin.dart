import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../model/teacher_model.dart';
import '../state/provider/course_provider.dart';
import '../view/child/list_item_view.dart';

mixin CourseMixin<T extends StatefulWidget> on State<T> {

  late StreamSubscription streamSubscription;
  late final provider = context.read<CourseProvider>();
  late Future<List<TeacherModel>> future;
  late final List<bool> listClick = [];
  late ScrollController scrollController = ScrollController();

  void getData() => future = provider.getData();

  void initList(List<TeacherModel> listTeacherModel)
  => List.generate(listTeacherModel.length, (index)
  => listClick.add(false));

  void btnClick(int index, List<TeacherModel> listTeacherModel) {
    context.read<CourseProvider>().setIndexTeacher(index);
    setState(() => listClick[index] = !listClick[index]);
    double height = 0;
    if (index == 0) {
      scrollController.animateTo(height.w, duration: const Duration(milliseconds: 500), curve: Curves.linear);
    } else {
      height = 40;
      for (int i = 0; i < listTeacherModel.length; i++) {
        if (index == i) {
          if (i == listTeacherModel.length - 1) {
            height += 70 + (listClick[i] ? 33 : 0) + (listClick[i] ? ((i == 0 ? 3 : listTeacherModel[i].listCourse.length)) * 52 : 0);
            scrollController.jumpTo(height.w);
          }else {
            if (index > provider.indexTeacher) height += 70 + (listClick[i] ? 33 : 0) + (listClick[i] ? ((i == 0 ? 3 : listTeacherModel[i].listCourse.length)) * 52 : 0);
            scrollController.animateTo(height.w, duration: const Duration(milliseconds: 500), curve: Curves.linear);
            break;
          }
        } else {
          height += 70 + (listClick[i] ? 33 : 0) + (listClick[i] ? ((i == 0 ? 3 : listTeacherModel[i].listCourse.length)) * 52 : 0);
        }
      }
    }
  }

  void setDispose() => scrollController.dispose();

  Widget setWidget(List<TeacherModel> listTeacherModel) {
    return CustomScrollView(
      controller: scrollController,
      cacheExtent: 70.w,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
          sliver: SliverList.separated(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            addSemanticIndexes: false,
            itemCount: listTeacherModel.length,
            itemBuilder: (context, index) {
              return ListItemView(
                isItemChild: false,
                indexTeacher: index,
                listClick: listClick,
                listTeacherModel: listTeacherModel,
                listCourseModel: listTeacherModel[index].listCourse,
                tap: () => btnClick(index, listTeacherModel),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 20.w),
          ),
        ),
      ],
    );
  }

}