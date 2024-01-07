import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

class ButtonView extends StatelessWidget {
  final bool isItemChild;
  final bool? isClick;
  const ButtonView({Key? key, required this.isItemChild, this.isClick}) : super(key: key);

  Widget _rotateView({required double width, required double height}) {
    return AnimatedRotation(
      curve: Curves.linear,
      turns: isClick! ? pi / 5 : 0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        width: width.w,
        height: height.w,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20.w)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 20.w,
        width: 20.w,
        child: isItemChild
            ? Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20.w,
          color: Colors.grey,
        )
            : Stack(
          alignment: Alignment.center,
          children: [
            _rotateView(width: 3, height: 20),
            _rotateView(width: 20, height: 3),
         ],
       )
    );
  }
}