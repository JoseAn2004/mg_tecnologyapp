// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCTjk8fZ6JiYpyPTVEZwrrnN129ULlbOYk',
    appId: '1:609307343747:web:e573c79c86834855d414b6',
    messagingSenderId: '609307343747',
    projectId: 'appmgv1-1ac26',
    authDomain: 'appmgv1-1ac26.firebaseapp.com',
    databaseURL: 'https://appmgv1-1ac26-default-rtdb.firebaseio.com',
    storageBucket: 'appmgv1-1ac26.appspot.com',
    measurementId: 'G-DH0Y66M00Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvY80T4IS6leh2-YpKN_iYQrIyhVrXUxY',
    appId: '1:609307343747:android:b4665068696ef8cfd414b6',
    messagingSenderId: '609307343747',
    projectId: 'appmgv1-1ac26',
    databaseURL: 'https://appmgv1-1ac26-default-rtdb.firebaseio.com',
    storageBucket: 'appmgv1-1ac26.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJ6Ei3m-0NqEefbcOwWOowSjbVnyCIDZo',
    appId: '1:609307343747:ios:85eff2c9fcdbc4d1d414b6',
    messagingSenderId: '609307343747',
    projectId: 'appmgv1-1ac26',
    databaseURL: 'https://appmgv1-1ac26-default-rtdb.firebaseio.com',
    storageBucket: 'appmgv1-1ac26.appspot.com',
    iosBundleId: 'com.mgtecno.appmgtecnology',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJ6Ei3m-0NqEefbcOwWOowSjbVnyCIDZo',
    appId: '1:609307343747:ios:85eff2c9fcdbc4d1d414b6',
    messagingSenderId: '609307343747',
    projectId: 'appmgv1-1ac26',
    databaseURL: 'https://appmgv1-1ac26-default-rtdb.firebaseio.com',
    storageBucket: 'appmgv1-1ac26.appspot.com',
    iosBundleId: 'com.mgtecno.appmgtecnology',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCTjk8fZ6JiYpyPTVEZwrrnN129ULlbOYk',
    appId: '1:609307343747:web:2af7da9375f66bfad414b6',
    messagingSenderId: '609307343747',
    projectId: 'appmgv1-1ac26',
    authDomain: 'appmgv1-1ac26.firebaseapp.com',
    databaseURL: 'https://appmgv1-1ac26-default-rtdb.firebaseio.com',
    storageBucket: 'appmgv1-1ac26.appspot.com',
    measurementId: 'G-6HDBGN6FCZ',
  );
}
