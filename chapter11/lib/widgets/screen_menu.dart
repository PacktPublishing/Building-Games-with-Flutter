import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getGameTitle(),
            getGameMenu(context)
          ]
        )
      ),
    );
  }

  Widget getGameTitle() {
    return Text('Gold Rush', style: TextStyle(color: Colors.yellow, fontSize: 64.0));
  }

  Widget getGameMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, "/game", (r) => false);
          }, 
          child: Text('Play Game', style: TextStyle(color: Colors.blue, fontSize: 32.0))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, "/settings", (r) => false);
          }, 
          child: Text('Settings', style: TextStyle(color: Colors.blue, fontSize: 32.0))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () { SystemNavigator.pop(); }, 
          child: Text('Exit Game', style: TextStyle(color: Colors.red, fontSize: 32.0))),
        ),
      ]),
    );
  }
}