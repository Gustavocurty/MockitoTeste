import 'package:flutter/material.dart';
import 'package:ghibli/services/estacao/classStation.dart';
import 'package:sizer/sizer.dart';

import 'precipatation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Criação do modelo de escolha de estação
  Widget buildStationList(List<Measures> stations) {
    return Column(
      children: stations.map((station) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PrecipitationPage(station: station),
              ),
            );
          },
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      station.logo,
                      width: 15.w,
                      height: 15.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        station.name,
                        style: TextStyle(fontSize: 2.h, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        station.location,
                        style: TextStyle(fontSize: 1.8.h, color: Colors.grey[600]),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 1.h),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Measures> estacoes = MockDatabase.getStations();

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Estações'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Text(
                    'Escolha uma estação abaixo:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 2.5.h,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  
                  buildStationList(estacoes),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
