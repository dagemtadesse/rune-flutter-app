import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rune/domain/page_model.dart';
import 'package:rune/theme.dart';

class ChannelCard extends StatelessWidget {
  const ChannelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageModel = Provider.of<PageModel>(context, listen: false);

    return GestureDetector(
      onTap: () {
        pageModel.setCurrentPage(Pages.channelPage);
      },
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              color: Color.fromRGBO(206, 206, 206, 1), width: 1),
          borderRadius: BorderRadius.circular(12.0),
          // bo
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0)),
                  gradient: LinearGradient(colors: [
                    // Color.fromRGBO(15, 36, 39, 1),
                    // Color.fromRGBO(32, 56, 67, 1),
                    // Color.fromRGBO(43, 83, 100, 1),
                    Color.fromRGBO(19, 106, 138, 1),
                    Color.fromRGBO(38, 120, 113, 1),
                  ])),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/mechanical.jpg"),
                      radius: 46,
                    ),
                  ),
                  Text(
                    "Mechanical Engineering",
                    style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nulla diam, mollis feugiat varius nec, pretium eget est. Mauris semper felis tortor, vel malesuada tortor porttitor non. ",
                style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    color: RuneTheme.borderColor,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//  Widget channelCard(BuildContext context) {
//     
//   }
  