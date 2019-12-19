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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter User Passcode'),
            Container(
              width: 210.0,
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
              height: 240.0,
              child: GridView.count(
                crossAxisCount: 3,
                children: <Widget>[
                  InkWell(
                    child: _CircleContainer(
                      size: 25.0,
                      color: Colors.blue,
                      text: '1',
                    ),
                  ),
                  _CircleContainer(
                    size: 25.0,
                    color: Colors.blue,
                    text: '2',
                  ),
                  _CircleContainer(
                    size: 25.0,
                    color: Colors.blue,
                    text: '3',
                  ),

                  _CircleContainer(
                    size: 25.0,
                    color: Colors.blue,
                    text: '4',
                  ),
                  _CircleContainer(
                    size: 25.0,
                    color: Colors.blue,
                    text: '5',
                  ),
                  _CircleContainer(
                    size: 25.0,
                    color: Colors.blue,
                    text: '6',
                  ),

                  _CircleContainer(
                    size: 25.0,
                    color: Colors.blue,
                    text: '7',
                  ),
                  _CircleContainer(
                    size: 25.0,
                    color: Colors.blue,
                    text: '8',
                  ),
                  _CircleContainer(
                    size: 25.0,
                    color: Colors.blue,
                    text: '9',
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
