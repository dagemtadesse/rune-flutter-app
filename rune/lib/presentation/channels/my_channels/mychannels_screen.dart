import 'package:flutter/material.dart';

import '../../../application/widgets/bottomnav.dart';
import '../../../application/widgets/mychannels_appbar.dart';
import '../../../application/widgets/mychannels_card.dart';



class MyChannels extends StatelessWidget {
  const MyChannels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [ 
            buildCard()],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }

}


