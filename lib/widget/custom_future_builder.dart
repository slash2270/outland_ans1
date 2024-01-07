import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  final Future<T> Function() getData;
  final Widget Function(T? data) widget;
  const CustomFutureBuilder({Key? key, required this.getData, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
                child: GestureDetector(
                onTap: getData,
                child: Icon(
                  Icons.network_cell,
                  size: 50.w,
                ),
              )
            );
          } else {
            if (snapshot.hasData) {
              return widget(snapshot.data);
            }
            else {
              return Center(
                child: Icon(
                  Icons.data_array,
                  size: 50.w,
                ),
              );
            }
          }
        } else {
          return Center(
              child: SizedBox(
                height: 30.w,
                width: 30.w,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 2.w,
                ),
              )
          );
        }
      },
    );
  }
}