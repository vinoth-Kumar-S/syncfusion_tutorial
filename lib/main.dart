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
    
  
   void _submit () {
    Navigator.of(context).pushNamed('/CardPage');   
  }
  
    final emailField = TextFormField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "User Name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
          validator: (val)=> !val.contains('@')?'Invalid Email':null, 
               
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
          child: new SingleChildScrollView(
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
          
          ),
          ),
        ),
      ),
    );
  }
}

class CardPage extends StatelessWidget{
  final List<String> platform = [ 'Angular', 'Flutter', 'React', 'Vue', 'Xamarin'];
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Choose Framework'),
        backgroundColor: Colors.deepOrange,
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
                Navigator.of(context).pushNamed('/CardPage'); 
              },
            ),
            new ListTile(
              title: new Text("Flutter"),
              onTap: (){
                Navigator.of(context).pushNamed('/');
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
            ),
            new ListTile(
              title: new Text("LogOut"),
              onTap: (){
                Navigator.of(context).pushNamed('/');
              },
            ),
          ],
        ) 
      ),
      body: new Container(
        child: new ListView.builder(
          itemCount: platform.length,
          itemBuilder: (BuildContext context, int index) => buildPlatformCard(context, index),
        ),
      ),
    );
  }

  Widget buildPlatformCard(BuildContext context, int index){
    return new GestureDetector(
      child: new Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: new Column(            
          children: <Widget>[
            Image.asset('assets/' + platform[index] + '.svg'),
            Text(platform[index], style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold))
          ],),
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed('/ContentPage');
      } ,
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Syncfusion Tutorial Video"),
        backgroundColor: Colors.deepOrange,
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
                Navigator.of(context).pushNamed('/CardPage'); 
              },
            ),
            new ListTile(
              title: new Text("Flutter"),
              onTap: (){
                Navigator.of(context).pushNamed('/');
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
            ),
            new ListTile(
              title: new Text("LogOut"),
              onTap: (){
                Navigator.of(context).pushNamed('/');
              },
            ),
          ],
        ) 
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
          ],
        ),
      ),
    );
  }
}