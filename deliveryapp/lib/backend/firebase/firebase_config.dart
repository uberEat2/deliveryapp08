import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAelyv-vcfZMZdyhOY-9uwjyEQEh3a74ZY",
            authDomain: "deliveryapp-ceb6b.firebaseapp.com",
            projectId: "deliveryapp-ceb6b",
            storageBucket: "deliveryapp-ceb6b.appspot.com",
            messagingSenderId: "126951013002",
            appId: "1:126951013002:web:11a575b8039d23a7e90b73",
            measurementId: "G-7GJHK0LZX7"));
  } else {
    await Firebase.initializeApp();
  }
}
