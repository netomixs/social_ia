import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:social_ia/controllers/publication_controller.dart';
import 'package:social_ia/models/publishModel.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class Publisher extends StatefulWidget {
  final PublisherModel model;
  List<PublisherModel> listaguardada = [];
  Publisher({super.key, required this.model, required this.listaguardada});

  @override
  State<Publisher> createState() => _PublisherState();
}

class _PublisherState extends State<Publisher> {
  bool estaSeleccionado = false; // Esta variable controla el estado del botón
  @override
  Widget build(BuildContext context) {
    setState(() {
      estaSeleccionado = Publication_Controller.buscarByFecha(
          widget.listaguardada, widget.model);
    });
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          // Nombre del autor y hora de publicación
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                widget.model.imageUser == null
                    ? const Icon(Icons.account_circle)
                    : Image(
                        image: widget.model.imageUser!
                            .image, // Asígnale la imagen de tu modelo
                        width: 24, // Ancho deseado
                        height: 24, // Alto deseado
                      ),
                const SizedBox(width: 8.0),
                Text(widget.model.UserName),
                const Spacer(),
                const Icon(Icons.access_time),
                Container(
                  margin: EdgeInsets.only(
                      right:
                          10.0), // Ajusta el valor de 10.0 según tus necesidades
                  child: Text(
                      DateFormat('HH:mm').format(widget.model.publisherTime)),
                )
              ],
            ),
          ),

          // Texto de la publicación
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft, // Alinea el texto a la izquierda
              child: Text(widget.model.content),
            ),
          ),
          Center(child: widget.model.image),
          // Botones de acción
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (estaSeleccionado == true) {
                      widget.listaguardada.remove(widget.model);
                    } else {
                      widget.listaguardada.add(widget.model);
                    }
                    estaSeleccionado = Publication_Controller.buscarByFecha(
                        widget.listaguardada, widget.model);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: estaSeleccionado ? Colors.green : null,
                  foregroundColor: estaSeleccionado ? Colors.white : null,
                  padding: const EdgeInsets.all(16.0),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.thumb_up),
                    SizedBox(width: 8.0), // Espacio entre el icono y el texto
                    Text("Me gusta"),
                  ],
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Lógica para manejar el "Me gusta"
              //   },
              //   style: ElevatedButton.styleFrom(
              //     padding: const EdgeInsets.all(
              //         16.0), // Ajusta el tamaño del botón aquí
              //   ),
              //   child: const Row(
              //     children: [
              //       Icon(Icons.comment),
              //       SizedBox(width: 8.0), // Espacio entre el icono y el texto
              //       Text("Comentar"),
              //     ],
              //   ),
              // ),
                 ElevatedButton(
                   onPressed: () {
            
                   },
                  style: ElevatedButton.styleFrom(
                   padding: const EdgeInsets.all(
                        16.0), // Ajusta el tamaño del botón aquí
                  ),
                 child: const Row(
                    children: [
                      Icon(Icons.save),
                      SizedBox(width: 8.0), // Espacio entre el icono y el texto
                      Text("Guardar"),
                     ],
                   ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  _saveLocalImage( ) async {
 
    if (widget.model.bytes.length>2) {
      final result =
          await ImageGallerySaver.saveImage(widget.model.bytes);
      print(result);
    }
  }
 
}
