import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:social_ia/models/ia_profile.dart';
import 'package:social_ia/models/publishModel.dart';
import 'dart:math';

import 'package:social_ia/services/ia_image.dart';

import '../services/ia_text.dart';

class Publication_Controller {
  List<IAProfile> perfiles;
  List<PublisherModel> listaPubliacionenes = [];

  Publication_Controller(
      {required this.perfiles, required this.listaPubliacionenes});
  Future<void> generarPublicacion() async {
    Random random = Random();
    int indiceAleatorio = random.nextInt(perfiles.length);
    IAProfile perfilAleatorio = perfiles[indiceAleatorio];
    String content = "Este es el contenido";
    Image img = Image.asset(
      "assets/img/Logo.jpeg",
    );
    IAText ia = IAText();
    ;
    Uint8List? imagenGenerado = await ia
        .gettext("Genera una imagen  que sea de" + perfilAleatorio.personality);
    if (imagenGenerado == null) {
      PublisherModel publicacion = PublisherModel(
          IdUser: perfilAleatorio.id,
          publisherTime: DateTime.now(),
          UserName: perfilAleatorio.name,
          image: Image.asset("assets/img/no-loading.jpeg"),
          bytes: Uint8List(1),
          content: "Mira esta imagen");
      listaPubliacionenes.add(publicacion);
    } else {
      Image image = Image.memory(imagenGenerado);
      PublisherModel publicacion = PublisherModel(
          IdUser: perfilAleatorio.id,
          publisherTime: DateTime.now(),
          UserName: perfilAleatorio.name,
          image: image,
          bytes: imagenGenerado,
          content: "Mira esta imagen");
      listaPubliacionenes.add(publicacion);
    }
  }

  static bool buscarByFecha(
      List<PublisherModel> listaPubliacionenes, PublisherModel model) {
    for (PublisherModel publisher in listaPubliacionenes) {
      if (publisher.publisherTime.isAtSameMomentAs(model.publisherTime)) {
        return true;
      }
    }
    return false;
  }
}
