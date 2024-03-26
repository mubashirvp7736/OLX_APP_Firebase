import 'package:firebase2/controller/authentication_provider.dart';
import 'package:firebase2/controller/product_provider.dart';
import 'package:firebase2/controller/reg_provider.dart';
import 'package:firebase2/firebase_options.dart';
import 'package:firebase2/view/authentication_screen/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void>main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LoginProvider(),),
      ChangeNotifierProvider(create: (context) => RegisterProvider(),),
     ChangeNotifierProvider(create: (context) => ProductProvid(),)
      
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
         home:
           AuthPage(),
         debugShowCheckedModeBanner: false,
      )
    );
      }
      }