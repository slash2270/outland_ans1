import 'package:flutter/material.dart';
import 'package:outland/util/constants.dart';

import '../../base/base_page.dart';

class WendyPage extends BasePage {
  const WendyPage({super.key});

  @override
  State<WendyPage> createState() => _WendyPageState();
}

class _WendyPageState extends BasePageState<WendyPage> {

  @override
  String get title => Constants.tom;

}