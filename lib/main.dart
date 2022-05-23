import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/providers/counter_provider.dart';
import 'package:provider_counter/providers/shopping_cart_provider.dart';
import 'package:provider_counter/screens/myHomePage_screen.dart';
import 'package:provider_counter/screens/second_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => ShoppingCart())
      ],
      child: const MyApp(),
    )
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/' : (context) => const MyHomePage(),
        '/second': (context) => const SecondScreen()
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
