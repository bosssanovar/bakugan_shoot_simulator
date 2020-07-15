import 'package:bakugan_shoot_simulator/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/baku_core/baku_core_list/baku_core_list_real.dart';
import 'package:bakugan_shoot_simulator/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/baku_core/baku_cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bakugan shoot simulator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BakuCores _bakuCores = BakuCores(BakuCoreListReal());
  BakuCore _right = BakuCore(0,0,BakuCoreType.Failed);
  BakuCore _left = BakuCore(0,0,BakuCoreType.Failed);

  void _bakuganShoot() {
    setState(() {
      _right = _bakuCores.getRandom();
      _left = _bakuCores.getRandom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${_getBattlePointText(_left)}',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '${_getDamageRateText(_left)}',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '${_getTypeText(_left)}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
            Text(
              'V.S.',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${_getBattlePointText(_right)}',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '${_getDamageRateText(_right)}',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '${_getTypeText(_right)}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bakuganShoot,
        tooltip: 'Increment',
        child: Icon(Icons.loop),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String _getBattlePointText(BakuCore bakuCore) {
    if(bakuCore.type == BakuCoreType.Failed){
      return '-';
    }
    return '${bakuCore.battlePoint}';
  }

  String _getDamageRateText(BakuCore bakuCore) {
    if(bakuCore.type == BakuCoreType.Failed){
      return '-';
    }
    return '${bakuCore.damageRate}';
  }

  String _getTypeText(BakuCore bakuCore) {
    if(bakuCore.type == BakuCoreType.Failed){
      return '-';
    }
    return '${bakuCore.type.text}';
  }
}
