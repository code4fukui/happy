import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math' as math;

const kSoundData = [
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        //primarySwatch: Color(0xff8833),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  String qrCode = '';
  //AudioCache audiocache = AudioCache(fixedPlayer: AudioPlayer());
  @override
  Widget build(BuildContext context) {
    //audiocache.loadAll(SOUND_DATA);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ハピー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png', width: 150),
            const SizedBox(height: 20),
            Image.asset('images/sdgs.png'),
            const SizedBox(height: 20),
            const Text(
              '25 SDGs POINT',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Text(
              '300 ハピー',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            /*
            Text(
              '$qrCode',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            */
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text(
                'QRコードをスキャンする',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: () => scanQrCode(),
              //onPressed: () => enterPrice(),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text(
                'SDGsイベント一覧',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: () => showEvents(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text(
                'ハピー協賛店マップ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: () => showMap(),
            ),
          ],
        ),
      ),
    );
  }

  Future scanQrCode() async {
    // ignore: unused_local_variable
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EnterPrice()));
  }

  Future showEvents() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EventList()));
  }

  Future showMap() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ShopList()));
  }
}

class EventList extends StatelessWidget {
  const EventList({Key? key}) : super(key: key);

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
          title: const Text('SDGsイベント一覧'),
        ),
        body: ListView(children: [
          _menuItem("たのしいゴミ拾い", const Icon(Icons.settings)),
          _menuItem("プログラミングを学ぼう", const Icon(Icons.map)),
          _menuItem("実践、ジェンダー平等", const Icon(Icons.room)),
          _menuItem("ベトナム語はじめのいっぽ", const Icon(Icons.local_shipping)),
          _menuItem("完全食とは？", const Icon(Icons.airplanemode_active)),
        ]),
      ),
    );
  }

  Widget _menuItem(String title, Icon icon) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey),
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                child: icon,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ],
          )),
      onTap: () {
        // ignore: avoid_print
        print("onTap called.");
      },
    );
  }
}

class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

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
          title: const Text('ハピー協賛店マップ'),
        ),
        body: ListView(children: [
          _menuItem("おみせA", const Icon(Icons.store)),
          _menuItem("おみせB", const Icon(Icons.store)),
          _menuItem("おみせC", const Icon(Icons.store)),
        ]),
      ),
    );
  }

  Widget _menuItem(String title, Icon icon) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey),
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                child: icon,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ],
          )),
      onTap: () {
        // ignore: avoid_print
        print("onTap called.");
      },
    );
  }
}

// EnterPrice

class EnterPrice extends StatefulWidget {
  const EnterPrice({Key? key}) : super(key: key);

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
    audiocache.loadAll(kSoundData);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ハピーをつかう"),
      ), //AppBar
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput,
                      style: const TextStyle(fontSize: 40, color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    //alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      child: const Text('つかう',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      onPressed: () => pay(),
                    ),
                  )
                ]),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          // ignore: avoid_print
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
                }),
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
    // ignore: unused_local_variable
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
    var rand = math.Random();
    var n = rand.nextInt(kSoundData.length);
    audiocache.play(kSoundData[n]);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const PayedView()));
  }
}

// creating Stateless Widget for buttons
class MyButton extends StatelessWidget {
  // declaring variables
  final Color? color;
  final Color? textColor;
  final String buttonText;
  final void Function()? buttontapped;

  //Constructor
  const MyButton({
    Key? key,
    this.color,
    this.textColor,
    required this.buttonText,
    this.buttontapped,
  }) : super(key: key);

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
  const PayedView({Key? key}) : super(key: key);

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
          title: const Text('ハピーをつかう'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ハピーをつかいました',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                child: const Text(
                  'もどる',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
