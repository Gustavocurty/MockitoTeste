// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ghibli/screens/navigatorPages/photoPage.dart';
import 'package:ghibli/screens/navigatorPages/precipatation.dart';
import 'package:ghibli/screens/navigatorPages/temperature.dart';
import 'package:sizer/sizer.dart';
import '../services/estacao/classStation.dart';

class MeasuresPage extends StatefulWidget {
  final Measures station;

  const MeasuresPage({super.key, required this.station});

  @override
  State<MeasuresPage> createState() => _MeasuresPageState();
}

class _MeasuresPageState extends State<MeasuresPage> {
  late double temperature; // Armazena a temperatura calculada
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    temperature = _getTemperatureByStation(widget.station.id);
  }

  double _getTemperatureByStation(int stationId) {
    // Simulação de busca de temperatura com base no ID da estação
    // Substitua por sua lógica de recuperação real
    final mockData = {
      1: 18.5,
      2: 22.0,
      3: 28.5,
      4: 25.0,
    };
    return mockData[stationId] ?? 20.0; // Retorna 20.0 como valor padrão
  }

  List<Color> calculateBackgroundGradient(double temperature) {
    if (temperature < 20) {
      return [
        Color.fromARGB(255, 12, 12, 141),
        Color.fromARGB(255, 46, 66, 175),
        Color.fromARGB(255, 40, 127, 227),
      ];
    } else if (temperature >= 20 && temperature <= 26) {
      return [
        Color.fromARGB(255, 6, 173, 179),
        Color.fromARGB(255, 34, 138, 182),
        Color.fromARGB(255, 30, 150, 166),
      ];
    } else {
      return [
        Color.fromARGB(255, 220, 59, 10),
        Color.fromARGB(255, 196, 119, 11),
        Color.fromARGB(255, 239, 167, 13),
        Color.fromARGB(255, 182, 161, 3),
      ];
    }
  }

  // ignore: non_constant_identifier_names
  Color AppBarBackgroundColor(double temperature) {
    if (temperature < 20) {
      return Color(0xFF1A237E);
    } else if (temperature >= 20 && temperature <= 26) {
      return Color.fromARGB(255, 16, 99, 116);
    } else {
      return Color.fromARGB(255, 167, 39, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mapear sensores para páginas
    final sensorPages = {
      'precipitation': PrecipitationPage(station: widget.station),
      'temperature': TemperaturePage(id: widget.station.id),
      'photo': PhotoPage(),
    };

    final sensorDestinations = {
      'precipitation': NavigationDestination(
        selectedIcon: Icon(Icons.cloud),
        icon: Icon(Icons.cloud_outlined),
        label: "Precipitação",
      ),
      'temperature': NavigationDestination(
        selectedIcon: Icon(Icons.thermostat),
        icon: Icon(Icons.thermostat_outlined),
        label: "Temperatura",
      ),
      'photo': NavigationDestination(
        selectedIcon: Icon(Icons.camera),
        icon: Icon(Icons.camera_outlined),
        label: "Foto",
      ),
    };

    // Filtrar páginas e destinos com base nos sensores disponíveis
    final availablePages = widget.station.sensors
        .where((sensor) => sensorPages.containsKey(sensor))
        .map((sensor) => sensorPages[sensor]!)
        .toList();

    final availableDestinations = widget.station.sensors
        .where((sensor) => sensorDestinations.containsKey(sensor))
        .map((sensor) => sensorDestinations[sensor]!)
        .toList();

    // Validar o índice para evitar RangeError
    if (currentPageIndex >= availablePages.length) {
      currentPageIndex = 0;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.station.name),
        backgroundColor: AppBarBackgroundColor(temperature),
      ),
      body: Container(
        height: 100.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: calculateBackgroundGradient(temperature),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: availablePages.isNotEmpty
            ? availablePages[currentPageIndex]
            : Center(
                child: Text("Nenhuma página disponível para os sensores.")),
      ),
      bottomNavigationBar: availableDestinations.isNotEmpty
    ? NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
            TextStyle(
              color: Colors.white, 
              fontSize: 12, 
            ),
          ),
          iconTheme: WidgetStateProperty.all(IconThemeData(
            color: Colors.white, // Define o ícone como branco
          )),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.transparent,
          selectedIndex: currentPageIndex,
          destinations: availableDestinations,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          backgroundColor: AppBarBackgroundColor(temperature),
          elevation: 4,
          surfaceTintColor: AppBarBackgroundColor(temperature),
        ),
      )
    : null,


    );
  }
}
