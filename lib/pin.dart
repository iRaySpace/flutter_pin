import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Pin extends StatefulWidget {
  final WidgetBuilder toRoute;
  final String validPin;

  Pin({
    @required this.validPin,
    @required this.toRoute,
  });

  @override
  _PinState createState() => _PinState();
}

class _PinState extends State<Pin> {
  final _key = GlobalKey<ScaffoldState>();
  String _pin = '';

  _validate(context) {
    if (_pin == widget.validPin) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: widget.toRoute)
      );
    } else {
      setState(() => _pin = '');
      _key.currentState.showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Invalid Pin'),
        ),
      );
    }
  }

  _input(String number) {
    setState(() {
      _pin = _pin + number;
    });
    if (_pin.length == 4) {
      _validate(_key.currentState.context);
    }
  }

  _clear() {
    setState(() {
      _pin = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text('Enter User Passcode'),
            ),
            Container(
              width: 150.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _CircleContainer(
                    size: 25.0,
                    color: _pin.length >= 1 ? Colors.blue : null,
                    border: Border.all(color: Colors.blue),
                  ),
                  _CircleContainer(
                    size: 25.0,
                    color: _pin.length >= 2 ? Colors.blue : null,
                    border: Border.all(color: Colors.blue),
                  ),
                  _CircleContainer(
                    size: 25.0,
                    color: _pin.length >= 3 ? Colors.blue : null,
                    border: Border.all(color: Colors.blue),
                  ),
                  _CircleContainer(
                    size: 25.0,
                    color: _pin.length >= 4 ? Colors.blue : null,
                    border: Border.all(color: Colors.blue),
                  ),
                ],
              ),
            ),
            Container(
              width: 210.0,
              height: 310.0,
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 9.0,
                children: <Widget>[
                  InkWell(
                    onTap: () => this._input('1'),
                    customBorder: CircleBorder(),
                    splashColor: Colors.blue,
                    child: _CircleContainer(
                      size: 25.0,
                      border: Border.all(color: Colors.blue),
                      text: '1',
                    ),
                  ),
                  InkWell(
                    onTap: () => this._input('2'),
                    customBorder: CircleBorder(),
                    splashColor: Colors.blue,
                    child: _CircleContainer(
                      size: 25.0,
                      border: Border.all(color: Colors.blue),
                      text: '2',
                    ),
                  ),
                  InkWell(
                    onTap: () => this._input('3'),
                    customBorder: CircleBorder(),
                    splashColor: Colors.blue,
                    child: _CircleContainer(
                      size: 25.0,
                      border: Border.all(color: Colors.blue),
                      text: '3',
                    ),
                  ),

                  InkWell(
                    onTap: () => this._input('4'),
                    customBorder: CircleBorder(),
                    splashColor: Colors.blue,
                    child: _CircleContainer(
                      size: 25.0,
                      border: Border.all(color: Colors.blue),
                      text: '4',
                    ), 
                  ),
                  InkWell(
                    onTap: () => this._input('5'),
                    customBorder: CircleBorder(),
                    splashColor: Colors.blue,
                    child: _CircleContainer(
                      size: 25.0,
                      border: Border.all(color: Colors.blue),
                      text: '5',
                    ), 
                  ),
                  InkWell(
                    onTap: () => this._input('6'),
                    customBorder: CircleBorder(),
                    splashColor: Colors.blue,
                    child: _CircleContainer(
                      size: 25.0,
                      border: Border.all(color: Colors.blue),
                      text: '6',
                    ), 
                  ),
                  InkWell(
                    onTap: () => this._input('7'),
                    customBorder: CircleBorder(),
                    splashColor: Colors.blue,
                    child: _CircleContainer(
                      size: 25.0,
                      border: Border.all(color: Colors.blue),
                      text: '7',
                    ), 
                  ),
                  InkWell(
                    onTap: () => this._input('8'),
                    customBorder: CircleBorder(),
                    splashColor: Colors.blue,
                    child: _CircleContainer(
                      size: 25.0,
                      border: Border.all(color: Colors.blue),
                      text: '8',
                    ), 
                  ),
                  InkWell(
                    onTap: () => this._input('9'),
                    customBorder: CircleBorder(),
                    splashColor: Colors.blue,
                    child: _CircleContainer(
                      size: 25.0,
                      border: Border.all(color: Colors.blue),
                      text: '9',
                    ), 
                  ),
                  Container(),
                  InkWell(
                    onTap: () => this._input('0'),
                    customBorder: CircleBorder(),
                    splashColor: Colors.blue,
                    child: _CircleContainer(
                      size: 25.0,
                      border: Border.all(color: Colors.blue),
                      text: '0',
                    ), 
                  ),
                  InkWell(
                    onTap: () => this._clear(),
                    customBorder: CircleBorder(),
                    splashColor: Colors.blue,
                    child: _CircleContainer(
                      size: 25.0,
                      text: 'Clear',
                    ), 
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CircleContainer extends StatelessWidget {
  final double size;
  final Color color;
  final BoxBorder border;
  final String text;

  _CircleContainer({
    @required this.size,
    this.color,
    this.border,
    this.text,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color,
      border: border,
      shape: BoxShape.circle,
    ),
    child: text != null ? Center(child: Text(text)) : null,
  );
}
