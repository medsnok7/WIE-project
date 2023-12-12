import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:wie/authentification/login.dart';
import 'package:wie/authentification/register.dart';
import 'package:wie/services/auth_services.dart';
import 'package:wie/ui/colors.dart';

// void setupLocator() {
//   GetIt.instance.registerLazySingleton(() => UsersService());
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerLazySingleton(() => UsersService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Builder(builder: (context) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            iconTheme: const IconThemeData(color: AppColors.backgroundColor),
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.themeColor),
            useMaterial3: true,
          ),
          routes: {
            '/': (context) => const LoginView(),
            '/signup': (context) => const RegisterView(),
            // '/create': (context) => const CartView(),
            // '/home': (context) => const HomeView(),
            // '/profile': (context) => const ProfileView(),
            // '/explore': (context) => ExploreView(
            //       controller: ScrollController(),
            //     ),
          },
        );
      }),
    );
  }
}
