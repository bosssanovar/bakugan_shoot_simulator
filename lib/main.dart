import 'package:bakugan_shoot_simulator/baku_core/baku_core.dart';
import 'package:bakugan_shoot_simulator/baku_core/baku_core_list/baku_core_list_real.dart';
import 'package:bakugan_shoot_simulator/baku_core/baku_core_type.dart';
import 'package:bakugan_shoot_simulator/baku_core/baku_cores.dart';
import 'package:bakugan_shoot_simulator/baku_core/no_baku_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen/screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  Screen.keepOn(true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bakugan shoot simulator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BakuCores _bakuCores = BakuCores(BakuCoreListReal());
  BakuCore _leftTeam1 = NoBakuCore();
  BakuCore _leftTeam2 = NoBakuCore();
  BakuCore _leftTeam3 = NoBakuCore();
  BakuCore _left = NoBakuCore();
  BakuCore _rightTeam1 = NoBakuCore();
  BakuCore _rightTeam2 = NoBakuCore();
  BakuCore _rightTeam3 = NoBakuCore();
  BakuCore _right = NoBakuCore();

  void _bakuganShoot() {
    setState(() {
      _left = _bakuCores.getRandom();
      _right = _bakuCores.getRandom();
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
            _buildLeftTeam(),
            Expanded(
              child: _buildLeftPlayerGetBakuCore(context),
            ),
            Text(
              'V.S.',
            ),
            Expanded(
              child: _buildRightPlayerGetBakuCore(context),
            ),
            _buildRightTeam(),
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

  Widget _buildLeftTeam() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _leftTeam1.isNoCore ? _buildLeftCoreAddButton(1) : _buildTeamBakuCore(_leftTeam1),
        _leftTeam2.isNoCore ? _buildLeftCoreAddButton(2) : _buildTeamBakuCore(_leftTeam2),
        _leftTeam3.isNoCore ? _buildLeftCoreAddButton(3) : _buildTeamBakuCore(_leftTeam3),
      ],
    );
  }

  Widget _buildLeftCoreAddButton(int teamNum) {
    return IconButton(
      onPressed: (){
        if(!_left.canAddTeam){
          _showCantAddTeamDialog();
          return;
        }
        setState(() {
          switch(teamNum){
            case 1:
              _leftTeam1 = _left;
              break;
            case 2:
              _leftTeam2 = _left;
              break;
            case 3:
              _leftTeam3 = _left;
              break;
            default:
              throw Error();
              break;
          }
        });
      },
      icon: Icon(Icons.add_circle_outline),
    );
  }

  Widget _buildLeftPlayerGetBakuCore(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
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
            );
  }

  Widget _buildRightPlayerGetBakuCore(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }



  Widget _buildRightTeam() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _rightTeam1.isNoCore ? _buildRightCoreAddButton(1) : _buildTeamBakuCore(_rightTeam1),
        _rightTeam2.isNoCore ? _buildRightCoreAddButton(2) : _buildTeamBakuCore(_rightTeam2),
        _rightTeam3.isNoCore ? _buildRightCoreAddButton(3) : _buildTeamBakuCore(_rightTeam3),
      ],
    );
  }

  Widget _buildRightCoreAddButton(int teamNum) {
    return IconButton(
      onPressed: (){
        if(!_right.canAddTeam){
          _showCantAddTeamDialog();
          return;
        }
        setState(() {
          switch(teamNum){
            case 1:
              _rightTeam1 = _right;
              break;
            case 2:
              _rightTeam2 = _right;
              break;
            case 3:
              _rightTeam3 = _right;
              break;
            default:
              throw Error();
              break;
          }
        });
      },
      icon: Icon(Icons.add_circle_outline),
    );
  }

  Widget _buildTeamBakuCore(BakuCore bakuCore){
    return Column(
      children: <Widget>[
        Text(_getDamageRateText(bakuCore)),
        Text(_getTypeText(bakuCore))
      ],
    );
  }

  String _getBattlePointText(BakuCore bakuCore) {
    if(bakuCore.type == BakuCoreType.Failed){
      return '-';
    }
    if(bakuCore.type == BakuCoreType.None){
      return '';
    }
    return 'BP : ${bakuCore.battlePoint}';
  }

  String _getDamageRateText(BakuCore bakuCore) {
    if(bakuCore.type == BakuCoreType.Failed){
      return '-';
    }
    if(bakuCore.type == BakuCoreType.None){
      return '';
    }
    return 'DR : ${bakuCore.damageRate}';
  }

  String _getTypeText(BakuCore bakuCore) {
    if(bakuCore.type == BakuCoreType.Failed){
      return '-';
    }
    if(bakuCore.type == BakuCoreType.None){
      return '';
    }
    return '${bakuCore.type.text}';
  }

  void _showCantAddTeamDialog() {
    showDialog<int>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('確認'),
          content: Text('確認のダイアログです。')
        );
      },
    );
  }
}
