// import 'package:fall_detection/core/services/network/api/api_endpoints.dart';
// import 'package:fall_detection/core/services/shared_prefrences/shared_pref.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fall_detection/feature/home/data/logic/home_cubit/home_cubit.dart';
// import 'package:fall_detection/feature/home/data/logic/home_cubit/home_state.dart';
// import 'package:fall_detection/feature/home/data/models/home_screen_model.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final MapController controller = MapController(
//     // initMapWithUserPosition: const UserTrackingOption(
//     //   enableTracking: true,
//     // ),
//     initPosition: GeoPoint(latitude: 51.5, longitude: -0.09),
//   );

//   @override
//   void initState() {
//     super.initState();
//     fetchHomeScreenData();
//   }

//   void fetchHomeScreenData() {
//     final homeCubit = context.read<HomeCubit>();
//     homeCubit.getHomeScreenData(
//       token: CacheHelper.sharedPreferences.getString(ApiKey.token) ?? '',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('OpenStreetMap Example'),
//       ),
//       body: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           if (state is HomeLoadingState) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is HomeLoaded) {
//             addMarkers(state.alerts);
//             return OSMFlutter(
//               osmOption: const OSMOption(
//                 roadConfiguration: RoadOption(
//                   roadColor: Colors.yellowAccent,
//                   roadWidth: 2.0,
//                   zoomInto: true,
//                 ),
//               ),
//               controller: controller,
//               onGeoPointClicked: (p0) {
//                 print(p0);
//               },
//               // onMapMoved: (p0) {
//               //   print(p0);
//               // },
//               onLocationChanged: (p0) {
//                 print(p0);
//               },
//               onMapIsReady: (p0) {
//                 print(p0);
//               },
//             );
//           } else if (state is HomeErrorState) {
//             return Center(child: Text(state.message));
//           } else {
//             return const Center(child: Text('Unknown state'));
//           }
//         },
//       ),
//     );
//   }

//   // ignore: non_constant_identifier_names
//   Future<void> addMarkers(List<HomeScreenModel> HomeScreenModel) async {
//     for (var person in HomeScreenModel) {
//       await controller.addMarker(
//         GeoPoint(
//           latitude: person.latitude,
//           longitude: person.longitude,
//         ),
//         markerIcon: MarkerIcon(
//           iconWidget: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       PatientProfileScreen(personId: person.id),
//                 ),
//               );
//             },
//             child: const Icon(
//               Icons.location_on,
//               color: Colors.red,
//               size: 48,
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }

// class PatientProfileScreen extends StatelessWidget {
//   final int personId;

//   const PatientProfileScreen({super.key, required this.personId});

//   @override
//   Widget build(BuildContext context) {
//     // Fetch and display patient details using personId
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Patient Profile'),
//       ),
//       body: Center(
//         child: Text('Patient ID: $personId'),
//       ),
//     );
//   }
// }
import 'package:fall_detection/core/services/network/api/api_endpoints.dart';
import 'package:fall_detection/core/services/shared_prefrences/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fall_detection/feature/home/data/logic/home_cubit/home_cubit.dart';
import 'package:fall_detection/feature/home/data/logic/home_cubit/home_state.dart';
import 'package:fall_detection/feature/home/data/models/home_screen_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController controller = MapController(
    initPosition: GeoPoint(latitude: 51.5, longitude: -0.09),
  );

  @override
  void initState() {
    super.initState();
    fetchHomeScreenData();
  }

  void fetchHomeScreenData() {
    final homeCubit = context.read<HomeCubit>();
    homeCubit.getHomeScreenData(
      token: CacheHelper.sharedPreferences.getString(ApiKey.token) ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenStreetMap Example'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            addMarkers(state.alerts);
            return OSMFlutter(
              osmOption: const OSMOption(
                roadConfiguration: RoadOption(
                  roadColor: Colors.yellowAccent,
                  roadWidth: 2.0,
                  zoomInto: true,
                ),
              ),
              controller: controller,
              onGeoPointClicked: (p0) {
                print(p0);
              },
              onLocationChanged: (p0) {
                print(p0);
              },
              onMapIsReady: (p0) {
                print(p0);
              },
            );
          } else if (state is HomeErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }

  Future<void> addMarkers(List<HomeScreenModel> homeScreenModels) async {
    for (var person in homeScreenModels) {
      try {
        await controller.addMarker(
          GeoPoint(
            latitude: person.latitude,
            longitude: person.longitude,
          ),
          markerIcon: MarkerIcon(
            iconWidget: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PatientProfileScreen(personId: person.id),
                  ),
                );
              },
              child: const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 48,
              ),
            ),
          ),
        );
      } catch (e) {
        print('Error adding marker for person ${person.id}: $e');
      }
    }
  }
}

class PatientProfileScreen extends StatelessWidget {
  final int personId;

  const PatientProfileScreen({super.key, required this.personId});

  @override
  Widget build(BuildContext context) {
    // Fetch and display patient details using personId
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Profile'),
      ),
      body: Center(
        child: Text('Patient ID: $personId'),
      ),
    );
  }
}
