import 'package:flutter/material.dart';

import '../../base/base_page.dart';
import '../../util/constants.dart';

class HelenPage extends BasePage {
  const HelenPage({super.key});

  @override
  State<HelenPage> createState() => _HelenPageState();
}

class _HelenPageState extends BasePageState<HelenPage> {

  @override
  String get title => Constants.helen;

}