import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
      home: MyHomePage(title: 'Syncfusion Tutorial Videos'),
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
            ),
            const ListTile(
              //leading: Icon(Icon()),
              title: Text('Flutter'),
            ),
            const ListTile(
              //leading: Icon(Icon.album),
              title: Text('React'),
            )
          ],
        ),
      ),
    );
  }
}
