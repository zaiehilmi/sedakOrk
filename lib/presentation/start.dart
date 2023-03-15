import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedakork/generated/l10n.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    final locale = Localizations.localeOf(context);

    // ni contoh kalau nak tukar bahasa
    // MaterialButton(onPressed: () => setState(() {S.load(Locale("my"));}),);

    return Scaffold(
      body: SizedBox.expand(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sedak\nOrk',
                  style: GoogleFonts.passionOne(
                    textStyle: const TextStyle(
                      fontSize: 87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(width: 100, child: TextField()),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
