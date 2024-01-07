import 'package:flutter/material.dart';
import 'package:outland/util/constants.dart';

import '../../base/base_page.dart';

class TomPage extends BasePage {
  const TomPage({super.key});

  @override
  State<TomPage> createState() => _TomPageState();
}

class _TomPageState extends BasePageState<TomPage> {

  @override
  String get title => Constants.tom;

}