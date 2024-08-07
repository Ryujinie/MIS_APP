import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/features/screens/login_screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:ssi_mis_flutter/provider/index.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<IndexProvider>(
          create: (context) => IndexProvider(),
        ),
        ChangeNotifierProvider<EmpFormIndexProvider>(
          create: (context) => EmpFormIndexProvider(),
        ),
        ChangeNotifierProvider<TabViewAdminProvider>(
          create: (context) => TabViewAdminProvider(),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MIS',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
