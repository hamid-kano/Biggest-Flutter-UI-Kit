import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/confetti/confetti.dart';

class CHomePage extends StatefulWidget {
  static String tag = '/CHomePage';

  @override
  _CHomePageState createState() => _CHomePageState();
}

class _CHomePageState extends State<CHomePage> {
  //  Use this to control the duration.
  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    //  Set the duration of the animation
    _controllerCenter = ConfettiController(duration: const Duration(seconds: 5));
    _controllerCenterRight = ConfettiController(duration: const Duration(seconds: 5));
    _controllerCenterLeft = ConfettiController(duration: const Duration(seconds: 5));
    _controllerTopCenter = ConfettiController(duration: const Duration(seconds: 5));
    _controllerBottomCenter = ConfettiController(duration: const Duration(seconds: 5));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Confetti'),
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(4),
                  child: Lottie.asset('images/integrations/img/confitte.json'),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: <Widget>[
                        Text('Congratulations !!', style: boldTextStyle(size: 30)),
                      ],
                    )),
              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                //   don't specify a direction, blast randomly
                blastDirectionality: BlastDirectionality.explosive,
                //  start again as soon as the animation is finished
                shouldLoop: false,
                //  speed of the animation
                emissionFrequency: 0.1,
                canvas: Size.fromRadius(MediaQuery.of(context).size.height * .35),
                colors: const [
                  //  manually specify the colors to be used
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ], // manually specify the colors to be used
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 150),
              alignment: Alignment.bottomCenter,
              child: ConfettiWidget(
                confettiController: _controllerBottomCenter,
                blastDirectionality: BlastDirectionality.explosive,
                // don't specify a direction, blast randomly
                shouldLoop: false,
                //
                emissionFrequency: 0.3,

                canvas: Size.fromRadius(350),
                colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple], // manually specify the colors to be used
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: ConfettiWidget(
                confettiController: _controllerCenterRight,
                blastDirectionality: BlastDirectionality.explosive,
                // don't specify a direction, blast randomly
                shouldLoop: false,
                //
                emissionFrequency: 0.2,
                canvas: Size.fromRadius(MediaQuery.of(context).size.height * .35),
                colors: const [Colors.black, Colors.redAccent, Colors.tealAccent, Colors.yellowAccent, Colors.orange], // manually specify the colors to be used
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: ConfettiWidget(
                confettiController: _controllerCenterLeft,
                blastDirectionality: BlastDirectionality.explosive,
                // don't specify a direction, blast randomly
                shouldLoop: false,
                //
                canvas: Size.fromRadius(MediaQuery.of(context).size.height * .35),
                emissionFrequency: 0.8,
                colors: const [Colors.deepPurple, Colors.yellow, Colors.blueAccent, Colors.green, Colors.purple], // manually specify the colors to be used
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 150, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(color: Color(0xFF8998FF), borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          _controllerCenterLeft.play();
                        },
                        child: _display('Left'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(color: Color(0xFF8998FF), borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          _controllerCenter.play();
                        },
                        child: _display('Top'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(color: Color(0xFF8998FF), borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          _controllerBottomCenter.play();
                        },
                        child: _display('Bottom'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(color: Color(0xFF8998FF), borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          _controllerCenterRight.play();
                        },
                        child: _display('Right'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
