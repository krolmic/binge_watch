import 'dart:developer';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/results',
      routes: {
        '/': (context) => const MyHomePage(title: 'MyApp'),
        '/choice': (context) => ChoicePage(),
        '/results': (context) => ResultsPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tap on your streaming platforms',
            ),
            RaisedButton(
              child: const Text('Next'),
              onPressed: () {
                log('Next');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  PageController controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: _currentPage,
      keepPage: false,
      viewportFraction: 0.5,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            controller: controller,
            itemBuilder: (context, index) => _carousellBuilder(index),
          ),
        ),
      ),
    );
  }

  Widget _carousellBuilder(int index) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * 300,
            width: Curves.easeOut.transform(value) * 250,
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        color: index % 2 == 0 ? Colors.blue : Colors.red,
      ),
    );
  }
}
