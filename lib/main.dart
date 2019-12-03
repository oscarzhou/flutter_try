import 'dart:ui' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import './question.dart';

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
      home: MyHomePage(title: 'Expense'),
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
  int _expenseAmount = 0;
  int _questionIndex = 0;

  final _controller =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answer': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answer': ['Dog', 'Cat', 'Rabbit', 'Bird'],
      }
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const RaisedButton(
                onPressed: null,
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              new Flexible(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0, right: 60.0),
                    child: new TextFormField(
                      decoration: InputDecoration(
                        hintText: "0.00",
                        border: InputBorder.none,
                      ),
                      controller: _controller,
                      maxLines: 1,
                      showCursor: true,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      style: TextStyle(fontSize: 20.0),
                      onChanged: (text) {
                        _expenseAmount = int.parse(text);
                        // print(_expenseAmount);
                        print(_controller.text.toString());
                        print(_controller.text.toString().length);

                        var cursorPos = _controller.selection;
                        if (cursorPos.start > _controller.text.length) {
                          cursorPos = new TextSelection.fromPosition(
                              new TextPosition(
                                  offset: _controller.text.length));
                        }
                        _controller.selection = cursorPos;

                        // _controller.selection = TextSelection.collapsed(
                        //     offset: _controller.text.toString().length,
                        //     affinity: TextAffinity.upstream);
                      },
                      // onTap: () => print(_controller.selection),
                    ),
                  )),
              RaisedButton(
                  onPressed: () => _controller.clear(),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 15),
                  )),
            ],
          ),
          Question(questions[_questionIndex]["questionText"]),
          RaisedButton(
            onPressed: null,
            child: Text('Answer 1'),
          ),
          RaisedButton(
            onPressed: null,
            child: Text('Answer 2'),
          ),
          RaisedButton(
            onPressed: null,
            child: Text('Answer 3'),
          ),
        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
