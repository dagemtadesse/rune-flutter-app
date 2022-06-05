import 'package:flutter/material.dart';



AppBar buildAppBar() {
    return AppBar(
      leading: const Icon(Icons.arrow_back),        
      title: const Padding(
        padding: EdgeInsets.only(top: 0),
        child: Text(
          "My Comments",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14

          ),),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(23, 0, 118, 1),
              Color.fromRGBO(97, 37, 133, 1)
              
            ]
          )
        ),
      ),
      
      elevation: 0,
      
    );
  }