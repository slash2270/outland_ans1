import 'package:flutter/material.dart';
import 'package:outland/util/constants.dart';

import '../../base/base_page.dart';

class JimmyPage extends BasePage {
  const JimmyPage({super.key});

  @override
  State<JimmyPage> createState() => _JimmyPageState();
}

class _JimmyPageState extends BasePageState<JimmyPage> {

  @override
  String get title => Constants.jimmy;

}