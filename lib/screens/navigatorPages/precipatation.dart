// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ghibli/services/estacao/classStation.dart';

class PrecipitationPage extends StatelessWidget {
  final Measures station;

  const PrecipitationPage({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  station.logo,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 16),

            Text(
              'Localização: ${station.location}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 8),

            Text(
              'Sensores disponíveis:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 8),

            ...station.sensors.map((sensor) => Text('- $sensor')),

            SizedBox(height: 16),
            
            ElevatedButton(
              onPressed: () {
                // Acessar mais informações
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text('Acesse: ${station.infoUrl}'),
                  ),
                );
              },
              child: Text('Ver mais informações'),
            ),
          ],
        ),
      ),
    );
  }
}