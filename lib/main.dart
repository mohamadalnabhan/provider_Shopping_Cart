import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_provider/home.dart';
import 'package:shopping_cart_provider/models/cart.dart';
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>Cart() )
  ],child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  
    home: Home(),
    );
  }
}
