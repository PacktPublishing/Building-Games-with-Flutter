import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {

  const GameOverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getGameOverTitle(),
              getMenuLabel(context)
            ]
          )
      ),
    );
  }

  Widget getGameOverTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Text('Game Over!!', style: TextStyle(color: Colors.yellow, fontSize: 64.0)),
    );
  }

  Widget getMenuLabel(BuildContext context) {
    return GestureDetector(
      onTap: () { Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false); },
      child: Text('Menu', style: TextStyle(color: Colors.red, fontSize: 32.0))
    );
  }
}




