// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCqjvj_NTQZCfxvb0-vsDJsjXBqCd6ZU0U',
    appId: '1:189546112079:web:cbfbb096e24b917396b63a',
    messagingSenderId: '189546112079',
    projectId: 'olxapp-f50a9',
    authDomain: 'olxapp-f50a9.firebaseapp.com',
    storageBucket: 'olxapp-f50a9.appspot.com',
    measurementId: 'G-15NE0115KL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsaZLhU219vDVaVD_g7nbR4LnGnTWxpw4',
    appId: '1:189546112079:android:7f7c087c87e4642096b63a',
    messagingSenderId: '189546112079',
    projectId: 'olxapp-f50a9',
    storageBucket: 'olxapp-f50a9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAz9-EZJi7AIPj27diZT58_U55hohh3v_Q',
    appId: '1:189546112079:ios:c252ffa3bc7e0b5c96b63a',
    messagingSenderId: '189546112079',
    projectId: 'olxapp-f50a9',
    storageBucket: 'olxapp-f50a9.appspot.com',
    androidClientId: '189546112079-uu85on6qn2ev9ga9gnhhs0j6os09opa0.apps.googleusercontent.com',
    iosClientId: '189546112079-ob1q0c0c4cven773of6vc5rmfrcr7cjr.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebase2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAz9-EZJi7AIPj27diZT58_U55hohh3v_Q',
    appId: '1:189546112079:ios:a7186fcea158898996b63a',
    messagingSenderId: '189546112079',
    projectId: 'olxapp-f50a9',
    storageBucket: 'olxapp-f50a9.appspot.com',
    androidClientId: '189546112079-uu85on6qn2ev9ga9gnhhs0j6os09opa0.apps.googleusercontent.com',
    iosClientId: '189546112079-81vkomtto00t7eliq338idf3o1u226au.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebase2.RunnerTests',
  );
}
