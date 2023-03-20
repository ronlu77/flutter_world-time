import 'package:flutter/material.dart';
import 'package:flutter_workspace/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  // key 对于同一类来说是唯一的，dart 通过key 和 runtimeType 来判断哪些部件需要更新
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locationList = [
    WorldTime(location: 'los_Angeles', url: 'America/Los_Angeles'),
    WorldTime(location: 'Shanghai', url: 'Asia/Shanghai'),
  ];

  void updateTime(WorldTime datetime) async {
    WorldTime instance =
        WorldTime(location: datetime.location, url: datetime.url);
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'url': instance.url,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Choose a Location'),
          centerTitle: true,
        ),
        // 替代 map.toList方法
        body: ListView.builder(
          itemCount: locationList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 1.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(locationList[index]);
                  },
                  title: Text(locationList[index].location),
                ),
              ),
            );
          },
        ));
  }
}
