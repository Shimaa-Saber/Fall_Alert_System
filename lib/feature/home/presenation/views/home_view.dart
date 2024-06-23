import 'package:fall_detection/core/services/network/api/api_endpoints.dart';
import 'package:fall_detection/core/services/shared_prefrences/shared_pref.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:fall_detection/core/styles/images/assets.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/home/data/logic/home_cubit/home_cubit.dart';
import 'package:fall_detection/feature/home/data/logic/home_cubit/home_state.dart';
import 'package:fall_detection/feature/home/presenation/widgets/drawer_widget.dart';
import 'package:fall_detection/feature/home/presenation/widgets/list_view_patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/patient_card.dart';
import '../widgets/search_widget.dart';
// import '..\..\..\..\core\styles\images\assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // static String id = 'home';

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);

    // Fetch data when the screen is built
    cubit.getHomeScreenData(
      token: CacheHelper.sharedPreferences.getString(ApiKey.token) ?? '',
    );

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeErrorState) {
          // Print the error message for debugging purposes
          print('Error: ${state.message}');
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeLoaded) {
          return Scaffold(
            drawer: const DrawerWidget(),
            body: Padding(
              //horizontal: 16, vertical: 45
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 45.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: AppColors.primaryColor,
                            size: 32,
                          ),
                        ),
                        horizontalSpace(20),
                        const SearchWidget(),
                      ],
                    ),
                    verticalSpace(20),
                    ListViewPatient(
                      itemCount: state.alerts.length,
                      imagePatient: state.alerts[0].user.name,
                      patientName: state.alerts[0].user.name,
                    ),
                    SizedBox(
                      height: 531.h,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: state.alerts.length,
                        itemBuilder: (context, index) {
                          final alert = state.alerts[index];
                          return PatientCard(
                            patientImage: alert.user.photo,
                            patientName: alert.user.name,
                            date: alert.createdAt,
                            patientLocationImage:
                                AppAssetsImages.onboardingImage,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is HomeErrorState) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('Unexpected state'));
        }
      },
    );
  }
}
