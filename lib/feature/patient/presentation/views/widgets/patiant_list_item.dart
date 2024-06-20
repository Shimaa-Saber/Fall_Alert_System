import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/spacing.dart';

class patiant_list_item extends StatelessWidget {
  const patiant_list_item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: context.height * 0.04,
          backgroundImage: AssetImage(
              'assets/images/Ellipse 9.png'),
        ),
        verticalSpace(3),
        Text(
          'Nour',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp),
        ),
      ],
    );
  }
}
