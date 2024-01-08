import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

class ButtonView extends StatefulWidget {
  final bool isItemChild;
  final bool? isClick;
  const ButtonView({Key? key, required this.isItemChild, this.isClick}) : super(key: key);

  @override
  State<ButtonView> createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: pi / 5).animate(_animationController);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ButtonView oldWidget) {
    if (oldWidget.isClick != widget.isClick) {
      widget.isClick! ? _animationController.forward() : _animationController.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }


  Widget _rotateView({required double width, required double height}) {
    return AnimatedBuilder(animation: _animation, builder: (context, setWidget){
      return Transform.rotate(
        angle: _animation.value,
        child: Container(
          width: width.w,
          height: height.w,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20.w)),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 20.w,
        width: 20.w,
        child: widget.isItemChild
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