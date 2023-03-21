import 'package:flutter/material.dart';
import 'package:sedakork/generated/l10n.dart';

const padding = EdgeInsets.symmetric(vertical: 10, horizontal: 18);

bool isKeyboardShowing(BuildContext context) => MediaQuery.of(context).viewInsets.vertical > 0;

TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;
ColorScheme colorScheme(BuildContext context) => Theme.of(context).colorScheme;

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

S delegate(BuildContext context) => S.of(context);