import 'package:flutter/material.dart';

void main() {
  runApp(const Weather());
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: const IconButton(
            icon: Icon(Icons.menu, color: Colors.black54),
            onPressed: null,
          ),
          actions: const [
            IconButton(
                icon: Icon(Icons.settings, color: Colors.black54),
                onPressed: null)
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Image.network(
            'https://img4.goodfon.ru/original/800x480/e/c5/priroda-oblaka-solnyshko-iasnaia-pogoda.jpg'),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              _title(),
              const Divider(),
              _temperature(),
              const Divider(),
              _temperatureForecast(),
              const Divider(),
              _footer(),
            ]),
          ),
        )
      ],
    ),
  );
}

Widget _title() {
  return Column(
    children: const [
      Text(
        'Tuesday - May 22',
        style: TextStyle(fontSize: 30),
      ),
      Divider(),
      Text(
        'lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pulvinar purus nec nulla condimentum egestas eu sed nulla. Fusce ut suscipit sem',
        textAlign: TextAlign.center,
      )
    ],
  );
}

Widget _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(Icons.wb_sunny, color: Colors.yellow),
      const SizedBox(width: 20),
      Column(
        children: const [
          Text(
            '15°C clear',
            style: TextStyle(color: Colors.purple),
          ),
          Text(
            'Murmanskya oblast, Murmansk',
            style: TextStyle(color: Colors.grey),
          )
        ],
      )
    ],
  );
}

Widget _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(
      8,
      (index) => Chip(
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue.shade300,
        ),
        label: Text('${20 + index} °C'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade100,
      ),
    ),
  );
}

Widget _footer() {
  Widget stars = Row(children: const [
    Icon(Icons.star, size: 15.0, color: Colors.yellow),
    Icon(Icons.star, size: 15.0, color: Colors.yellow),
    Icon(Icons.star, size: 15.0, color: Colors.yellow),
    Icon(Icons.star, size: 15.0, color: Colors.black38),
    Icon(Icons.star, size: 15.0, color: Colors.black38),
  ]);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [const Text('Info with openweathermap.com'), stars],
  );
}
