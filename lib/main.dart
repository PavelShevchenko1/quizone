import 'package:flutter/material.dart';
import 'package:quizeone/global.dart';
import 'package:quizeone/welcome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quize one',
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: "Monserrat"),
      home: const HomePage(),
    );
  }
}

enum QuizState { welcome, passing, done }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController backCtrl =
      AnimationController(vsync: this, duration: slowDuration);
  late Animation<Alignment> backTopAnim =
      AlignmentTween(begin: Alignment.topLeft, end: Alignment.centerLeft)
          .animate(CurvedAnimation(parent: backCtrl, curve: Curves.decelerate));
  late Animation<Alignment> backBottomAnim =
      AlignmentTween(begin: Alignment.bottomRight, end: Alignment.centerRight)
          .animate(CurvedAnimation(
              parent: backCtrl, curve: Curves.fastLinearToSlowEaseIn));

  double screenOpacity = 1;
  QuizState currentState = QuizState.welcome;

  @override
  void initState() {
    backCtrl
      ..forward()
      ..addListener(() {
        if (backCtrl.isCompleted) {
          backCtrl.reverse();
        }
        if (backCtrl.isDismissed) {
          backCtrl.forward();
        }
      });
    super.initState();
  }

  // switchScreen(QuizState s) async {
  //   setState(() {
  //     screenOpacity = 0;
  //   });
  //   await Future.delayed(defaultDuration);
  //   setState(() {
  //     currentState = s;
  //     screenOpacity = 1;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: AnimatedBuilder(
          animation: backCtrl,
          builder: (context, child) {
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [c1, c3],
                      begin: backTopAnim.value,
                      end: backBottomAnim.value)),
              child: child,
            );
          },
          child: AnimatedOpacity(
            duration: defaultDuration,
            opacity: screenOpacity,
            child: Welcome()),
          ),
        ),
      );
  }
}
