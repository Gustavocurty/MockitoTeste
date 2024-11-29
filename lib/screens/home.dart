// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ghibli/models/stationSelection.dart';
import 'package:ghibli/screens/measures.dart';
import 'package:ghibli/services/estacao/classStation.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectStationName;
  int? selectStationId;

  void selectedStation(String name, int id) {
    setState(() {
      selectStationName = name;
      selectStationId = id;
    });
  }

  // Criação do modelo de escolha de estação
  Widget buildStationList(List<Measures> stations) {
    return Column(
      children: stations.map((station) {
        return GestureDetector(
          onTap: () {
            selectedStation(station.name, station.id);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: selectStationId == station.id
                  ? const Color.fromRGBO(211, 211, 211, 0.2)
                  : Colors.transparent,
              child: StationChoice(
                name: station.name,
                imagePath: station.logo,
                local: station.location,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Measures> estacoes = MockDatabase.getStations(); // Pega os dados das estações

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Estações', style: TextStyle ( color: Colors.white ),),
            backgroundColor: const Color.fromARGB(255, 44, 68, 80),
          ),
          body: Container(
            width: 100.w,
            height: 100.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(224, 50, 73, 86),
                Color.fromARGB(255, 55, 85, 100)
              ]),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [

                    Text(
                      'Escolha uma estação abaixo:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 3.h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 1.h),

                    buildStationList(estacoes),

                    SizedBox(height: 1.h),
                    
                    ElevatedButton(
                      onPressed: selectStationId != null
                          ? () {
                              // Encontra a estação selecionada
                              final selectedStation = estacoes.firstWhere(
                                (station) => station.id == selectStationId,
                              );

                              // Navega para a página PrecipitationPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MeasuresPage(station: selectedStation),
                                ),
                              );
                            }
                          : null,

                      style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  elevation: 4,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  minimumSize: Size(double.infinity, 6.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Text(
                  "CONFIRMAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 2.0.h,
                  ),
                ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
