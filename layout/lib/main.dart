import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.red,
            title: const Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          body: _buildBody()),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _textField(),
          _title(),
          _subtitle(),
          _temperature(),
          _moreInfo(),
          _weatherForecast(),
        ],
      ),
    ),
  );
}

Widget _textField() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: TextField(
      decoration: InputDecoration(
        labelText: 'Enter City Name',
        labelStyle: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w300),
        icon: Icon(Icons.search, color: Colors.white),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      cursorColor: Colors.white,
      style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w300,
          decoration: TextDecoration.none),
    ),
  );
}

Widget _title() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      'Murmansk Oblast, RU',
      style: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.w300),
    ),
  );
}

Widget _subtitle() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 30),
    child: Text(
      'Friday, Mar 20, 2020',
      style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300),
    ),
  );
}

Widget _temperature() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.sunny, size: 60, color: Colors.white),
        const SizedBox(width: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '14 °F',
              style: TextStyle(
                  fontSize: 43,
                  color: Colors.white,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              'LIGHT SHOW',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            )
          ],
        )
      ],
    ),
  );
}

Widget _moreInfo() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.ac_unit, size: 30, color: Colors.white),
            SizedBox(
              height: 10,
            ),
            Text(
              '5',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              'km/hr',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.ac_unit, size: 30, color: Colors.white),
              SizedBox(
                height: 10,
              ),
              Text(
                '3',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                '%',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.ac_unit, size: 30, color: Colors.white),
            SizedBox(
              height: 10,
            ),
            Text(
              '20',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              '%',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ],
        )
      ],
    ),
  );
}

Widget _weatherForecast() {
  final List<Map> data = [
    {"day": "Monday", "degrees": "6"},
    {"day": "Tuesday", "degrees": "5"},
    {"day": "Wednesday", "degrees": "7"},
    {"day": "Thursday", "degrees": "20"},
    {"day": "Friday", "degrees": "10"},
    {"day": "Saturday", "degrees": "8"},
    {"day": "Sunday", "degrees": "9"},
  ];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          '7-DAY WEATHER FORECAST',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300),
        ),
      ),
      SizedBox(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          itemExtent: 150,
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) => Card(
            color: Colors.white.withOpacity(0.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${data[index]["day"]}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${data[index]["degrees"]}°F',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(Icons.wb_sunny, color: Colors.white, size: 40)
                  ],
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
