import 'package:fall_detection/core/common/widgets/elevated_button_widget.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/auth/data/logic/activate_cubit/activate_cubit.dart';
import 'package:fall_detection/feature/auth/data/logic/activate_cubit/activate_state.dart';
import 'package:fall_detection/feature/auth/presentation/widgets/otp_verification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routes.dart';

class ActivateUserAccount extends StatelessWidget {
  const ActivateUserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ActivateUserCubit>(context);
    return BlocConsumer<ActivateUserCubit, ActivateUserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                bottom: 26.h,
                left: 25.w,
                right: 25.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_back,
                          size: 32.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    verticalSpace(40),
                    const Center(
                      child: Text(
                        'Verification',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      'We have send you a code to verify your',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor.withOpacity(0.5),
                      ),
                    ),
                    verticalSpace(100),
                    OTPVerificationWidget(
                      controllers: cubit.otpControllers,
                      onChanged: (value) {},
                    ),
                    verticalSpace(20),
                    const Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Didn\'t receive the code?',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              // color: AppColors.primaryColor.withOpacity(0.5),
                            ),
                          ),
                          // verticalSpace(10),
                          Text(
                            '  Resend Code',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(40),
                    ElevatedButtonWidget(
                      title: 'Contanue',
                      tap: () {
                        cubit.activateUser('');
                        Navigator.pushNamed(context, Routes.loginInScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
