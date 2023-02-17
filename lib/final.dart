import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:quizeone/data.dart';
import 'package:quizeone/global.dart';
import 'package:quizeone/main.dart';

class ResultPass extends StatefulWidget {
  const ResultPass({super.key, required this.result});
  final Map<G, int> result;
  @override
  State<ResultPass> createState() => _ResultPassState();
}

class _ResultPassState extends State<ResultPass> with TickerProviderStateMixin {
  late Map<G, int> result = widget.result;
  late AnimationController backCtrl =
      AnimationController(vsync: this, duration: slowDuration);
  late Animation<Alignment> backTopAnim =
      AlignmentTween(begin: Alignment.topLeft, end: Alignment.centerLeft)
          .animate(CurvedAnimation(parent: backCtrl, curve: Curves.decelerate));
  late Animation<Alignment> backBottomAnim =
      AlignmentTween(begin: Alignment.bottomRight, end: Alignment.centerRight)
          .animate(CurvedAnimation(
              parent: backCtrl, curve: Curves.fastLinearToSlowEaseIn));

  late ConfettiController confettiCtrl =
      ConfettiController(duration: Duration(seconds: 5));

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  G theMost() {
    int thevalue = 0;
    G thekey = G.pubg;
    result.forEach((k, v) {
      if (v > thevalue) {
        thevalue = v;
        thekey = k;
      }
    });
    return thekey;
  }

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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 1));
      confettiCtrl.play();
    });
    super.initState();
  }
  @override
  void dispose() {
    backCtrl.dispose();
    super.dispose();
  }

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
          child: Builder(
            builder: (context) {
              Result r = results[theMost()]!;
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(r.image)),
                    SizedBox(
                      height: 50,
                    ),
                    ConfettiWidget(
                        confettiController: confettiCtrl,
                        blastDirectionality: BlastDirectionality
                            .explosive, // don't specify a direction, blast randomly // start again as soon as the animation is finished
                        colors: const [
                          Colors.green,
                          Colors.blue,
                          Colors.pink,
                          Colors.orange,
                          Colors.purple
                        ], // manually specify the colors to be used
                        createParticlePath: drawStar),
                    Text(
                        r.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white, shadows: [
                          Shadow(
                              color: Colors.black,
                              offset: Offset(2, 2),
                              blurRadius: 5)
                        ])),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        "Характер стойкий, нордический. Играть в ${r.name} может только человек со стальными нервами. Однако всё, что о тебе можно сказать, — в тихом омуте черти водятся.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, shadows: [
                          Shadow(
                              color: Colors.black,
                              offset: Offset(2, 2),
                              blurRadius: 5)
                        ])),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("Понятно"))
                  ],
                ),
              );
            },
          )),
    ));
  }
}
