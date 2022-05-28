import 'package:flutter/cupertino.dart';

class Comments {
  String userName;
  DateTime dateTime;
  Image profileImg;
  int upCount;
  int downCount;

  Comments(this.userName, this.dateTime, this.profileImg, this.upCount,
      this.downCount);
}
