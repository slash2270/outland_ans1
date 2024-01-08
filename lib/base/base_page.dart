import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:outland/base/child/base_sencond_page.dart';
import '../util/constants.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState();
}

abstract class BasePageState<T extends BasePage> extends State<T> with RouteAware {

  String title = '';

  Widget setBuild() {
    return Column(
      children: [
        title == Constants.home
            ? const SizedBox.shrink()
            : const BaseSecondPage(),
        SizedBox(height: Platform.isAndroid ? MediaQuery.of(context).padding.bottom : 0)
      ],
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