import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Channel {
  final String channelName, image, description,creatorName, dateCreated;
  final Gradient color;
  final int id;
  Channel(
    {
      required this.channelName, 
      required this.image, 
      required this.description, 
      required this.id, 
      required this.creatorName,
      required this.dateCreated,
      required this.color
      }
    );
}

List<Channel> channels = [
  Channel(
    channelName: "Software Engineering", 
    image: "assets/images/img_avatar1.png", 
    description: dummyText, 
    id: 1, 
    creatorName:"yeabsra leulseged", 
    dateCreated: "Jan 20 2021", 
    color: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromRGBO(251, 176, 59, 1),
          Color.fromRGBO(212, 20, 90, 1)
        ]
    )
    ),
  
  Channel(
    channelName: "Electrical Engineering", 
    image: "assets/images/img_avatar2.png", 
    description: dummyText,
    id: 2,
    creatorName:"yeabsra leulseged",
    dateCreated: "Nov 15 2021", 
    color: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(97, 67, 133, 1),
        Color.fromRGBO(81, 99, 149, 1)
      ]
    )
    ),
  Channel(
    channelName: "Mechanical Engineering", 
    image: "assets/images/img_avatar1.png", 
    description: dummyText,
    id: 3,
    creatorName:"yeabsra leulseged",
    dateCreated: "Mar 11 2021", 
    color: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(118, 75, 162, 1),
        Color.fromRGBO(102, 126, 234, 1)
      ]
    )
    ),
  Channel(
    channelName: "Bio-Medical Engineering", 
    image: "assets/images/img_avatar2.png", 
    description: dummyText, 
    id: 4,
    creatorName:"yeabsra leulseged",
    dateCreated: "Jun 04 2021", 
    color: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(251, 176, 59, 1),
        Color.fromRGBO(212, 20, 90, 1)                 
      ]
    )
    ),
  Channel(
    channelName: "Chemical Engineering", 
    image: "assets/images/img_avatar1.png", 
    description: dummyText, 
    id: 5,
    creatorName:"yeabsra leulseged",
    dateCreated: "Sep 08 2021", 
    color: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(251, 176, 59, 1),
        Color.fromRGBO(212, 20, 90, 1)                 
      ]
    )
  )
];

String dummyText = "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ";
