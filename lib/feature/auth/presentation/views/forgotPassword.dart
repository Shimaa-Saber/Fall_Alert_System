import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../core/common/widgets/text_form_feild_widget.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/colors/colors.dart';

class forgotPassword extends StatelessWidget {
   forgotPassword({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
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
                  Text('Forgot Password?',style: TextStyle(fontSize: 32.sp,fontWeight: FontWeight.w700),),
                  Text('Please enter your email so we can',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),),
                  Text('send you averifcation code',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),),


                  verticalSpace(100),
                  TextFormFieldWidget(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {},
                    hintText: 'Enter Your Email',
                    icon: Icons.email_outlined,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.com')) {
                        return 'Please Enter Correct Email';
                      }
                      return null;
                    },

                  ),

                  verticalSpace(120),

                  ElevatedButtonWidget(
                    title: 'Send Reset Code',
                    tap: (){
                   if (_key.currentState!.validate()) {
                     print('validate');
                     Navigator.pushNamed(context, Routes.resetPasswordCode);
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
