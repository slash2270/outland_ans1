import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../state/provider/course_provider.dart';
import '../util/constants.dart';
import '../view/child/list_item_view.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState();
}

abstract class BasePageState<T extends BasePage> extends State<T> with RouteAware {

  String title = '';

  Widget setBuild() {
    return title == Constants.home
        ? const SizedBox.shrink()
        : Padding(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title Page'), leading: IconButton(icon: const Icon(Icons.keyboard_backspace), onPressed: () => context.pop())),
      body: setBuild(),
    );
  }

}