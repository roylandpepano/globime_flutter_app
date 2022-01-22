import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Pass map data to modal route from loading.dart
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color topColor = data['isDayTime'] ? Color(0xff6E4065) : Color(0xff31718C);

    return Scaffold(
      backgroundColor: topColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      height: 1.0,
                      //backgroundColor: Colors.amberAccent,
                      fontFamily: 'Dongle-Regular',
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    data['time'],
                    style: TextStyle(
                      height: 0.7,
                      //backgroundColor: Colors.red,
                      color: Colors.white,
                      fontSize: 100,
                      fontFamily: 'Dongle-Regular',
                    ),
                  ),
                  Text(
                    data['date'],
                    style: TextStyle(
                      height: 0.5,
                      //backgroundColor: Colors.blue,
                      fontFamily: 'Dongle-Regular',
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.circle_outlined),
        onPressed: () async {
          dynamic result = await Navigator.pushNamed(context, '/location');
          setState(() {
            data = {
              'time': result['time'],
              'location': result['location'],
              'date': result['date'],
              'isDayTime': result['isDayTime'],
              'flag': result['flag'],
            };
          });
        },
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
