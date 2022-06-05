import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/application/blocs.dart';
import 'package:rune/theme.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(width: 1.0, color: const Color.fromRGBO(0, 0, 0, 0.37)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
            Expanded(
              child: TextFormField(
                onChanged: (value) {
                  context
                      .read<ChannelBloc>()
                      .add(LoadChannels(query: value.trim()));
                },
                style: GoogleFonts.poppins(
                    fontSize: 15, color: RuneTheme.borderColor),
                decoration: const InputDecoration(
                    fillColor: Colors.amber,
                    hintText: "Search For channels",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
