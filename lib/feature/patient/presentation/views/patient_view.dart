import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/feature/patient/presentation/manger/PatientCubits/PatientCubits.dart';
import 'package:fall_detection/feature/patient/presentation/manger/PatientCubits/PatientStates.dart';
import 'package:fall_detection/feature/patient/presentation/views/widgets/patiant_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/styles/colors/colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../profile/presenation/widgets/row_info_widget.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});
  static String id = 'patient_view';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        if (state is PatientFailer) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: AppColors.primaryColor,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is PatientLoading
              ? Center(child: const CircularProgressIndicator())
              : state is PatientSucess
              ? Container(
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
                                RowInfoWidget(
                                  icon: Icons.male,
                                  text: state.patient.gender,
                                ),
                                verticalSpace(16),
                                RowInfoWidget(
                                  icon: Icons.phone,
                                  text: state.patient.phone,
                                ),
                                verticalSpace(16),
                                RowInfoWidget(
                                  icon: Icons.calendar_month_sharp,
                                  text: state.patient.dateOfBirth,
                                ),
                                verticalSpace(16),
                                RowInfoWidget(
                                  icon: Icons.warning_amber,
                                  text: state.patient.emergency,
                                ),
                                verticalSpace(25),
                                Row(
                                  children: [
                                    Text(
                                      'Contact List',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19.sp,
                                      ),
                                    ),
                                    horizontalSpace(25),
                                    Text(
                                      '${state.patient.contactList.length} contacts',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.sp,
                                      ),
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
                                    height: context.height * 0.13,
                                    child: ListView.builder(
                                      itemCount: state.patient.contactList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context, Routes.ChatView);
                                            },
                                            child: patiant_list_item(contact: state.patient.contactList[index]),
                                          ),
                                        );
                                      },
                                    ),
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
                          NetworkImage(state.patient.photo),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
              : Container(),
        );
      },
    );
  }
}
