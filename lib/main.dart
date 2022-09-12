import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:magzgrowth_web/Repository/routegenerator.dart';
import 'package:magzgrowth_web/Repository/routes.dart';
import 'package:magzgrowth_web/firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';

Future main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MyHomePage(title: 'Ovation',
      child: child),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.Homepage,
      title: 'Magzgrowth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home:  const MyHomePage(title: 'Ovation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Widget? child;
   const MyHomePage({Key? key, required this.title, this.child}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/14.4),
            child: Text(widget.title,style: const TextStyle(fontFamily: "Poppins"),)),
      ),
      body: Center(
        child: widget.child// This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
