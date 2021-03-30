import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:poc_google_maps/map_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  // Verifica as permissões de localização e obtem minha localização
  void _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Poc Maps'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'App para estudar alguns recursos do google maps: Teste de marcadores, polígonos, e círculos',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _locationData != null
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapPage(
                    location: _locationData,
                  ),
                ),
              )
            : null,
        backgroundColor: Colors.deepPurpleAccent,
        label: Row(
          children: <Widget>[
            Text(
              'Começar',
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
