import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math' as math;
 
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        //primarySwatch: Color(0xff8833),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const SOUND_DATA = [
  'sounds/happy1.m4a',
  'sounds/happy2.m4a',
  'sounds/happy3.m4a',
  'sounds/happy4.m4a',
  'sounds/happy5.m4a',
  'sounds/happy6.m4a',
  'sounds/happy7.m4a',
  'sounds/happy8.m4a',
  'sounds/happy9.m4a',
  'sounds/happya.m4a',
];

class _MyHomePageState extends State {
  String qrCode = '';
  //AudioCache audiocache = AudioCache(fixedPlayer: AudioPlayer());
  @override
  Widget build(BuildContext context) {
    //audiocache.loadAll(SOUND_DATA);

    return Scaffold(
      appBar: AppBar(
        title: Text('ハピー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png', width: 150),
            SizedBox(height: 20),
            Image.asset('images/sdgs.png'),
            SizedBox(height: 20),
            Text('25 SDGs POINT', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            Text('300 ハピー', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            /*
            Text(
              '$qrCode',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            */
            SizedBox(height: 30),
            ElevatedButton(
              child: Text('QRコードをスキャンする', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              onPressed: () => scanQrCode(),
              //onPressed: () => enterPrice(),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              child: Text('SDGsイベント一覧', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              onPressed: () => showEvents(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('ハピー協賛店マップ', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              onPressed: () => showMap(),
            ),
          ],
        ),
      ),
    );
  }

  Future scanQrCode() async {
    final qrCode = await FlutterBarcodeScanner.scanBarcode(
      '#EB394B',
      'キャンセル',
      true,
      ScanMode.QR,
    );
    if (!mounted) return;

    setState(() {
      enterPrice();
      /*
      var rand = new math.Random();
      var n = rand.nextInt(SOUND_DATA.length);
      audiocache.play(SOUND_DATA[n]);
      this.qrCode = qrCode;
      */
    });
  }
  Future enterPrice() async {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => EnterPrice()
    ));
  }

  Future showEvents() async {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => EventList()
    ));
  }
  Future showMap() async {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ShopList()
    ));
  }
}

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        //primarySwatch: Color(0xff8833),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SDGsイベント一覧'),
        ),
        body: ListView(
          children: [
            _menuItem("たのしいゴミ拾い", Icon(Icons.settings)),
            _menuItem("プログラミングを学ぼう", Icon(Icons.map)),
            _menuItem("実践、ジェンダー平等", Icon(Icons.room)),
            _menuItem("ベトナム語はじめのいっぽ", Icon(Icons.local_shipping)),
            _menuItem("完全食とは？", Icon(Icons.airplanemode_active)),
          ]
        ),
      ),
    );
  }

  Widget _menuItem(String title, Icon icon) {
    return GestureDetector(
      child:Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child:icon,
            ),
            Text(
              title,
              style: TextStyle(
                color:Colors.black,
                fontSize: 18.0
              ),
            ),
          ],
        )
      ),
      onTap: () {
        print("onTap called.");
      },
    );
  }
}


class ShopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange, // 0xDF7E33
        //primarySwatch: Colors.pink,
        //primarySwatch: Color(0xff8833),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ハピー協賛店マップ'),
        ),
        body: ListView(
          children: [
            _menuItem("おみせA", Icon(Icons.store)),
            _menuItem("おみせB", Icon(Icons.store)),
            _menuItem("おみせC", Icon(Icons.store)),
          ]
        ),
      ),
    );
  }

  Widget _menuItem(String title, Icon icon) {
    return GestureDetector(
      child:Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child:icon,
            ),
            Text(
              title,
              style: TextStyle(
                color:Colors.black,
                fontSize: 18.0
              ),
            ),
          ],
        )
      ),
      onTap: () {
        print("onTap called.");
      },
    );
  }
}

// EnterPrice

class EnterPrice extends StatefulWidget {
  @override
  _EnterPriceState createState() => _EnterPriceState();
}
 
class _EnterPriceState extends State<EnterPrice> {
  AudioCache audiocache = AudioCache(fixedPlayer: AudioPlayer());

  var userInput = '';
  var answer = '';
 
  // Array of button
  final List<String> buttons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'C',
    '0',
    '<',
  ];
 
  @override
  Widget build(BuildContext context) {
    audiocache.loadAll(SOUND_DATA);
    
    return Scaffold(
      appBar: new AppBar(
        title: new Text("ハピーをつかう"),
      ), //AppBar
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: TextStyle(fontSize: 40, color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      //alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        child: Text('つかう', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        onPressed: () => pay(),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1.5),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    if (index == 9) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        },
                        buttonText: buttons[index],
                        //color: Colors.blue[50],
                        color: Colors.white,
                        textColor: Colors.black,
                      );
                    }
 
                    // Delete Button
                    else if (index == 11) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                        //color: Colors.blue[50],
                        color: Colors.white,
                        textColor: Colors.black,
                      );
                    }
 
                    //  other buttons
                    else {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                            print(userInput);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.orange[50],
                        textColor: Colors.black,
                        /*
                        color: isOperator(buttons[index])
                            ? Colors.blueAccent
                            : Colors.white,
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                            */
                      );
                    }
                  }), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }
 
  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
 
// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    /*
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
    */
    //answer = userInput;
  }
  Future pay() async {
    var rand = new math.Random();
    var n = rand.nextInt(SOUND_DATA.length);
    audiocache.play(SOUND_DATA[n]);

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => PayedView()
    ));
  }
}


// creating Stateless Widget for buttons
class MyButton extends StatelessWidget {
   
  // declaring variables
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;
 
  //Constructor
  MyButton({this.color, this.textColor, required this.buttonText, this.buttontapped});
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PayedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange, // 0xDF7E33
        //primarySwatch: Colors.pink,
        //primarySwatch: Color(0xff8833),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ハピーをつかう'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ハピーをつかいました', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 40),
              ElevatedButton(
                child: Text('もどる', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
