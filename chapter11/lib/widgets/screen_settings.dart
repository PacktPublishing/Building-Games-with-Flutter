import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {

  var musicVolume = 25.0;
  
  @override
  initState() {
    super.initState();

    SharedPreferences.getInstance()
      .then((prefs) => prefs.getDouble('musicVolume') ?? 25.0)
      .then((savedMusicVolume) => setState(() => musicVolume = savedMusicVolume));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getSettingsTitle(),
              getMusicVolumeLabel(),
              getVolumeSlider(),
              getBackLabel()
            ]
          )
      ),
    );
  }

  Widget getSettingsTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Text('Settings', style: TextStyle(color: Colors.yellow, fontSize: 64.0)),
    );
  }

  Widget getMusicVolumeLabel() {
    return Text('Music Volume', style: TextStyle(color: Colors.blue, fontSize: 32.0));
  }

  Widget getVolumeSlider() {
    return SizedBox(
      width: 250.0,
      child: Slider(
        value: musicVolume, 
        min: 0.0,
        max: 100.0,
        label: '${musicVolume.round()}',
        divisions: 4,
        onChanged: (double newMusicVolume) {
          SharedPreferences.getInstance().then((prefs) => prefs.setDouble('musicVolume', newMusicVolume));
          setState(() => musicVolume = newMusicVolume);
      }),
    );
  }

  Widget getBackLabel() {
    return GestureDetector(
      onTap: () { Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false); }, 
      child: Text('Back', style: TextStyle(color: Colors.red, fontSize: 32.0))
    );
  }
}



