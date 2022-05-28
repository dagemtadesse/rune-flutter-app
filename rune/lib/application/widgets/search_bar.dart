import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showSearch(
        //   context: context,
        //   delegate: CustomSearchDelegate(),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.0, color: const Color.fromRGBO(0, 0, 0, 0.37)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SizedBox(
                width: 5.0,
              ),
              const Icon(
                Icons.search,
                color: RuneTheme.borderColor,
              ),
              const SizedBox(
                width: 25.0,
              ),
              Text(
                "Search For channels",
                style: GoogleFonts.poppins(
                    fontSize: 15, color: RuneTheme.borderColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}


  // Widget SearchBar(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 60.0),
  //     child: GestureDetector(
  //       onTap: () {
  //         showSearch(
  //           context: context,
  //           delegate: CustomSearchDelegate(),
  //         );
  //       },
  //       child: Container(
  //         decoration: BoxDecoration(
  //             border: Border.all(width: 1.0, color: Colors.black),
  //             borderRadius: BorderRadius.circular(12)),
  //         constraints: const BoxConstraints(maxWidth: 500, minWidth: 400),
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Row(
  //             children: const [
  //               SizedBox(
  //                 width: 5.0,
  //               ),
  //               Icon(Icons.search),
  //               SizedBox(
  //                 width: 25.0,
  //               ),
  //               Text(
  //                 "Search For channels",
  //                 style: TextStyle(color: Colors.grey),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
