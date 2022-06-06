// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newProj/auth/edit_profile.dart';
import 'package:newProj/auth/sign_in.dart';
import 'package:newProj/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:newProj/providers/user_info.dart';
import 'package:newProj/test_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import './profile.dart';
import './auth/login_screen.dart';
import './auth/sign_in.dart';
import 'auth/change_passes.dart';
import './categories/page_to_leave.dart';
import './categories/categorie_name.dart';
import './http requests/super_plan.dart';
import './help_screen/help_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseMessaging.instance.setAutoInitEnabled(true); //uncomment soon
  // final fcmToken = await FirebaseMessaging.instance.getToken();

  // SharedPreferences prefs = await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => UserFood(),
          ),
        ],
        child: EasyLocalization(
          path: 'assets/translations',
          fallbackLocale: Locale('ar'),
          child: MyApp(),
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
        ),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme:
            TextTheme(headline5: TextStyle(color: Colors.white, fontSize: 20)),
        primarySwatch: Colors.green,
        accentColor: Colors.pinkAccent,
        secondaryHeaderColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomePage(),
      routes: {
        '/': (ctx) => HomePage(),
        PersonalProfile.routeName: (ctx) => PersonalProfile(),
        SignUp.routeName: (ctx) => SignUp(),
        EditProfile.routeName: (ctx) => EditProfile(),
        SignInScreen.routeName: (ctx) => SignInScreen(),
        ChangePasses.routeName: (ctx) => ChangePasses(),
        Test.routeName: (ctx) => Test(),
        CategorieNameScreen.routeName: (ctx) => CategorieNameScreen(),
        PageToLeave.routeName: (ctx) => PageToLeave(),
        SuperPlan.routeName: (ctx) => SuperPlan(),
        HelpScreen.routeName:(ctx)=> HelpScreen()
      },
    );
  }
}
