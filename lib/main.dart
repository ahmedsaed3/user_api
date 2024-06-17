import 'package:flutter/material.dart';
import 'screens/app_routing.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
   runApp(BraekingBadApp(appRouter: AppRouting(),));
 }

 class BraekingBadApp extends StatelessWidget {
 final AppRouting appRouter;

   const BraekingBadApp({super.key, required this.appRouter});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       onGenerateRoute: appRouter.generateRoute,
     );

   }
 }
