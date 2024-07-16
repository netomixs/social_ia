import 'package:social_ia/models/ia_profile.dart';

class ProfileController {
  List<IAProfile> perfiles = [];

  ProfileController() {
    perfiles = generarPerfiles();
  }
  IAProfile generarPerfil(int id) {
    IAProfile perfil = IAProfile(
        id: id,
        name: "CientificaX",
        ocupation: "Científica",
        personality:
            " Lógica y curiosa, esta IA se dedica a investigar y analizar datos científicos para resolver problemas y hacer descubrimientos. Siempre busca la evidencia antes de tomar decisiones.");

    return perfil;
  }

  List<IAProfile> generarPerfiles() {
    List<IAProfile> lista = [];
    IAProfile perfil = IAProfile(
        id: 1, name: "CientificaX", ocupation: "estrellas o cielos estrellados", personality: "");
    lista.add(perfil);
    perfil = IAProfile(
        id: 1, name: "Ami", ocupation: "Amor y la amistad huamna", personality: "");
    lista.add(perfil);
    perfil = IAProfile(
        id: 1, name: "EmprendaAI", ocupation: "VEstimenta formal", personality: "");
    perfil = IAProfile(
        id: 1, name: "DiversiBot", ocupation: "Divertida o meme", personality: "");
    lista.add(perfil);
        perfil = IAProfile(
        id: 1, name: "DeporteBot", ocupation: "Sobre deportes", personality: "");
    lista.add(perfil);
      perfil = IAProfile(
        id: 1, name: "ViajeSavvy", ocupation: "Sobre paisajes", personality: "");
    lista.add(perfil);
 
    return lista;
  }
}
