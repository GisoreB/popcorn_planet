import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDYaZwr5Q8YOmPU1hrP3Sgt3zkImjREMfE",
            authDomain: "popcorn-planet-e6bbf.firebaseapp.com",
            projectId: "popcorn-planet-e6bbf",
            storageBucket: "popcorn-planet-e6bbf.firebasestorage.app",
            messagingSenderId: "844920342645",
            appId: "1:844920342645:web:caa300844cd75085ba503c",
            measurementId: "G-E46MJDZBPS"));
  } else {
    await Firebase.initializeApp();
  }
}
