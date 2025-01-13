// ignore_for_file: cast_from_null_always_fails

import 'package:flutter/material.dart';
import 'package:ghibli/services/measures/photoClass.dart';
import 'package:sizer/sizer.dart';

class PhotoPage extends StatefulWidget {
  final int id;
  const PhotoPage({super.key, required this.id});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  final List<Photo> fotoMeasures = MockDatabase.getPhoto(); // Pega as infos

  Photo? getPhotoById (int id) {
    return fotoMeasures.firstWhere(
      (foto) => foto.id == id,
      orElse: () => null as Photo,
    );
  }
  @override
  Widget build(BuildContext context) {
    final foto = getPhotoById(widget.id); // Obtem o objeto do id passado

    return SizedBox(
      width: 100.w,
      height: 67.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Photo Page",
            style: TextStyle(
              color: Colors.white,
              fontSize: 6.5.w,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            width: 70.w,
            child: Image.network(
              foto!.fotoTempo,
              fit: BoxFit.cover,
            ),
            
          ),

          const Text("",), // Para enquadrar melhor os componentes
        ],
      ),
    );
  }
}