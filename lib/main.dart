import 'package:chat_try/app_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart' as provider;

import 'chat_page.dart';
import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://nkcjowbprsgovbwbnsxw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5rY2pvd2JwcnNnb3Zid2Juc3h3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTcxNDMwNjgsImV4cCI6MjAxMjcxOTA2OH0.0h8KfdX7721L9zL8562_Qt6yk1GgeiM4WSv8TtU39c4',
  );

  runApp(
    provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider<AppService>(
          create: (_) => AppService(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
      routes: {
        '/chat': (_) => const ChatPage(),
      },
    );
  }
}
