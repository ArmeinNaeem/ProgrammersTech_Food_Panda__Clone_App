import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LatLng latLng = const LatLng(32.3839598, -86.3438847);
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(

        ),
        body:  FlutterMap(
            options: MapOptions(
              initialCenter: latLng,
              initialZoom: 9.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://api.mapbox.com/styles/v1/armein-naeem1/clvyvfu3r02av01qz9kgv3qf5/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYXJtZWluLW5hZWVtMSIsImEiOiJjbHZ5dmF0ZGIwaG1uMmptZWhnN25tZ254In0.JIQRRz-ftdLCevTYoDxFTQ',
                userAgentPackageName: 'com.example.googlemapexample',
                additionalOptions: {
                  'accessToken': 'pk.eyJ1IjoiYXJtZWluLW5hZWVtMSIsImEiOiJjbHZ5dmF0ZGIwaG1uMmptZWhnN25tZ254In0.JIQRRz-ftdLCevTYoDxFTQ',
                  'id': 'mapbox.mapbox-streets-v8'
                },
              ),

              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                    // onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: latLng,
                    width: 60,
                    height: 60,
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.red.shade700,
                      size: 60,
                    ),
                  ),
                ],
              )]));
  }
}