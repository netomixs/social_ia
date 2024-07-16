import 'package:flutter/material.dart';
import 'package:social_ia/controllers/publication_controller.dart';
import 'package:social_ia/widgets/publisher.dart';

import '../controllers/profile_controller.dart';
import '../models/ia_profile.dart';
import '../models/publishModel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<PublisherModel> listaguardada = [];
  List<PublisherModel> listaPubliacionenes = [];
  List<IAProfile> perfiles = [];
  ProfileController perfilCOntroller = ProfileController();
  late Publication_Controller publiacionController;
  Future<void> cargar() async {
   
    for (var i = 0; i < 10; i++) {
   await   cargarNuevaPublicacion();
    }
    print(listaPubliacionenes.length);
  }

  Future<void> cargarNuevaPublicacion() async {
    await publiacionController.generarPublicacion();
    setState(() {
      listaPubliacionenes = publiacionController.listaPubliacionenes;
    });
  }

  @override
  initState() {
    perfiles = perfilCOntroller.perfiles;

    publiacionController = Publication_Controller(
        listaPubliacionenes: listaPubliacionenes, perfiles: perfiles);
    cargar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxWidth = 600.0;
    double containerWidth = screenWidth < maxWidth ? screenWidth : maxWidth;

    return Center(
      child: Container(
        width: containerWidth,
        child: ListView(
          children: listaPubliacionenes.map((publisher) {
            return Publisher(
              model: publisher,
              listaguardada: listaguardada,
            );
          }).toList(),
        ),
      ),
    );
  }
}
