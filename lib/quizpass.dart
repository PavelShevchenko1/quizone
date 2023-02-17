import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:quizeone/data.dart';
import 'package:quizeone/final.dart';
import 'package:quizeone/global.dart';
import 'package:quizeone/main.dart';

class QuizPass extends StatefulWidget {
  const QuizPass({super.key});

  @override
  State<QuizPass> createState() => _QuizPassState();
}

class _QuizPassState extends State<QuizPass> with TickerProviderStateMixin {
  int curPage = 0;
  PageController ctrl = PageController(initialPage: 0);
  Map<G, int> result = {for (var g in G.values) g: 0};
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

  int currentQuestion = 0;

  moveForward() async {
    await ctrl.animateToPage(currentQuestion + 1,
        duration: defaultDuration, curve: Curves.linear);
  }
@override
  void dispose() {
    backCtrl.dispose();
    super.dispose();
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
   
    super.initState();
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
          child: AnimatedOpacity(
              duration: defaultDuration,
              opacity: screenOpacity,
              child: Container(
                width: width,
                height: height,
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 40, bottom: 10),
                child: PageView.builder(
                  onPageChanged: (value) {
                    print("${value}/${all.length}");
                    setState(() {
                      currentQuestion = value;
                    });
                  },
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: all.length,
                  controller: ctrl,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(all[index].image)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              all[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(2, 2)),
                                  ],
                                  fontSize: 18),
                            ),
                          ),
                          Column(
                            children: [
                              ...List.generate(
                                all[index].items.length,
                                (i) {
                                  QItem item = all[index].items[i];
                                  return Bounce(
                                      duration: defaultDuration,
                                      onPressed: () {
                                        setState(() {
                                          result[item.value] =
                                              result[item.value]! + 1;
                                        });
                                        if ((currentQuestion + 1) < all.length) {
                                          moveForward();
                                        } else {
                                          print(result.toString());
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ResultPass(result: result),));
                                        }
                                      },
                                      child:
                                          OneButton(width: width, item: item));
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )),
        ),
      ),
    );
  }
}

class OneButton extends StatefulWidget {
  const OneButton({
    Key? key,
    required this.width,
    required this.item,
  }) : super(key: key);

  final double width;
  final QItem item;

  @override
  State<OneButton> createState() => _OneButtonState();
}

class _OneButtonState extends State<OneButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 48,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.grey.shade200.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          widget.item.text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, shadows: [
            Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 5)
          ]),
        ),
      ),
    );
  }
}
