import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'commons.dart';
import 'item_game.dart';
import 'time_counter.dart';

class FlipGamePlayMainScreen extends StatefulWidget {
  const FlipGamePlayMainScreen({super.key});

  @override
  FlipGamePlayMainScreenState createState() => FlipGamePlayMainScreenState();
}

class FlipGamePlayMainScreenState extends State<FlipGamePlayMainScreen> {
  late int _width, _height; // size of matrix game
  final List<List<bool>> _stateOpened = []; // state open of item in matrix game
  final List<List<bool>> _stateVisible = []; //state visible matrix game
  String _valueA = "", _valueB = ""; // value of items game is opening
  int _xPre = -1, _yPre = -1;

  late int _itemCountDown;
  late final List<List<String>> _valueGame = [];
  late List<String> _textGame;
  bool _isPause = false;

  // Lưu lại thời gian của lần tap gần nhất
  var _lastTapMs = DateTime.now().millisecondsSinceEpoch;
  final _tapIntervalMs = 50;

  late Timer _timer;

  final ValueNotifier<int> _ticks = ValueNotifier(0);

  /// Create const of game
  void _initGame() {
    _ticks.value = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _ticks.value++;
    });

    _stateOpened.clear();
    _stateVisible.clear();
    _width = gamePlayWidth;
    _height = gamePlayHeight;
    _itemCountDown = _width * _height;
    for (int y = 1; y <= _height; y++) {
      _stateOpened.add(List.generate(_width, (index) => false));
      _stateVisible.add(List.generate(_width, (index) => true));
      _valueGame.add(List.generate(_width, (index) => ""));
    }
    _crateListValueInGame();
  }

  /// Handle onTap on item game
  void _actionGame(int y, int x, BuildContext mainContext) {
    // Chặn việc cùng lúc 2 item
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - _lastTapMs <= _tapIntervalMs) return;
    _lastTapMs = now;

    if (_yPre == y && _xPre == x) return; // Kiem tra viec nhan cung 1 item
    setState(() => _stateOpened[y][x] = true);
    (_valueA == "")
        ? _valueA = _valueGame[y][x]
        : _valueB = _valueGame[y][x]; // Luu lai value cua item vua mo
    // Kiem tra co mo 2 item khong
    if (_valueB == "") {
      _xPre = x;
      _yPre = y;
      return;
    }
    // delay neu mo 2 item
    setState(() => _isPause = true);
    Future.delayed(timeDelay, () {
      if (_valueA == _valueB) {
        _itemCountDown -= 2;
        setState(() {
          _stateVisible[y][x] = false;
          _stateVisible[_yPre][_xPre] = false;
        });
      }
      if (_itemCountDown == 0) {
        _timer.cancel();
      }
      setState(() {
        _isPause = false;
        _stateOpened[y][x] = false;
        _stateOpened[_yPre][_xPre] = false;
      });
      _xPre = -1;
      _yPre = -1;
      _valueA = "";
      _valueB = "";
    });
  }

  /// Build matrix game
  Widget _buildWidgetMatrixGame(Size boxSize) {
    List<String> copyValueList = List.from(_textGame);
    List<Row> childrenColumn = [];
    ItemGame itemGame;
    for (int y = 0; y < _height; y++) {
      List<ItemGame> gameRow = [];
      for (int x = 0; x < _width; x++) {
        itemGame = ItemGame(
          onTap: () => _actionGame(y, x, context),
          text: copyValueList[0],
          visible: _stateVisible[y][x],
          isOpen: _stateOpened[y][x],
          width: boxSize.width,
          height: boxSize.height,
        );
        copyValueList.removeAt(0);
        gameRow.add(itemGame);
      }
      Row row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: gameRow,
      );
      childrenColumn.add(row);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: childrenColumn,
    );
  }

  /// create random list text
  void _crateListValueInGame() {
    _textGame = List.generate(_itemCountDown, (index) => "");
    List<int> listIndex = List.generate(_itemCountDown, (index) => index);
    Random random;
    int index;
    for (int i = 0; i < _itemCountDown; i++) {
      random = Random();
      index = random.nextInt(_itemCountDown - i);
      _textGame[listIndex[index]] = listValue[i ~/ 2];
      _valueGame[listIndex[index] ~/ _width][listIndex[index] % _width] =
          _textGame[listIndex[index]];
      listIndex.removeAt(index);
    }
  }

  @override
  void initState() {
    _initGame();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trò chơi lật hình'),
        actions: [
          ValueListenableBuilder(
            valueListenable: _ticks,
            builder: (context, value, child) {
              return TimeCounter(ticks: value);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: AbsorbPointer(
          absorbing: _isPause,
          child: _itemCountDown == 0
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'YOU WIN!!!',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          _initGame();
                        },
                        child: Text('Play Again'),
                      ),
                    ],
                  ),
                )
              : LayoutBuilder(
                  builder: (context, constraints) {
                    return _buildWidgetMatrixGame(constraints.biggest);
                  },
                ),
        ),
      ),
    );
  }
}
