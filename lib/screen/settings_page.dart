import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Controller for playback
  late RiveAnimationController _controller;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 7,
            ),
            Center(
              child: Icon(
                Icons.settings,
                size: 150,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("Version 1.1.0"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text("About Us"),
            ),
            Divider(),
            Flexible(
              child: RiveAnimation.asset(
                'asset/anims/theme.riv',
                controllers: [_controller],
                // Update the play state when the widget's initialized
                onInit: (_) => setState(() {}),
              ),
            ),
            //
            // Flexible(
            //   child: RiveAnimation.network(
            //     'https://rive.app/community/3563-7455-character-controller/',
            //     controllers: [_controller],
            //     // Update the play state when the widget's initialized
            //     onInit: (_) => setState(() {}),
            //   ),
            // ),
            //
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
