// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StationChoice extends StatefulWidget {
  const StationChoice(
      {super.key,
      required this.name,
      required this.imagePath,
      required this.local});

  final String name;
  final String imagePath;
  final String local;

  @override
  State<StationChoice> createState() => _StationChoiceState();
}

class _StationChoiceState extends State<StationChoice> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: SizedBox(
        width: 100.w,
        height: 12.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(
              width: 12.w,
              height: 12.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(width: 5.w),

            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 5.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.local,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 3.w,
                    ),
                    overflow: TextOverflow.visible,   // Faz o texto não ultrapassar a tela
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
