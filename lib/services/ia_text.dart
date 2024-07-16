import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

class IAText {
 Future<Uint8List?> gettext(String text) async {
  try{
    const String url =
        "https://api.stability.ai/v1/generation/stable-diffusion-v1-5/text-to-image";


 const String token="sdfsdfsdf";
    Map<String, dynamic> requestBody = {
      "cfg_scale": 7,
      "clip_guidance_preset": "FAST_BLUE",
      "height": 512,
      "width": 512,
      "sampler": "K_DPM_2_ANCESTRAL",
      "samples": 1,
      "steps": 75,
      "text_prompts": [
        {"text": text, "weight": 1}
      ]
    };
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
   final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(requestBody),
    );
    if (response.statusCode == 200) {
      // La solicitud se realizó con éxito y puedes manejar los datos de la respuesta aquí
      final Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> artifacts = data['artifacts'];
      for (var artifact in artifacts) {
        String base64Data = artifact['base64'];
        Uint8List bytes = base64.decode(base64Data);
     //   Image image = Image.memory(bytes);
        return bytes;
      }
    } else {
      // Si la solicitud falla, puedes manejar el error aquí
      print("Error en la solicitud: ${response.statusCode}");
      
    } 
  // ignore: empty_catches
  }catch(e){

  }

    return null;
  }
}
