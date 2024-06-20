import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/feature/patient/presentation/views/widgets/patiant_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../profile/presenation/widgets/row_info_widget.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});
  static String id = 'patient_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: AppColors.primaryColor,
      //   leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
      // ),
      body: Container(


        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              AppColors.primaryColor,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),



        child: Padding(
          padding: EdgeInsets.only(
            top: context.height * 0.1,
            left: context.width * 0.1,
            right: context.width * 0.1,
            bottom: context.height * 0.1,
          ),


          child: Center(

            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: context.height * 0.7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: context.height * 0.078,
                        left: context.width * 0.05,
                        right: context.width * 0.05,
                        bottom: context.height * 0.02,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Patient',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            verticalSpace(48),
                            const RowInfoWidget(
                              icon: Icons.male,
                              text: 'Male',
                            ),
                            verticalSpace(16),
                            const RowInfoWidget(
                              icon: Icons.phone,
                              text: '+2 01115951253',
                            ),
                            verticalSpace(16),
                            const RowInfoWidget(
                              icon: Icons.calendar_month_sharp,
                              text: '13/11/1890',
                            ),
                            verticalSpace(16),
                            const RowInfoWidget(
                              icon: Icons.warning_amber,
                              text: '+1 987-654-',
                            ),
                            verticalSpace(25),
                            Row(
                              children: [
                                Text(
                                  'Contact List',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19.sp),
                                ),
                                horizontalSpace(25),
                                Text(
                                  '4 contacts',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp),
                                ),
                              ],
                            ),
                            verticalSpace(45),
                            Container(
                              width: context.width * 0.8,
                              height: context.height * 0.13,
                              decoration: BoxDecoration(
                                color: Color(0xffDDDEDE),
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Container(
                                height: context.height*0.13,
                                child: ListView.builder(
                                  itemCount: 6,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                                    child: patiant_list_item(),
                                  );
                                },),
                              ),
                            ),
                            verticalSpace(16),
                            // Add more widgets if needed
                          ],
                        ),
                      ),
                    ),
                  ),
                ),




                Positioned(
                  left: context.width * 0.01,
                  right: context.width * 0.47,
                  bottom: context.height * 0.63,
                  child: Container(
                    height: context.height * 0.13,
                    width: context.height * 0.13,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: context.height * 0.15,
                      backgroundImage:
                      const AssetImage('assets/images/Ellipse 9.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

