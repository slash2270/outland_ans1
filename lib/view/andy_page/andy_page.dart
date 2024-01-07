import 'package:flutter/material.dart';

import '../../base/base_page.dart';
import '../../util/constants.dart';


class AndyPage extends BasePage {
  const AndyPage({super.key});

  @override
  State<AndyPage> createState() => _AndyPageState();
}

class _AndyPageState extends BasePageState<AndyPage> {

  @override
  String get title => Constants.andy;

}