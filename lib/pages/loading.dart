import 'package:flutter/material.dart';
import 'package:flutter_workspace/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Shanghai', url: 'Asia/Shanghai');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      // 'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitWave(
      color: Colors.blue,
      size: 50.0,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: spinkit,
      ),
    );
  }
}
