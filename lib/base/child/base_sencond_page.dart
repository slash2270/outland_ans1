import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../state/provider/course_provider.dart';
import '../../view/child/list_item_view.dart';

class BaseSecondPage extends StatelessWidget {
  const BaseSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListItemView(
            isItemChild: false,
            tap: () => context.read<CourseProvider>().secondPageTap(context),
          ),
          ListItemView(
            isItemChild: true,
            tap: () => context.read<CourseProvider>().secondPageTap(context),
          ),
        ],
      ),
    );
  }
}