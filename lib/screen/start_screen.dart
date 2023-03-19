import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:sedakork/screen/widget/button.dart';
import 'package:sedakork/screen/widget/rectangular_textfield.dart';
import 'package:sedakork/screen/widget/textButton.dart';
import 'package:sedakork/service/location_provider.dart';
import 'package:sedakork/util/asset_constant.dart';
import 'package:sedakork/util/custom_textstyle.dart' as cts;
import 'package:sedakork/util/setting_constant.dart' as setting;
import 'package:sedakork/util/string_constant.dart';

class Start extends StatelessWidget {
  Start({super.key});

  static var username = TextEditingController();
  static var invitationCode = TextEditingController();

  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    final locale = Localizations.localeOf(context);
    final lp = Provider.of<LocationProvider>(context);

    bool isKeyboardShowing = setting.isKeyboardShowing(context);
    // ni contoh kalau nak tukar bahasa
    // MaterialButton(onPressed: () => setState(() {S.load(Locale("ms"));}),);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            image: !isKeyboardShowing
                ? const DecorationImage(
                    image: ExactAssetImage(hamburger),
                    alignment: Alignment.bottomLeft,
                    scale: 1.2,
                  )
                : null,
            gradient: const LinearGradient(
              colors: [Color(0xFFED3939), Color(0xFFDE1A1A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: setting.padding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appTitle,
                      style: cts.title,
                    ),
                    AnimatedPadding(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.symmetric(
                          vertical: (!isKeyboardShowing) ? 40 : 20),
                    ),
                    RectangularTextfield(
                      controller: username,
                      hint: delegate.h_namaAnda,
                    ),
                    const SizedBox(height: 25),
                    RectangularTextfield(
                      controller: invitationCode,
                      hint: delegate.h_kodJemputan,
                    ),
                    const SizedBox(height: 40),
                    Expanded(
                      flex: 0,
                      child: Center(
                        child: Column(
                          children: [
                            CustomButton(
                              label: delegate.b_masuk,
                              onPressed: () {
                                logger.d('Mencuba melog masuk');
                                logger.i(
                                    'Berjaya mengesahkan kod jemputan (${invitationCode.text})');
                                Navigator.pushNamed(context, 'home');
                              },
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOut,
                              margin: EdgeInsets.only(
                                  bottom: isKeyboardShowing ? 10 : 40),
                              child: !isKeyboardShowing
                                  ? CustomTextButton(
                                      onPressed: () {
                                        logger.d('Mencipta komuniti baharu');
                                      },
                                      label: delegate.b_ciptaKomuniti,
                                    )
                                  : const SizedBox(height: 0),
                            )
                          ],
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
