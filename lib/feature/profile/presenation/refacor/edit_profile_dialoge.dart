import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/core/styles/images/assets.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/profile/presenation/widgets/row_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/edit_profile_column.dart';

class EditProfileDialge extends StatelessWidget {
  const EditProfileDialge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          width: context.width * 0.9,
          height: context.height * 0.9,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: context.width * 0.39,
                      height: context.height * 0.39,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.blue),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/patientfall.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: context.height * 0.24,
                      left: context.width * 0.26,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: context.width * 0.1,
                          height: context.height * 0.034,
                          color: Color(0xff00A9FF),
                          child: Image.asset('assets/images/🦆 icon _camera_.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(5),
              editProfileColumn(
                text: 'Deniz Can',
                icon: Icons.perm_identity,
              ),
              verticalSpace(20),
              editProfileColumn(
                text: '01121010554',
                icon: Icons.phone,
              ),
              verticalSpace(20),
              editProfileColumn(
                text: 'Female',
                icon: Icons.female_outlined,
              ),
              verticalSpace(70),
              Center(
                child: Container(
                  width: context.width * 0.5,
                  height: context.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff00A9FF),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 5,
                        color: Colors.black,
                        blurStyle: BlurStyle.normal,
                        offset: Offset(1, 4),
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
