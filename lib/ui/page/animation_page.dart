

import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool _disappear = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeOutParticle(disappear: _disappear, child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.flutter_dash_outlined, size: 52, color: Theme.of(context).primaryColor,),
                const SizedBox(height: 8,),
                Text('Android Flutter developer', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),)
              ],
            )),
            const SizedBox(height: 150),
            OutlinedButton(onPressed: () {setState(() {
              _disappear = ! _disappear;
            });}, child: Text(_disappear ? 'Reset': 'Start')),
          ],
        ),
      ),
    );
  }
}
