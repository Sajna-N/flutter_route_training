import 'package:flutter/material.dart';
import './route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Initially display FirstPage
      // home: FirstPage(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'First Page',
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
              child: Text('Go to second'),
              onPressed: () {
                // Pushing a route directly, WITHOUT using a named route
                Navigator.of(context).push(
                  // With MaterialPageRoute, you can pass data between pages,
                  // but if you have a more complex app, you will quickly get lost.
                  MaterialPageRoute(
                    builder: (context) =>
                        SecondPage(data: 'Hello there from the first page!'),
                  ),
                );
              },
              //  onPressed: () {
              //   // Pushing a named route
              //   Navigator.of(context).pushNamed(
              //     '/second',
              //     arguments: 'Hello there from the first page!',
              //   );
              // },
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final String data;

  SecondPage({
    // Key key,
    required this.data,
  }) ;
  // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Second Page',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              child: Text('Go to third'),
              // onPressed: () {
              //   // Pushing a route directly, WITHOUT using a named route
              //   Navigator.of(context).push(
              //     // With MaterialPageRoute, you can pass data between pages,
              //     // but if you have a more complex app, you will quickly get lost.
              //     MaterialPageRoute(
              //       builder: (context) =>
              //           ThirdPage(data: 'Hello there from the first page!'),
              //     ),
              //   );
              // },
               onPressed: () {
                // Pushing a named route
                Navigator.of(context).pushNamed(
                  '/third',
                  arguments: 'Hello there from the second page!',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  final String data;

  ThirdPage({
    required this.data,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Third Page',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(  
              // color: Colors.blueGrey,  
              onPressed: () {  
                Navigator.pop(context);  
              },  
              child: Text('Go back'),  
            ),
            ElevatedButton(  
          child: Text('Go to Fourth'),  
          onPressed: () {   
            Navigator.of(context).pushReplacementNamed('/fourth',
                  arguments: 'Hello there from the third page!',
            );   // used to change to a new route replacing the current one
          },
            
        ),
          ],
        ),
      ),
    );
  }
}


class FourthPage extends StatelessWidget {

  final String data;

  FourthPage({
    required this.data,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Fourth Page',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              data,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(  
              onPressed: () {  
                Navigator.pop(context);  
              },  
              child: Text('Go back'),  
            ),
          ],
        ),
      ),
    );
  }
}