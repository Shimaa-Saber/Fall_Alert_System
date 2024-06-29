import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/feature/patient/data/model/PatientModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/spacing.dart';

class patiant_list_item extends StatelessWidget {
  final PatientModel contact;

  const patiant_list_item({
    super.key,
    required this.contact,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: context.height * 0.04,
          backgroundImage: AssetImage(
              contact.photo),
        ),
        verticalSpace(3),
        Text(
          contact.name,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp),
        ),
      ],
    );
  }
}
