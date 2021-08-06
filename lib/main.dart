import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isHidden = true;
  Color _color = Color(0xff313b47);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: Container(
          height: 40,
          padding: EdgeInsets.only(left: 20),
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          decoration: BoxDecoration (
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Color(0xff313b47)
          ),
          child: Row (
            children: [
              Flexible (
                flex: 8,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: ArcClipper(),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            colors: [
                              const Color(0xff313b47),
                              _color,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp
                          ),
                        )
                      ),
                    ),
                    Center(
                      child: TextField(
                        style: TextStyle (
                          color: Colors.grey[500],
                        ),
                        obscureText: _isHidden,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Password',
                          hintStyle: TextStyle (
                            color: Colors.grey[300]
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible (
                flex: 2,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: IconButton (
                    hoverColor: Colors.transparent,
                    splashRadius: 0.1,
                    icon: Icon(
                      Icons.flashlight_on_rounded,
                      color: Colors.grey[500],
                    ),
                    onPressed: () {
                      setState(() {
                        _isHidden = !_isHidden;
                        if (!_isHidden) {
                          _color = Color(0xff86acd9);
                        } else {
                          _color = Color(0xff313b47);
                        }
                      });
                    }
                  )
                )
              )
            ]
          )
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 25, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 25, 0);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}