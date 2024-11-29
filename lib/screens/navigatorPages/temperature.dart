import 'package:flutter/material.dart';
import 'package:ghibli/services/measures/temperatureClass.dart';
import 'package:sizer/sizer.dart';

class TemperaturePage extends StatefulWidget {
  final int id;
  const TemperaturePage({super.key, required this.id});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  final List<Temperature> tempMeasures =
      MockDatabase.getTemperature(); // Pega as medidas da temperatura

  Temperature? getTemperatureById(int id) {
    return tempMeasures.firstWhere(
      (temp) => temp.id == id,
      // ignore: cast_from_null_always_fails
      orElse: () => null as Temperature, // Retorna null se não encontrar o id
    );
  }

  @override
  Widget build(BuildContext context) {
    final temperature = getTemperatureById(widget.id); // Obtém o objeto com o id especificado

    return SizedBox(
            width: 100.w,
            height: 67.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  temperature!.data,
                  style: TextStyle(color: Colors.white, fontSize: 7.w),
                ),
                Text(
                  temperature.horario,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.w,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      "Temperatura",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 6.5.w,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.thermostat_outlined,
                      color: Colors.white,
                      size: 35.w,
                    ),
                  ],
                ),
                Text(
                  temperature.valor,
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
