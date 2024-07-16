import 'dart:typed_data';

import 'package:flutter/material.dart';

class PublisherModel{
   DateTime publisherTime;
  String UserName;
  int IdUser;
  String content;
  Image? image;
  Image? imageUser;
   Uint8List bytes;
  
  PublisherModel({
     this.IdUser=0,
     this.UserName="",
     this.content="",
     this.image,
     this.imageUser,
     required this.bytes ,
     required this.publisherTime});
 
}