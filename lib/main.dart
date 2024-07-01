import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/madules/Register/who.dart';
import 'firebase_options.dart';
import 'helper/shared.dart';
import 'madules/Login/a_Login.dart';
import 'madules/Login/d_Login.dart';
import 'madules/Login/p_Login.dart';
import 'madules/Register/map_gloply.dart';
import 'madules/Register/register_assistant.dart';
import 'madules/Register/register_doctor.dart';
import 'madules/Register/register_patient.dart';
import 'madules/assistant/assistant.dart';
import 'madules/doctor/doctor.dart';
import 'madules/what_want/whowont.dart';
import 'view/onboarding/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPaintSizeEnabled = true;
  await CacheHelper.init();

  token = CacheHelper.getData(key: 'token');
  page = CacheHelper.getData(key: 'collection');
  splash = CacheHelper.getData(key: "splash");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        OnBoarding.id: (context) => const OnBoarding(),
        r_assistant.id: (context) => const r_assistant(),
        r_doctor.id: (context) => const r_doctor(),
        doctor.id: (context) => const doctor(),
        assistant.id: (context) => const assistant(),
        r_patient.id: (context) => r_patient(),
        login.id: (context) => const login(),
        a_login.id: (context) => const a_login(),
        d_login.id: (context) => const d_login(),
        whowant.id: (context) => const whowant(),
        whoscrean.id: (context) => const whoscrean(),
        MapGloply.id: (context) => const MapGloply(),
      },
      initialRoute: splash == false || splash == null
          ? OnBoarding.id
          : (token == '' || token == null)
              ? whoscrean.id
              : page == assistant.id
                  ? assistant.id
                  : page == doctor.id
                      ? doctor.id
                      : whowant.id,
    );
  }
}
