import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_app/utils/index.dart';

import 'screens/index.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LoginReference().readAll();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warehouse',
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      themeMode: ThemeMode.dark,
      builder: BotToastInit(),
      home: startup(),
      navigatorObservers: [BotToastNavigatorObserver()],
      navigatorKey: AppNavigation.navKey,
      onGenerateRoute: Routing.onManagerGenerateRoute,
    );
  }

  Widget startup() {
    return const LoginScreen();

    if (LoginReference().accessToken != null) {
      return const HomeScreen();
    }

    return const LoginScreen();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('MyApp state = $state');
    if (state == AppLifecycleState.inactive) {
      // app transitioning to other state.
    } else if (state == AppLifecycleState.paused) {
      // app is on the background.
    } else if (state == AppLifecycleState.detached) {
      // flutter engine is running but detached from views
    } else if (state == AppLifecycleState.resumed) {
      print("object");
    }
  }
}
