import 'package:flutter/material.dart';
import 'package:interfaces/my_flutter_app_icons.dart';
import 'package:interfaces/Interfaces/register_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:interfaces/generated/l10n.dart';
import 'package:interfaces/Interfaces/Home.dart';
import 'package:interfaces/Interfaces/Recovery.dart';
import 'package:interfaces/main.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Login(),
      title: 'Flutter Intl Example',

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
 
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.cyan[300],
                  Colors.cyan[800]
                  ],
              )
              ),
            child: Image.asset(
              "assets/logo3.png",
              height: 250,
            ),
          ),
          Transform.translate(
            offset: Offset(0,-60),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  margin: const EdgeInsets.only(left: 20, right: 20,top: 250),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 35),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: S.of(context).loginUs),
                        ),
                        SizedBox(height: 25,),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: S.of(context).loginPass),
                          obscureText: true,
                        ),
                        SizedBox(height: 25,),
                        RaisedButton(
                          color: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          textColor: Colors.white,
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(S.of(context).loginInit),
                                if(_loading)
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(left: 20),
                                    child: CircularProgressIndicator(),
                                  ),
                              ]
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(S.of(context).loginO),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                              color:Colors.blue[900],
                              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                              textColor: Colors.white,
                              onPressed: (){},
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MyFlutterApp.facebook),
                                    SizedBox(width: 10,),
                                    Text("Facebook"),
                                  ]
                              ),
                            ),
                            RaisedButton(
                              color: Colors.deepOrange,
                              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
                              textColor: Colors.white,
                              onPressed: (){},
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MyFlutterApp.google),
                                    SizedBox(width: 10,),
                                    Text("Google"),
                                  ]
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(S.of(context).loginNotR),
                            FlatButton(
                              textColor: Theme.of(context).primaryColor,
                              child: Text(S.of(context).loginResgis),
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ));
                              },
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(S.of(context).loginRecovery),
                          ],
                        ),
                        FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          child: Text(S.of(context).loginbuttonrecovery),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Recovery(),
                            ));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}