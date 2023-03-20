import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // 构建函数重新运行的时候有两种情况，一是更改了地区，二是没有更改地区
    data = data.isNotEmpty
        ? data
        : (ModalRoute.of(context)?.settings.arguments) as Map<String, dynamic>;

    String bgImg = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bkColor = data['isDayTime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: bkColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                // 请求本地图片资源
                image: AssetImage('assets/$bgImg'),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 160.0, 0, 0),
            child: Column(
              children: [
                // FloatButton 已经弃用用 TextButton代替
                TextButton.icon(
                  label: Text(
                    'CHOOSE THE LOCATION',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    // 跳转到选中地区的页面，其实就是为了等待选择地区后获取请求信息，所以用 async-await
                    // 未选择地区返回结果为空，读取旧数据展示
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'url': result['url'],
                        'isDayTime': result['isDayTime'],
                        'time': result['time'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
