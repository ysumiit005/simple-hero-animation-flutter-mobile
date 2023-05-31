import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable Row',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollableRowScreen(),
    );
  }
}

class ScrollableRowScreen extends StatefulWidget {
  @override
  _ScrollableRowScreenState createState() => _ScrollableRowScreenState();
}

class _ScrollableRowScreenState extends State<ScrollableRowScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToContainer2() {
    _scrollController.animateTo(
      MediaQuery.of(context).size.width, // Scroll to the width of Container 2
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollable Row'),
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.blue,
                child: Center(
                  child: ElevatedButton(
                    onPressed: _scrollToContainer2,
                    child: Text('Scroll to Container 2'),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Container 2',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
