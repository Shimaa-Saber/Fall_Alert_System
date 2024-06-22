import 'package:dio/dio.dart';
import 'package:fall_detection/core/routes/app_route.dart';
import 'package:fall_detection/core/services/network/api/dio_consumer.dart';
import 'package:fall_detection/feature/auth/data/logic/activate_cubit/activate_cubit.dart';
import 'package:fall_detection/feature/auth/presentation/views/activate_user_screen.dart';
import 'package:fall_detection/feature/home/data/logic/home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class FallDetectionApp extends StatelessWidget {
  const FallDetectionApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => ActivateUserCubit(DioConsumer(dio: Dio())),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        // splitScreenMode: true,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            // initialRoute: Routes.onBoardingScreen,
            // onGenerateRoute: appRouter.generateRoute,
            home: ActivateUserAccount(),
          ),
        ),
      ),
    );
  }
}
