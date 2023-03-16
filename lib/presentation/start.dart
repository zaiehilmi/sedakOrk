import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:sedakork/presentation/widget/button.dart';
import 'package:sedakork/presentation/widget/rectangular_textfield.dart';
import 'package:sedakork/util/asset_constant.dart';
import 'package:sedakork/util/string_constant.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    final locale = Localizations.localeOf(context);

    // ni contoh kalau nak tukar bahasa
    // MaterialButton(onPressed: () => setState(() {S.load(Locale("ms"));}),);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(hamburger),
              alignment: Alignment.bottomLeft,
              scale: 1.2
            ),
            gradient: LinearGradient(
              colors: [Color(0xFFED3939), Color(0xFFDE1A1A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appTitle,
                      style: GoogleFonts.passionOne(
                        textStyle: const TextStyle(
                            fontSize: 92,
                            fontWeight: FontWeight.bold,
                            height: 1.0,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 90),
                    RectangularTextfield(
                      hint: delegate.h_namaAnda,
                    ),
                    const SizedBox(height: 25),
                    RectangularTextfield(
                      hint: delegate.h_kodJemputan,
                    ),
                    const SizedBox(height: 40),
                    Expanded(
                      flex: 0,
                      child: Center(
                        child: Button(
                          label: delegate.b_masuk,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
