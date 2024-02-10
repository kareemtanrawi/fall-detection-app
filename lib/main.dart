// // import 'package:fall_detection_app/screens/auth/login_page.dart';
// // import 'package:fall_detection_app/screens/auth/signup_screen.dart';
// // import 'package:fall_detection_app/screens/cargiverprofile/cargiverprofile.dart';
// // import 'package:fall_detection_app/screens/homepage/homepage.dart';
// // import 'package:fall_detection_app/screens/initial/initial_page.dart';
// // import 'package:fall_detection_app/screens/map/map.dart';
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const FallDetectionApp());
// // }

// // class FallDetectionApp extends StatelessWidget {
// //   const FallDetectionApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       routes: {
// //         InitialPage.id: (context) => const InitialPage(),
// //         LoginPage.id: (context) => LoginPage(),
// //         RegisterPage.id: ((context) => RegisterPage()),
// //         Cargiverprofile.id: ((context) => const Cargiverprofile()),
// //         homepageView.id: ((context) => const homepageView()),
// //         MapPage.id: ((context) => MapPage()),
// //       },
// //       initialRoute: InitialPage.id,
// //     );
// //   }
// // }

// import 'package:dio/dio.dart';
// import 'package:fall_detection_app/screens/auth/login_page.dart';
// import 'package:fall_detection_app/screens/auth/signup_screen.dart';
// import 'package:fall_detection_app/screens/cargiverprofile/cargiverprofile.dart';
// import 'package:fall_detection_app/screens/homepage/homepage.dart';
// import 'package:fall_detection_app/screens/initial/initial_page.dart';
// import 'package:fall_detection_app/screens/map/map.dart';
// import 'package:fall_detection_app/screens/notifications/notifications.dart';
// import 'package:fall_detection_app/screens/patientprofile/patientprofile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'cache/cache_helper.dart';
// import 'cubits/AuthCubit/AuthCubit.dart';
// import 'helper/api/dio_consumer.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   CacheHelper().init();

//   runApp(BlocProvider(
//       create: (context) => UserCubit(DioConsumer(dio: Dio())),
//       child: const FallDetectionApp()));
// }

// class FallDetectionApp extends StatelessWidget {
//   const FallDetectionApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: InitialPage.id,
//       routes: {
//         InitialPage.id: (context) => const InitialPage(),
//         LoginPage.id: (context) => LoginPage(),
//         RegisterPage.id: ((context) => RegisterPage()),
//         Cargiverprofile.id: ((context) => Cargiverprofile()),
//         homepageView.id: ((context) => homepageView()),
//         Notifications.id: ((context) => Notifications()),
//         MapPage.id: ((context) => MapPage()),
//         PatientInfo.id: ((context) => PatientInfo()),
//       },

//     );
//   }
// }
import 'package:dio/dio.dart';
import 'package:fall_detection_app/cache/cache_helper.dart';
import 'package:fall_detection_app/cubits/AuthCubit/AuthCubit.dart';
import 'package:fall_detection_app/helper/api/dio_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/initial/initial_page.dart';
import 'screens/auth/login_page.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/cargiverprofile/cargiverprofile.dart';
import 'screens/homepage/homepage.dart';
import 'screens/map/map.dart';
import 'screens/notifications/notifications.dart';
import 'screens/patientprofile/patientprofile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(DioConsumer(dio: Dio())),
      child: FallDetectionApp(),
    ),
  );
}

class FallDetectionApp extends StatelessWidget {
  const FallDetectionApp({super.key});

  Route<dynamic> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case InitialPage.id:
        return MaterialPageRoute(builder: (_) => const InitialPage());
      case LoginPage.id:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RegisterPage.id:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case Cargiverprofile.id:
        return MaterialPageRoute(builder: (_) => Cargiverprofile());
      case homepageView.id:
        return MaterialPageRoute(builder: (_) => homepageView());
      case Notifications.id:
        return MaterialPageRoute(builder: (_) => Notifications());
      case MapPage.id:
        return MaterialPageRoute(builder: (_) => MapPage());
      case PatientInfo.id:
        final args = settings.arguments as Map<String, dynamic>?;
        if (args != null) {
          return MaterialPageRoute(
            builder: (_) => PatientInfo(
              detailID: args['detailID'],
              fallEventID: args['fallEventID'],
            ),
          );
        } else {
          // Handle the case where args is null
          return _errorRoute("No data available for PatientInfo");
        }
      default:
        // Handling undefined routes
        return _errorRoute("Page not found");
    }
  }

  Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Error"),
          ),
          body: Center(child: Text(message)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: InitialPage.id,
      onGenerateRoute: _generateRoute,
    );
  }
}
