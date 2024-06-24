import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../core/common/widgets/text_form_feild_widget.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/colors/colors.dart';
import '../../../../core/utils/spacing.dart';

class resetPassword extends StatelessWidget {
   resetPassword({Key? key}) : super(key: key);
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon:  Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
      ),

      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Padding(

            padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Center(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpace(20),
                  Text('Reset Password? ',style: TextStyle(fontSize: 32.sp,fontWeight: FontWeight.w700),),
                  Text('Please enter your new password to',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),),
                  Text('continue',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),),


                  verticalSpace(100),
                  TextFormFieldWidget(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {},
                    hintText: 'Enter Your Password',
                    icon: Icons.password_outlined,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Please Enter Correct Password';
                      }
                      return null;
                    },

                  ),

                 verticalSpace(20),
                  TextFormFieldWidget(
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {},
                    hintText: 'Confirm Password',
                    icon: Icons.password_outlined,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Please Enter Correct Password';
                      }
                      return null;
                    },

                  ),

                  verticalSpace(120),

                  ElevatedButtonWidget(
                    title: 'Reset Password ',
                    tap: (){
                      if (_key.currentState!.validate()) {
                        print('validate');
                        Navigator.pushNamed(context, Routes.loginInScreen);
                      }
                    },
                  )
                  //Please enter your email so we can
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
