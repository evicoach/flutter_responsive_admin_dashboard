import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/screens/authentication/presentation/screens/login_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'injection_container.dart';
import 'screens/authentication/presentation/bloc/auth_bloc.dart';
import 'screens/authentication/presentation/bloc/user_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
          BlocProvider<AuthBloc>(
            create: (BuildContext context) => serviceLocator(),
          ),
          BlocProvider<UserBloc>(
            create: (BuildContext context) => serviceLocator(),
          ),
        ],
        child: LoginScreen(),
      ),
    );
  }
}
