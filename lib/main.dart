import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/CardPage': (BuildContext context) => new CardPage(),
        '/ContentPage': (BuildContext context) => new ContentPage()
      }
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  //   final scaffoldkey=new GlobalKey<ScaffoldState>();
  // final formkey=new GlobalKey<FormState>();
    String _email;
   String _password;
  //  void performlogin(){
  //   final snackbar=new SnackBar(
  //     content: new Text("Email: $_email, Password: $_password"),);
  //     scaffoldkey.currentState.showSnackBar(snackbar);
  // }
   void _submit () {
    // final form=formkey.currentState;
    // if(form.validate()){
    //   form.save();
      
    //   performlogin();
    // } 
    Navigator.of(context).pushNamed('/CardPage');   
  }
  
    final emailField = TextFormField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
          validator: (val)=> !val.contains('@')?'Invalid Email':null, 
          onSaved: (val)=>_email=val,      
        );
        final passwordField = TextFormField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
          validator: (val)=> val.length<6?'Password Too Short':null,
          onSaved: (val)=>_password=val,
        );
        final loginButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),            
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            onPressed:_submit,
          ),
        );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Syncfusion Tutorial'),
        backgroundColor: Colors.deepOrange,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
            SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/Logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
          ]
          
          )
        ),
      ),
    );
  }
}

class CardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
        backgroundColor: Colors.deepOrange,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
            new IconButton(
              icon: new Icon(Icons.favorite, color: Colors.red ),
              onPressed: null,
            ),
            new Text('Home')
          ]
          )
        ),
      ),
    );
  }
}

class ContentPage extends StatefulWidget {
  ContentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Vinoth"),
              accountEmail: new Text("vinoth.sundaramoorthy@syncfusion.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('https://images.app.goo.gl/Sjy8wx5v8bWhMtk5A'),
              ),
            ),
            new ListTile(
              title: new Text("Angular"),
              onTap: (){
                //Navigate to Angular page
              },
            ),
            new ListTile(
              title: new Text("Flutter"),
              onTap: (){
                //Navigate to flutter page
              },
            ),
            new ListTile(
              title: new Text('React'),
              onTap: (){
                //Navigate to react page
              },
            ),
            new ListTile(
              title: new Text('About'),
            )
          ],
        ) 
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Angular'),
              dense: true,
            ),
            SizedBox(height: 10),
            const ListTile(
              //leading: Icon(Icon()),
              title: Text('Flutter'),
              dense: true,
            ),
            SizedBox(height: 10),
            const ListTile(
              //leading: Icon(Icon.album),
              title: Text('React'),
              dense: true,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}