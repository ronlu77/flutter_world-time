import 'package:flutter/material.dart';
import 'Location.dart';

// 将卡片模板设置成无状态部件
class LocationCard extends StatelessWidget {
  // 无状态部件不可使用随时间进展改变的变量,所以声明为 final 表示常量,final类型的常量可以只初始化不赋值，赋值后不可重新赋值。
  final Location loc;
  final Function delete;

  LocationCard({required this.loc, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // loc 是可空类型，所以使用非空断言，非空断言，如果为空则会抛出异常。
                    // ?? 提供默认值
                    loc!.location ?? '',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: Colors.grey[400]),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    loc!.url ?? '',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400]),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, '/',
                    arguments: {Location: loc}),
                icon: Icon(
                  Icons.access_time_rounded,
                  color: Colors.grey[400],
                ))
          ],
        ),
      ),
    );
  }
}
