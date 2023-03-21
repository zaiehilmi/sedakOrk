import 'package:flutter/widgets.dart';

const padding = EdgeInsets.symmetric(vertical: 10, horizontal: 18);

bool isKeyboardShowing(BuildContext context) => MediaQuery.of(context).viewInsets.vertical > 0;