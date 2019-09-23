import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  State createState() =>LoginPageState();  
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
       curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(()=> this.setState(() {}));
    _iconAnimationController.forward();
    }

    @override
    Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.greenAccent,
        title : Text('Login Page', textAlign: TextAlign.center,),
      ),
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/back.jpg'),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),

          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0,
                      )
                    )
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: 'Enter Email',

                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),

                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: 'Enter Password',
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),

                        new Padding(
                          padding: EdgeInsets.only(top:40.0),
                        ),

                        new MaterialButton(
                          height: 40.0,
                          minWidth: 100.0,
                          color: Colors.greenAccent,
                          textColor: Colors.white,
                          child: new Text('Login', textAlign: TextAlign.center),
                          onPressed: ()=>{},
                          splashColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}