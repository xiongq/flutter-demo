import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/values/values.dart';

PreferredSizeWidget taransparentAppBar({
  required BuildContext context,
  required List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(''),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.primaryText,
      ),
    ),
    actions: actions,
  );
}
