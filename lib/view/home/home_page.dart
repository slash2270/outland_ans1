import 'package:flutter/material.dart';
import 'package:outland/base/base_page.dart';
import 'package:outland/util/constants.dart';

import '../../mixin/course_mixin.dart';
import '../../widget/custom_future_builder.dart';

class MyHomePage extends BasePage {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends BasePageState<MyHomePage> with CourseMixin {

  @override
  String get title => Constants.home;

  @override
  Widget get mainWidget => CustomFutureBuilder(
    getData: () => future,
    widget: (data) {
      initList(data!);
      return setWidget(data);
    },
  );

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    setDispose();
    super.dispose();
  }

}