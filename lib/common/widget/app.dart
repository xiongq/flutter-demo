import 'package:flutter/material.dart';

PreferredSizeWidget taransparentAppBar({
  required BuildContext context,
  required List<Widget> actions,
  Widget? title,
  Widget? leading,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title,
    leading: leading,
    actions: actions,
  );
}

// IconButton(
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       icon: Icon(
//         Icons.arrow_back,
//         color: AppColors.primaryText,
//       ),
//     ),