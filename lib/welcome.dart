import 'package:flutter/material.dart';
import 'package:quizeone/data.dart';
import 'package:quizeone/main.dart';
import 'package:quizeone/quizpass.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key, });
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  List<String> icons =
      List.generate(8, (index) => "assets/tile${index + 1}.jpg");
  late List<String> icons1 = shuffle(icons);
  late List<String> icons2 = shuffle(icons);
  late List<String> icons3 = shuffle(icons);
  ScrollController ctrl1 = ScrollController();
  ScrollController ctrl2 = ScrollController();
  ScrollController ctrl3 = ScrollController();

  shuffle(List<String> s) {
    List<String> x = List.from(s);
    x.shuffle();
    return x;
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController controller) {
    controller
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, controller);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ctrl1.hasClients) {
        animateToMaxMin(
            ctrl1.position.maxScrollExtent,
            ctrl1.position.minScrollExtent,
            ctrl1.position.maxScrollExtent,
            35,
            ctrl1);
      }
      if (ctrl2.hasClients) {
        animateToMaxMin(
            ctrl2.position.maxScrollExtent,
            ctrl2.position.minScrollExtent,
            ctrl2.position.minScrollExtent,
            40,
            ctrl2);
      }
      if (ctrl3.hasClients) {
        animateToMaxMin(
            ctrl3.position.maxScrollExtent,
            ctrl3.position.minScrollExtent,
            ctrl3.position.maxScrollExtent,
            45,
            ctrl3);
      }
    });
  }

  disps() {
    ctrl1.removeListener(() {});
    ctrl2.removeListener(() {});
    ctrl3.removeListener(() {});
    ctrl1.dispose();
    ctrl2.dispose();
    ctrl3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: 700,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                // shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                children: [
                  IconTileList(ctrl1: ctrl1, icons: icons1),
                  IconTileList(ctrl1: ctrl2, icons: icons2),
                  IconTileList(ctrl1: ctrl3, icons: icons3),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Твоя игра",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(2, 2)),
                    ],
                    fontSize: 25),
              ),
              Text(
                "Узнай какая киберспортивная игра больше всего тебе подходит?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(color: Colors.black, offset: Offset(2, 2))
                ]),
              ),
              SizedBox(
                height: 80,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuizPass(),));
                  },
                  icon: Icon(Icons.play_arrow_rounded),
                  label: Text("Начать"))
            ],
          ),
        )
      ],
    );
    ;
  }
}

class IconTileList extends StatelessWidget {
  const IconTileList({
    Key? key,
    required this.ctrl1,
    required this.icons,
  }) : super(key: key);

  final ScrollController ctrl1;
  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2000,
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        controller: ctrl1,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            width: 250,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(icons[index % icons.length]))
                // Text(icons[index % icons.length])
                ),
          );
        },
      ),
    );
  }
}
