import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
        '/ContentPage': (BuildContext context) => new ContentPage(),
        '/VideoPage': (BuildContext context) => new VideoPage()
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
          autofocus: true,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "User Name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              validator: (val) => val.isEmpty? 'Please enter User name ' : null,
               
        );
        final passwordField = TextFormField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
          validator: (val) => val.isEmpty? 'Please enter password ' : null,             
          
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
              accountName: new Text("GrowthHacking"),
              accountEmail: new Text("growthhacking@syncfusion.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('https://images.app.goo.gl/Sjy8wx5v8bWhMtk5A'),
              ),
            ),
            new ListTile(
              leading: Image.asset('assets/angular.png'),
              title: new Text("Angular"),
              onTap: (){
                Navigator.of(context).pushNamed('/ContentPage'); 
              },
            ),
            new ListTile(
              leading: Image.asset('assets/flutter.png'),
              title: new Text("Flutter"),
              onTap: (){
                Navigator.of(context).pushNamed('/');
              },
            ),
            new ListTile(
              leading: Image.asset('assets/react.png'),
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
            Image.asset('assets/' + platform[index].toLowerCase() + '.png'),            
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
        title: Text("Angular Video"),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("GrowthHacking"),
              accountEmail: new Text("growthhacking@syncfusion.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('https://images.app.goo.gl/Sjy8wx5v8bWhMtk5A'),
              ),
            ),
            new ListTile(
              leading: Image.asset('assets/angular.png'),
              title: new Text("Angular"),
              onTap: (){
                Navigator.of(context).pushNamed('/ContentPage'); 
              },
            ),
            new ListTile(
              leading: Image.asset('assets/flutter.png'),
              title: new Text("Flutter"),
              onTap: (){
                Navigator.of(context).pushNamed('/');
              },
            ),
            new ListTile(
              leading: Image.asset('assets/react.png'),
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
        child: ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("How to Create Angular Charts Using Syncfusion and Angular CLI"),
              subtitle: new Text("Learn how easily you can create and configure Angular Charts of Syncfusion using the  ej2-angular-charts package..."),
              isThreeLine: true,
              onTap: (){
                Navigator.of(context).pushNamed('/VideoPage');
              },
            ),
            new ListTile(
              title: new Text("All You Need to Know About Angular Chart Types"),
              subtitle: new Text("Get an overview of the various types of Angular charts available from Syncfusion, with which you can visualize and read any kind of raw data easily...."),
              isThreeLine: true
            ),
            new ListTile(
              title: new Text("Creating Angular Pie Charts, Pyramid Charts and Funnel Charts"),
              subtitle: new Text("Learn how easily you can add and customize Syncfusion's Angular pie charts and doughnut charts, pyramid charts...."),
             isThreeLine: true
            ),
            new ListTile(
              title: new Text("How to Create and Customize Angular Financial Charts"),
              subtitle: new Text("Learn how easily you can add and customize Syncfusion's financial charts in an Angular application. With the help of..."),
              isThreeLine: true,
            )
            
          ],
        )
      ),
    );
  }
}

class VideoPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<VideoPage> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override 
  void initState(){
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  void createVideo(){
    if (playerController == null) {
      playerController = VideoPlayerController.network("https:\/\/r1---sn-p5qs7nes.googlevideo.com\/videoplayback?expire=1577474905&ei=-QYGXqb6DM_s8gTpp5DQBw&ip=3.95.167.222&id=o-AD1Xeoqpi9Fuef9DUsjkwfPasUxqhWxgPWXcSByWOhu3&itag=22&source=youtube&requiressl=yes&mm=31%2C29&mn=sn-p5qs7nes%2Csn-p5qlsnsd&ms=au%2Crdu&mv=m&mvi=0&pl=17&initcwndbps=1195000&mime=video%2Fmp4&ratebypass=yes&dur=563.826&lmt=1561748880424757&mt=1577453232&fvip=1&fexp=23842630&c=WEB&txp=2216222&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cmime%2Cratebypass%2Cdur%2Clmt&sig=ALgxI2wwRQIhAM9L5FSZw2-F9VzvgJxqy6-pfg6zESgT9PabWXsvtPLxAiBkLzjyTi4No5zKEmBwntCPvjKI9rcDLaNoeAavbTsWoA%3D%3D&lsparams=mm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AHylml4wRgIhAJgX6pMWwHgbvv-hC4nHj35j67szvbKz49w36_V7Rw0XAiEA6wBzGoJ3hqA2bAZo6rDv6MFcttJ1D4RKpWXq6q9WlsM%3D")
      ..addListener(listener)
      ..setVolume(1.0)
      ..initialize()
      ..play();
    }
    else {
      if (playerController.value.isPlaying) {
        playerController.pause();
      }
      else {
        playerController.initialize();
        playerController.play();
      }
    }
  }

  @override 
  void deactivate(){
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch Video'),
      ), 
      body: Center(
        child: AspectRatio(
          aspectRatio: 16/9,
          child: Container(
            child: (playerController != null
            ? VideoPlayer(
              playerController,
            )
            : Container()),
            )
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed : () {
          createVideo();
          playerController.play();
        },
        child: Icon(Icons.play_arrow),
      ),
      );
  }
}
