import 'package:flutter/widgets.dart';

const padding = EdgeInsets.symmetric(vertical: 20, horizontal: 18);

bool isKeyboardShowing(BuildContext context) => MediaQuery.of(context).viewInsets.vertical > 0;