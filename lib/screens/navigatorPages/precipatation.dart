import 'package:flutter/material.dart';
import 'package:ghibli/services/measures/preciptationClass.dart';
import 'package:sizer/sizer.dart';

class PrecipitationPage extends StatefulWidget {
  final int id;
  const PrecipitationPage({super.key, required this.id});

  @override
  State<PrecipitationPage> createState() => _PrecipitationPageState();
}

class _PrecipitationPageState extends State<PrecipitationPage> {
  final List<Preciptation> precMeasures = MockDatabase.getPreciptation();

  Preciptation? getPreciptationById(int id) {
    return precMeasures.firstWhere(
      (prec) => prec.id == id,
      // ignore: cast_from_null_always_fails
      orElse: () => null as Preciptation,
    );
  }
  @override
  Widget build(BuildContext context) {
    final preciptation = getPreciptationById(widget.id);

    return SizedBox(
            width: 100.w,
            height: 67.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  preciptation!.data,
                  style: TextStyle(color: Colors.white, fontSize: 7.w),
                ),
                Text(
                  preciptation.horario,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.w,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      "Precipitação",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 6.5.w,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.cloud_outlined,
                      color: Colors.white,
                      size: 35.w,
                    ),
                  ],
                ),
                Text(
                  preciptation.valor,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.5.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
  }
}